package com.zy.dmop.resource.dao;

import java.sql.Date;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.AlarmDailyCount;
import com.zy.dmop.resource.dao.mapper.AlarmDailyCountRowMapper;


@Component("alarmStatisticDao")
public class AlarmStatisticDao extends NamedParameterJdbcDaoSupport {

	
	public List<AlarmDailyCount> getRecentAlarmDailyCounts(long tenantId, int limit) {
		String sql = "select * from alarm_daily_count where tenant_id=? order by day desc limit 0, " + limit;
		List<AlarmDailyCount> alarmDailyCounts = getJdbcTemplate().query(sql, new AlarmDailyCountRowMapper(), tenantId);
		Collections.reverse(alarmDailyCounts);
		return alarmDailyCounts;
	}
	
	
}
