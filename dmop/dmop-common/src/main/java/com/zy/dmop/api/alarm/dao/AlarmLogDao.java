package com.zy.dmop.api.alarm.dao;

import java.sql.Date;
import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmLog;


public interface AlarmLogDao {

	PageResult<AlarmLog> pageQueryAlarm(Page page,Date startCreateDate,Date endCreateDate,List<Integer> orgIds);
	public List<AlarmLog> getAlarmLogs(List<Integer> orgIds);
	AlarmLog createLog(AlarmLog alarmLog);
	void deleteLog(int logId);
	void updateLog(AlarmLog alarmLog);
	AlarmLog getAlarmLogById(int logId);
	List<AlarmLog> getLog();
	void update(int count,String time,String terminalId);
	AlarmLog getAlarm(String terminlId);
	int getInfo(String terminalId, String date, Double value);
	void updateLog(String terminalId, String conditionName, String date, Integer isRelieve,
			String message);
	public Integer getRelieve(String terminalId,Double value);
	public void updateConfirm(String terminalId,Double value,String username);
	
}
