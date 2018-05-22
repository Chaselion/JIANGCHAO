package com.zy.dmop.resource.dao.mapper;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.RealTimeLog;
import com.zy.dmop.model.SystemLog;

public class RealtimeLogRowMapper implements RowMapper<RealTimeLog>{
	
	@Override 
	public RealTimeLog mapRow(ResultSet rs,int rowNum)throws SQLException{
		RealTimeLog realtimeLog = new RealTimeLog();
		Long realtimeLogId = rs.getLong("id");
		String ClassType = rs.getString("ClassType");
		String Method = rs.getString("Method");
		Date CreateTime = rs.getDate("CreateTime");
		String LogLevel = rs.getString("LogLevel");
		String MSG = rs.getString("MSG");
		
		realtimeLog.setId(realtimeLogId);
		realtimeLog.setClassType(ClassType);
		realtimeLog.setMethod(Method);
		realtimeLog.setLogLevel(LogLevel);
		realtimeLog.setCreateTime(CreateTime);
		realtimeLog.setMsg(MSG);
		return realtimeLog;	
	}

}
