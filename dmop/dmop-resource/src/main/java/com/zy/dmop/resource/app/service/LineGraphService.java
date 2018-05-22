package com.zy.dmop.resource.app.service;

import java.util.Date;
import java.util.HashSet;
import java.util.Map;

public interface LineGraphService {
	public HashSet<Map<String,Object>> getAlarmLogs(Integer organizationId,String terminalId
			,Date startTime,Date endTime);
}
