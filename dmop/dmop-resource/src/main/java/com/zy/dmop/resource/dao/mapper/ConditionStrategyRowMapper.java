package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.ConditionStrategy;

public class ConditionStrategyRowMapper implements RowMapper<ConditionStrategy>{

	@Override
	public ConditionStrategy mapRow(ResultSet rs, int rowNum) throws SQLException {
		ConditionStrategy conditionStrategy=new ConditionStrategy();
		Integer id = rs.getInt("id");
		Integer alarmConditionId = rs.getInt("alarm_condition_id");
		Integer alarmStrategyId = rs.getInt("alarm_strategy_id");
		
		conditionStrategy.setId(id);
		conditionStrategy.setAlarmConditioId(alarmConditionId);
		conditionStrategy.setAlarmStrategyId(alarmStrategyId);
		
		
		return conditionStrategy;
	}

}
