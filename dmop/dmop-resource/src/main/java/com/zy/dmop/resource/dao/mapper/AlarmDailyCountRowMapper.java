package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.AlarmDailyCount;



public class AlarmDailyCountRowMapper implements RowMapper<AlarmDailyCount> {

	@Override
	public AlarmDailyCount mapRow(ResultSet rs, int rowNum) throws SQLException {
		long day = rs.getTimestamp("day").getTime();
		int criticalCount = rs.getInt("critical_count");
		int majorCount = rs.getInt("major_count");
		int minorCount = rs.getInt("minor_count");
		int warningCount = rs.getInt("warning_count");
		
		AlarmDailyCount adc = new AlarmDailyCount();
		adc.setDay(day);
		adc.setCriticalCount(criticalCount);
		adc.setMajorCount(majorCount);
		adc.setMinorCount(minorCount);
		adc.setWarningCount(warningCount);
		return adc;
	}
}
