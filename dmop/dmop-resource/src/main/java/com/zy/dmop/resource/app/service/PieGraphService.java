package com.zy.dmop.resource.app.service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.zy.dmop.model.AlarmLog;

public interface PieGraphService {
	public HashSet<Map<String, Object>> getAlarmLogs(Integer organizationId,String terminalId
			,Date startTime,Date endTime);
}
