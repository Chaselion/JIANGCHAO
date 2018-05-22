package com.zy.dmop.resource.dao.mapper;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.SystemLog;

public class SystemLogRowMapper implements RowMapper<SystemLog>{
	
	@Override 
	public SystemLog mapRow(ResultSet rs,int rowNum)throws SQLException{
		SystemLog systemLog = new SystemLog();
		Long systemLogId = rs.getLong("system_log_id");
		String level = rs.getString("level");
		String module = rs.getString("module");
		String text = rs.getString("text");
		Date createDateTime = rs.getDate("create_date_time");
		Date modifyDateTime = rs.getDate("modify_date_time");
		
		systemLog.setSystemLogId(systemLogId);
		systemLog.setLevel(level);
		systemLog.setModule(module);
		systemLog.setText(text);
		systemLog.setCreateDateTime(createDateTime);
		systemLog.setModifyDateTime(modifyDateTime);
		return systemLog;	
	}

}
