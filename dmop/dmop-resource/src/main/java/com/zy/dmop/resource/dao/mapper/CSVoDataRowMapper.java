package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.vo.ConditionStrategyVo;
import com.zy.dmop.model.HistoryData;

public class CSVoDataRowMapper implements RowMapper<ConditionStrategyVo>{

	@Override
	public ConditionStrategyVo mapRow(ResultSet rs, int rowNum) throws SQLException {
		String condition_name = rs.getString("condition_name");
		String note = rs.getString("note");
		Integer alarm_condition_id=rs.getInt("alarm_condition_id");
		Integer alarm_conditionId=rs.getInt("alarm_conditionId");
		Integer alarm_strategyId=rs.getInt("alarm_strategyId");
		ConditionStrategyVo conditionStrategyVo = new ConditionStrategyVo();
		conditionStrategyVo.setAlarm_condition_id(alarm_condition_id);
		conditionStrategyVo.setAlarm_conditionId(alarm_conditionId);
		conditionStrategyVo.setAlarm_strategyId(alarm_strategyId);
		conditionStrategyVo.setCondition_name(condition_name);
		conditionStrategyVo.setNote(note);
		
		return conditionStrategyVo;
	}

}
