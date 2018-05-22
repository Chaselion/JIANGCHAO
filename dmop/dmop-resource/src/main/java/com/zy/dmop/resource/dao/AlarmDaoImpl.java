package com.zy.dmop.resource.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.IAlarmDao;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.DailyCount;
import com.zy.dmop.model.DataNum;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;


@Component("AlarmDao")
public class AlarmDaoImpl extends NamedParameterJdbcDaoSupport implements IAlarmDao{

	@Override
	public DailyCount selectDailyCountToday(String time) {
		String sql = new StringBuffer()
				.append("select ")
				.append("	* ")
				.append("from ")  
				.append("	daily_count ")
				.append("where Time=? ")
				.toString();

		DailyCount dailyCount=null;
		try {
			dailyCount = getJdbcTemplate().queryForObject(sql.toString(),new Object[]{time},  new BeanPropertyRowMapper<>(DailyCount.class));
		} catch (EmptyResultDataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dailyCount;
	}

	@Override
	public List<DataNum> selectDataNumToday(String time,List<String> terminals) {
		String sql = "select * from data_num where  logTime=:time and terminalId in(:terminals)";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("time", time);
    	params.put("terminals", terminals);
		List<DataNum> dataNum = null;
		try {
			dataNum = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<DataNum>(DataNum.class));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (dataNum == null) {
			return null;
		} else {
			return dataNum;
		}
	}
	
	@Override
	public List<Terminal> getTerminals() {
		StringBuilder sql = new StringBuilder();
    	sql.append("select * from terminal ");
  
		return getNamedParameterJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Terminal>(Terminal.class));
	}
	@Override
	public List<Terminal> getonlineTerminals(List<String> terminals) {
		StringBuilder sql = new StringBuilder();
    	sql.append("select terminal_id from terminal where icon=1 and terminal_num in(:terminals)");
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("terminals", terminals);
		return getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<Terminal>(Terminal.class));
	}

	@Override
	public List<DataNum> getAllData(List<String> terminalIds) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from data_num where DATE_SUB(CURDATE(), INTERVAL 6 DAY) <= logTime and terminalId in (:terminalIds)");
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("terminalIds", terminalIds);
		List<DataNum> dataNum=getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<DataNum>(DataNum.class));
		return dataNum;
	}
}
