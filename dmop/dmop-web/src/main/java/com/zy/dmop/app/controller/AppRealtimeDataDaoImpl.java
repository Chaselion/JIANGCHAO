package com.zy.dmop.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

@Component("appRealtimeDataDao")
public class AppRealtimeDataDaoImpl extends NamedParameterJdbcDaoSupport implements AppRealtimeDataDao {

	@Override
	public String queryById(Integer id) {
		String sql = new StringBuffer()
				.append("select ")
				.append("terminal_num ")
				.append("from ")
				.append("terminal ")
				.append("where terminal_id=:id")
				.toString();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		System.out.println("sql=="+sql );
		String terminalId=getNamedParameterJdbcTemplate().queryForObject(sql, params, String.class);
		System.out.println("terminalId=="+terminalId );
		
		return terminalId;
	}

}
