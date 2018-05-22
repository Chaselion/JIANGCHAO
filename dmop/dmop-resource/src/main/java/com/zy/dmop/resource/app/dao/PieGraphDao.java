package com.zy.dmop.resource.app.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.zy.dmop.model.AlarmLog;

public interface PieGraphDao {

	List<AlarmLog> getAlarmLogs(List<Integer> aorgIds,String terminalId
			,Date startTime,Date endTime);

	Map<String, Object> getPieValue(String conditionName, String terminalId, Date startTime, Date endTime);
	
}
