package com.zy.dmop.resource.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.HistoryDataDao;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.DeviceProperity;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.SystemLog;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.model.vo.HistoryDataVO;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
import com.zy.dmop.resource.dao.mapper.HistoryDataRowMapper;
import com.zy.dmop.util.StringUtil;

@Component("historyDataDao")
public class HistoryDataDaoImpl extends NamedParameterJdbcDaoSupport implements HistoryDataDao {
	private static Logger log = Logger.getLogger(HistoryDataDaoImpl.class);
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void deleteHistoryData(Long id) {
		String sql = "delete from history_data where id=?";
		
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("id", id);
		
		getNamedParameterJdbcTemplate().update(sql, params);

	}


	@Override
	public PageResult<HistoryData> pageQueryHistoryData(String upsType,Page page) {
		Map<String, Object> params = new HashMap<String, Object>();

		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from history_data where 1=1 ");
		
		
		if (!StringUtil.isNullOrEmpty(upsType)) {
			sqlCondition.append("and ups_type like :upsType ");
			params.put("upsType", "%" + upsType + "%");
		}

		StringBuilder sql = new StringBuilder();
		sql.append(" select * ");
		sql.append(sqlCondition.toString());
		sql.append(" order by create_date_time desc limit " + page.getStart() + ", " + page.getLimit());

		StringBuilder sqlCount = new StringBuilder();
		sqlCount.append("select count(*) ");
		sqlCount.append(sqlCondition.toString());

		List<HistoryData> list = getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<HistoryData>(HistoryData.class));
		int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);

		page.setCount(count);
		PageResult<HistoryData> pr = new PageResult<HistoryData>(page, list);
		return pr;
	}
	
	@Override
	public List<HistoryData> getHistoryDatas() {
		final String sql = "select * from history_data order by create_date_time desc";
		
		List<HistoryData> types = jdbcTemplate.query(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement ps = con.prepareStatement(sql);
				return ps;
			}
			
		}, new HistoryDataRowMapper());
		
		return types;
	}
	


	@Override
	public PageResult<HistoryDataVO> pageQueryHistoryDataVO(String terminalName, Page page,List<Integer> aorgIds) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from history_data h where h.custom_id in(:orgIds)");
		params.put("orgIds", aorgIds);
		
		if (!StringUtil.isNullOrEmpty(terminalName)) {
			sqlCondition.append("and h.terminal_id like :terminalName ");
			params.put("terminalName", "%" + terminalName + "%");
		}

		StringBuilder sql = new StringBuilder();
		sql.append(" select h.create_date_time,h.terminal_id,h.dump_energy,h.input_voltage,h.output_voltage,h.input_frequency,h.work_load,h.inner_temperature,h.log_time,h.ups_hardware,h.custom_id");
		sql.append(sqlCondition.toString());
		sql.append(" order by h.log_time desc limit " + page.getStart() + ", " + page.getLimit());
		StringBuilder sqlCount = new StringBuilder();
		sqlCount.append("select count(*) ");
		sqlCount.append(sqlCondition.toString());
		List<HistoryDataVO> list = getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<HistoryDataVO>(HistoryDataVO.class));
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_TERMINAL);
		for(HistoryDataVO vo : list) {
			String tID = vo.getTerminalId();
			if(cache != null && cache.size() > 0) {
				for(Object o : cache) {
					Terminal t = (Terminal)o;
					if(t != null && t.getTerminalNum() != null 
							&& t.getTerminalNum().equals(tID)) {
						vo.setTerminal_name(t.getTerminalName());
					}
				}
			}else {
				vo.setTerminal_name("");
			}
			int oID = vo.getCustomId();
			Object o = CacheUtil.getModel(CacheConstant.MODEL_ORGANIZATION, oID);
			vo.setCname(o != null ? ((Organization)o).getName() : "");
		}
		int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
		page.setCount(count);
		PageResult<HistoryDataVO> pr = new PageResult<HistoryDataVO>(page, list);
		return pr;
		}
	private HistoryDataVO turnVo(HistoryData historyData,Map<String,String> terminalNums) throws IllegalArgumentException, IllegalAccessException {
		HistoryDataVO historyDataVO = new HistoryDataVO();
		for(Field cdvF : historyDataVO.getClass().getDeclaredFields()) {
			String cdvFName = cdvF.getName();
			cdvF.setAccessible(true);
			for(Field field : historyData.getClass().getDeclaredFields()) {
				String acFName = field.getName();
				if(acFName.equals(cdvFName)) {
					field.setAccessible(true);
					cdvF.set(historyDataVO, field.get(historyData));;
				}
			}
			if("cname".equals(cdvFName)) {
				Object dcO = CacheUtil.getModel(CacheConstant.MODEL_ORGANIZATION, historyData.getCustomId());
				cdvF.set(historyDataVO, dcO != null ? ((Organization)dcO).getName() : "");;
			}
			if("terminal_name".equals(cdvFName)) {

				cdvF.set(historyDataVO, terminalNums.get(historyData.getTerminalId()));;
					
				
			}
		}
		return historyDataVO;
	}

	@Override
	public List<HistoryDataVO> getHistoryExcelDatas(List<Integer> aorgIds,String startDate,String endDate,String terminal) {
		/*Date as1=new Date();
		 Calendar calendar1 = Calendar.getInstance();
		 Calendar calendar2 = Calendar.getInstance();
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		  calendar1.add(Calendar.DATE, -2);
		  calendar2.add(Calendar.DATE, 1);
		  String threeDaysAgo = sdf.format(calendar1.getTime());
		  String todayTime=sdf.format(calendar2.getTime());*/
		 
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from history_data h where h.custom_id in(:orgIds) ");
		Map<String, Object> params = new HashMap<String, Object>();
		if (!StringUtil.isNullOrEmpty(terminal)) {
			sqlCondition.append("and h.terminal_id like :terminalName ");
			params.put("terminalName", "%" + terminal + "%");
		}
		if (!StringUtil.isNullOrEmpty( startDate) ) {
			sqlCondition.append(" and h.log_time >= :startDate ");
			params.put("startDate", startDate);
		}
		if (!StringUtil.isNullOrEmpty( endDate) ) {
			sqlCondition.append(" and h.log_time <= :endDate ");
			endDate=endDate+" 23:59:59";
			params.put("endDate", endDate);
		}
		params.put("orgIds", aorgIds);
		//params.put("startCreateDate", threeDaysAgo);
		//params.put("endCreateDate", todayTime);
		StringBuilder sql = new StringBuilder();
		sql.append(" select h.terminal_id,h.dump_energy,h.input_voltage,h.output_voltage,h.work_load,h.inner_temperature,h.input_frequency,h.log_time,h.ups_factory_info,h.custom_id ");
		sql.append(sqlCondition.toString());
		sql.append(" order by h.log_time desc ");
		List<HistoryDataVO> list=getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<HistoryDataVO>(HistoryDataVO.class));
		/*Date as2=new Date();
		long a1=as1.getTime();
		long a2=as2.getTime();
		log.info("ddd"+(a2-a1));*/
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_TERMINAL);
		for(HistoryDataVO vo : list) {
			String tID = vo.getTerminalId();
			if(cache != null && cache.size() > 0) {
				for(Object o : cache) {
					Terminal t = (Terminal)o;
					if(t != null && t.getTerminalNum() != null 
							&& t.getTerminalNum().equals(tID)) {
						vo.setTerminal_name(t.getTerminalName());
					}
				}
			}else {
				vo.setTerminal_name("");
			}
			int oID = vo.getCustomId();
			Object o = CacheUtil.getModel(CacheConstant.MODEL_ORGANIZATION, oID);
			vo.setCname(o != null ? ((Organization)o).getName() : "");
		}
		return list;
	}


	@Override
	public List<HistoryDataVO> getHistory(List<Integer> aorgIds) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from history_data h,terminal t,organization o where h.custom_id in(:orgIds) and h.terminal_id = t.terminal_num and h.custom_id=o.organization_id ");
		params.put("orgIds", aorgIds);

		StringBuilder sql = new StringBuilder();
		sql.append(" select h.custom_id,h.create_date_time,h.terminal_id,h.dump_energy,h.input_voltage,h.output_voltage,h.input_frequency,h.work_load,h.inner_temperature,h.log_time,h.ups_hardware,o.name cname,t.terminal_name ");
		sql.append(sqlCondition.toString());
		sql.append(" order by h.log_time desc " );
		
		List<HistoryDataVO> list = getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<HistoryDataVO>(HistoryDataVO.class));
		return list;
	}


	@Override
	public int getHistorynum(List<Integer> aorgIds) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from history_data h,terminal t,organization o where h.custom_id in(:orgIds) and h.terminal_id = t.terminal_num and h.custom_id=o.organization_id ");
		params.put("orgIds", aorgIds);
		StringBuilder sqlCount = new StringBuilder();
		sqlCount.append("select count(*) ");
		sqlCount.append(sqlCondition.toString());
		
		int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
	
		return count;
	}


	@Override
	public List<HistoryData> getAllHistoryDataForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from history_data order by log_time desc";
		List<HistoryData> historyDatas = getNamedParameterJdbcTemplate().query(sql, params,
				new BeanPropertyRowMapper<HistoryData>(HistoryData.class));
		return historyDatas;
	}
}