package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.AlarmLogVo;
import com.zy.dmop.model.vo.ConditionProperityVo;

public interface AlarmLogService {

	PageResult<AlarmLog> pageQueryAlarm(Page page,String startCreateDateStr,String endCreateDateStr,Integer organizationId) throws ErrorMessageException;
	
	
	public List<AlarmLog> getAlarmLogs(Integer organizationId);


	AlarmLog createLog(String terminlId,ConditionProperityVo conditionDeviceVo,Double value);


	void deleteLog(int id);


	AlarmLog getLogById(int logId);


	void updateLog(AlarmLog alarmLog);


	int getAlarmLogById(int logId);


	List<AlarmLog> getLog();


	void updateDataNum(int count,String terminalId);


	void updateLog(String string, ConditionProperityVo conditionDeviceVo, Double value, String date);


	boolean getAlarmLogByInfo(String string, String date, Double value);
	
	boolean judgeRelieveByterminalId(String terminalId,Double value);
	
	public void updateConfirm(String terminalId,Double value,String username);
}
