package com.zy.dmop.resource.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.OperateLogDao;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.DeviceProperity;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.SystemLog;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.model.vo.OperateCusUserVo;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
import com.zy.dmop.resource.dao.mapper.OperateLogRowMapper;
import com.zy.dmop.util.StringUtil;

@Component("operateLogDao")
public class OperateLogDaoImpl extends NamedParameterJdbcDaoSupport implements OperateLogDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void deleteOperateLog(Long operateLogId) {
		String sql = "delete from operate_log where operate_log_id=:operateLogId";
		
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("operateLogId", operateLogId);
		
		getNamedParameterJdbcTemplate().update(sql, params);

	}



	@Override
	public PageResult<OperateCusUserVo> pageQueryOperateLog(String startCreateDateStr,String endCreateDateStr,Page page,List<Integer> aorgIds) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_OPERATE_LOG);
		if (cache != null && cache.size() > 0 && StringUtil.isNullOrEmpty( startCreateDateStr) && StringUtil.isNullOrEmpty( endCreateDateStr)) {

			List<OperateCusUserVo> list = new ArrayList<>();
			for (Object o : cache) {
				OperateLog operateLog = (OperateLog) o;
				if (aorgIds.contains(operateLog.getOrganizationId())) {
					try {
						OperateCusUserVo cdv = turnVo(operateLog);
						list.add(cdv);
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					}
				}
			}
			page.setCount(list.size());
			int end=list.size()-page.getStart();
			int end1=page.getStart()+page.getLimit();
			list = list.subList(
					page.getStart(),
					page.getLimit() > end ? list.size() : end1);
			PageResult<OperateCusUserVo> pr = new PageResult<OperateCusUserVo>(page, list);
			return pr;
		} else {
		Map<String, Object> params = new HashMap<String, Object>();

		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from operate_log a ");
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select a.operate_log_id,a.text, a.create_date_time, a.modify_date_time, b.name, c.username ");
		sql.append(sqlCondition.toString());
		sql.append("LEFT JOIN organization b ON a.organization_id = b.organization_id ");
		sql.append("LEFT JOIN user c ON a.user_id = c.user_id  ");
		params.put("aorgIds", aorgIds);
		sql.append(" where a.organization_id in (:aorgIds) ");
		if (!StringUtil.isNullOrEmpty( startCreateDateStr) ) {
			sql.append(" and a.modify_date_time >= :startCreateDate ");
			params.put("startCreateDate", startCreateDateStr);
		}
		if (!StringUtil.isNullOrEmpty( endCreateDateStr) ) {
			sql.append(" and a.modify_date_time <= :endCreateDate ");
			params.put("endCreateDate", endCreateDateStr);
		}
		sql.append(" order by a.modify_date_time desc limit " + page.getStart() + ", " + page.getLimit());

		StringBuilder sqlCount = new StringBuilder();
		sqlCount.append("select count(*) ");
		sqlCount.append(sqlCondition.toString());
		sqlCount.append("LEFT JOIN organization b ON a.organization_id = b.organization_id ");
		sqlCount.append("LEFT JOIN user c ON a.user_id = c.user_id ");
		sqlCount.append(" where a.organization_id in (:aorgIds) ");
		if (!StringUtil.isNullOrEmpty( startCreateDateStr) ) {
			sqlCount.append(" and a.modify_date_time >= :startCreateDate ");
			params.put("startCreateDate", startCreateDateStr);
		}
		if (!StringUtil.isNullOrEmpty( endCreateDateStr) ) {
			sqlCount.append(" and a.modify_date_time <= :endCreateDate ");
			params.put("endCreateDate", endCreateDateStr);
		}
		List<OperateCusUserVo> list = getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<OperateCusUserVo>(OperateCusUserVo.class));
		int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
		page.setCount(count);
		PageResult<OperateCusUserVo> pr = new PageResult<OperateCusUserVo>(page, list);
		return pr;
	}
		}
	private OperateCusUserVo turnVo(OperateLog ac) throws IllegalArgumentException, IllegalAccessException {
		OperateCusUserVo cdv = new OperateCusUserVo();
		for(Field cdvF : cdv.getClass().getDeclaredFields()) {
			String cdvFName = cdvF.getName();
			cdvF.setAccessible(true);
			for(Field field : ac.getClass().getDeclaredFields()) {
				String acFName = field.getName();
				if(acFName.equals(cdvFName)) {
					field.setAccessible(true);
					cdvF.set(cdv, field.get(ac));;
				}
			}
			if("name".equals(cdvFName)) {
				Object dcO = CacheUtil.getModel(CacheConstant.MODEL_ORGANIZATION, ac.getOrganizationId());
				cdvF.set(cdv, dcO != null ? ((Organization)dcO).getName() : "");;
			}
			if("userName".equals(cdvFName)) {
				Object dpO = CacheUtil.getModel(CacheConstant.MODEL_USER, ac.getUserId());
				cdvF.set(cdv, dpO != null ? ((User)dpO).getUsername() : "");;
			}
		}
		return cdv;
	}
	
	@Override
	public List<OperateLog> getOperateLogs() {
		final String sql = "select * from operate_log order by create_date_time desc";
		
		List<OperateLog> types = jdbcTemplate.query(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement ps = con.prepareStatement(sql);
				return ps;
			}
			
		}, new OperateLogRowMapper());
		
		return types;
	}
	
	@Override
	public void insertOperateLog(OperateLog operateLog) {
		String insertSql =  "insert into operate_log(user_id,create_date_time,text,organization_id,modify_date_time) values(:userId,:createDateTime,:text,:organizationId,:modifyDateTime)";
	
			try {
				KeyHolder keyHolder = new GeneratedKeyHolder();
				getNamedParameterJdbcTemplate().update(insertSql, new BeanPropertySqlParameterSource(operateLog),keyHolder);
				int id = keyHolder.getKey().intValue();
				operateLog.setOperateLogId(id);
				CacheUtil.updateModel(CacheConstant.MODEL_OPERATE_LOG,id,operateLog);
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}



	@Override
	public List<OperateCusUserVo> exportOperateLog(List<Integer> aorgIds) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();

		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from operate_log a ");
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select a.operate_log_id,a.text, a.create_date_time, a.modify_date_time, b.name, c.username ");
		sql.append(sqlCondition.toString());
		sql.append("LEFT JOIN organization b ON a.organization_id = b.organization_id ");
		sql.append("LEFT JOIN user c ON a.user_id = c.user_id  ");
		sql.append("where a.organization_id in (:aorgIds)  ");
		sql.append(" order by a.modify_date_time desc ");
		params.put("aorgIds", aorgIds);
		
		List<OperateCusUserVo> list = getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<OperateCusUserVo>(OperateCusUserVo.class));
		
		return list;
	}



	@Override
	public List<OperateLog> getAllOperateLogForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from operate_log order by create_date_time desc";
		List<OperateLog> operateLog = getNamedParameterJdbcTemplate().query(sql, params,
				new BeanPropertyRowMapper<OperateLog>(OperateLog.class));
		return operateLog;
	}
}
