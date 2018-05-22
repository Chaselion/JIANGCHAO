package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.SimCardOperator;


public class SimCardOperatorRowMapper implements RowMapper<SimCardOperator>{

	@Override
	public SimCardOperator mapRow(ResultSet rs, int rowNum) throws SQLException {
		SimCardOperator operator = new SimCardOperator();
		long operatorId = rs.getLong("sim_card_operator_id");
		String operatorName = rs.getString("operator_name");
		String description = rs.getString("description");
		Integer customId = rs.getInt("custom_id");
		Date createDateTime=rs.getDate("create_date_time");
		Date modifyDateTime=rs.getDate("modify_date_time");
		
		operator.setSimCardOperatorId(operatorId);
		operator.setOperatorName(operatorName);
		operator.setDescription(description);
		operator.setCustomId(customId);
		operator.setCreateDateTime(createDateTime);
		operator.setModifyDateTime(modifyDateTime);
		return operator;
	}

}
