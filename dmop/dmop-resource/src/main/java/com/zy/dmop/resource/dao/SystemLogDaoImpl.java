package com.zy.dmop.resource.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.SystemLogDao;
import com.zy.dmop.model.SystemLog;
import com.zy.dmop.resource.dao.mapper.SystemLogRowMapper;
import com.zy.dmop.util.DatatablePage;
import com.zy.dmop.util.StringUtil;

@Component("systemLogDao")
public class SystemLogDaoImpl extends NamedParameterJdbcDaoSupport implements SystemLogDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void delSystemLogById(Long systemLogId) {
		String sql = "delete from system_log where system_log_id=:systemLogId";
		
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("systemLogId", systemLogId);
		
		getNamedParameterJdbcTemplate().update(sql, params);

	}


	@Override
	public PageResult<SystemLog> pageQuerySystemLog(String startCreateDateStr,String endCreateDateStr,Page page) {
		Map<String, Object> params = new HashMap<String, Object>();

		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from system_log where level!='INFO' ");
		
		
		if (!StringUtil.isNullOrEmpty( startCreateDateStr) ) {
    		sqlCondition.append("and create_date_time >= :startCreateDate ");
    		params.put("startCreateDate", startCreateDateStr);
    	}
    	if (!StringUtil.isNullOrEmpty( endCreateDateStr) ) {
    		sqlCondition.append(" and create_date_time <= :endCreateDate ");
    		params.put("endCreateDate", endCreateDateStr);
    	}

		StringBuilder sql = new StringBuilder();
		sql.append(" select * ");
		sql.append(sqlCondition.toString());
		sql.append(" order by create_date_time desc limit " + page.getStart() + ", " + page.getLimit());

		StringBuilder sqlCount = new StringBuilder();
		sqlCount.append("select count(*) ");
		sqlCount.append(sqlCondition.toString());
		List<SystemLog> list = getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<SystemLog>(SystemLog.class));
		int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);

		page.setCount(count);
		PageResult<SystemLog> pr = new PageResult<SystemLog>(page, list);
		return pr;
	}

	
	@Override
	public List<SystemLog> getSystemLogs() {
		final String sql = "select * from system_log where level!='INFO' order by create_date_time desc";
		
		List<SystemLog> types = jdbcTemplate.query(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement ps = con.prepareStatement(sql);
				return ps;
			}
			
		}, new SystemLogRowMapper());
		
		return types;
	}
	
}
