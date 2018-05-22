package com.zy.dmop.resource.app.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.resource.app.dao.LineGraphDao;
import com.zy.dmop.util.StringUtil;
@Component("lineGraphDao")
public class LineGraphDaoImpl extends NamedParameterJdbcDaoSupport implements LineGraphDao {

	@Override
	public List<AlarmLog> getAlarmLogs(List<Integer> orgIds, String terminalId, Date startTime, Date endTime) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition=new StringBuilder();
		sqlCondition.append(" from alarm_log where organization_id in(:orgIds) ");
		params.put("orgIds", orgIds);
		if(!StringUtil.isNullOrEmpty(terminalId)) {
			sqlCondition.append(" and device_name like :terminalId ");
			params.put("terminalId", "%"+terminalId+"%");
		}
		if (null!=startTime  ) {
    		sqlCondition.append("and create_date_time >= :startCreateDate ");
    		params.put("startCreateDate", startTime);
    	}
    	if ( null!= endTime) {
    		sqlCondition.append(" and create_date_time <= :endCreateDate ");
    		params.put("endCreateDate", endTime);
    	}
    	if(null==startTime&&null==endTime) {
    		sqlCondition.append(" and DATE_SUB(CURDATE(), INTERVAL 6 DAY) <= create_date_time ");
    	}
	    StringBuilder sql = new StringBuilder();
	    sql.append("select * ");
	    sql.append(sqlCondition.toString());
	    List<AlarmLog> list=getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<AlarmLog>(AlarmLog.class));
	    return list;
	}
	@Override
	public Map<String, Object> getPieValue(Date createDateTime, String terminalId, Date startTime, Date endTime) {
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String timeKey=df.format(createDateTime);
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition=new StringBuilder();
		sqlCondition.append(" from alarm_log ");
		sqlCondition.append(" where 1=1 ");
		if(!StringUtil.isNullOrEmpty(terminalId)) {
			sqlCondition.append(" and device_name like :terminalId ");
			params.put("terminalId", "%"+terminalId+"%");
		}
		if (null!=startTime  ) {
    		sqlCondition.append("and create_date_time >= :startCreateDate ");
    		params.put("startCreateDate", startTime);
    	}
    	if ( null!= endTime) {
    		sqlCondition.append(" and create_date_time <= :endCreateDate ");
    		params.put("endCreateDate", endTime);
    	}
    	if(null==startTime&&null==endTime) {
    		sqlCondition.append(" and DATE_SUB(CURDATE(), INTERVAL 6 DAY) <= create_date_time ");
    	}
	    StringBuilder sql = new StringBuilder();
	    sql.append("select count(*) ");
	    sql.append(sqlCondition.toString());
	    sql.append(" and create_date_time like :timeKey");
	    params.put("timeKey", timeKey+"%");
	    int count = getNamedParameterJdbcTemplate().queryForObject(sql.toString(), params, Integer.class);
	    Map<String,Object> lineValue=new HashMap<String, Object>();
	    lineValue.put(timeKey, count);
		return lineValue;
	}


}
