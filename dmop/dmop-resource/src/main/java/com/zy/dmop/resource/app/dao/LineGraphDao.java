package com.zy.dmop.resource.app.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.zy.dmop.model.AlarmLog;

public interface LineGraphDao {


	List<AlarmLog> getAlarmLogs(List<Integer> aorgIds, String terminalId, Date startTime, Date endTime);

	Map<String, Object> getPieValue(Date createDateTime, String terminalId, Date startTime, Date endTime);
	
}
