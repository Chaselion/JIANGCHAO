package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.MeasureStrategy;

public class MeasureStrategyRowMapper implements RowMapper<MeasureStrategy>{
	@Override
	public MeasureStrategy mapRow(ResultSet rs, int rowNum) throws SQLException {
		MeasureStrategy measureStrategy=new MeasureStrategy();
		Integer id = rs.getInt("id");
		Integer alarmMeasureId = rs.getInt("alarm_measure_id");
		Integer alarmStrategyId = rs.getInt("alarm_strategy_id");
		
		measureStrategy.setId(id);
		measureStrategy.setAlarmMeasureId(alarmMeasureId);
		measureStrategy.setAlarmStrategyId(alarmStrategyId);
		
		
		return measureStrategy;
	}
}
