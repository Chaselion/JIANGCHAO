package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.SimCardTerminalRelative;

public class SimCardCarRelativeRowMapper implements RowMapper<SimCardTerminalRelative>{

	@Override
	public SimCardTerminalRelative mapRow(ResultSet rs, int rowNum) throws SQLException {
		SimCardTerminalRelative simCardCarRelative=new SimCardTerminalRelative();
		long cardId=rs.getLong("card_id");
		String terminalId=rs.getString("terminal_num");
		simCardCarRelative.setCardId(cardId);
		simCardCarRelative.setTerminalNum(terminalId);
		return simCardCarRelative;
	}

}
