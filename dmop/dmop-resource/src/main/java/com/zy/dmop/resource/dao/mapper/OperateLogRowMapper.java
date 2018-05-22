package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.OperateLog;


public class OperateLogRowMapper implements RowMapper<OperateLog>{

	@Override
	public OperateLog mapRow(ResultSet rs, int rowNum) throws SQLException {
		OperateLog operateLog = new OperateLog();
		Integer operateLogId = rs.getInt("operate_log_id");
		Integer organizationId = rs.getInt("organization_id");
		Integer userId = rs.getInt("user_id");
		String text = rs.getString("text");
		Date createDateTime=rs.getDate("create_Date_Time");
		Date modifyDateTime=rs.getDate("modify_Date_Time");
		
		operateLog.setOperateLogId(operateLogId);
		operateLog.setOrganizationId(organizationId);
		operateLog.setUserId(userId);
		operateLog.setText(text);
		operateLog.setCreateDateTime(createDateTime);
		operateLog.setModifyDateTime(modifyDateTime);
		return operateLog;
	}

}