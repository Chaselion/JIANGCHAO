package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.model.vo.ConditionProperityVo;

public interface AlarmConditionService {

	public PageResult<ConditionDeviceVo> pageQueryAlarm(Page page) throws ErrorMessageException;

	public AlarmCondition createCondition(AlarmCondition alarmCondition);
	
	public void deleteCondition(int conditionId);
	
	/*public AlarmCondition getConditionById(int conditionId);*/
    
    public void updateCondition(AlarmCondition alarmCondition);

	public AlarmCondition getAlarmConditionById(int conditionId);
	
	public List<AlarmCondition> getLevel();

	public List<AlarmCondition> getConditionNameByIfActive(int strategyId);

	public List<AlarmCondition> getALLByIds(List<ConditionStrategy> conditionIds);

	public List<Integer> getDeviceProIds(List<ConditionStrategy> conditionIds);

	public List<AlarmCondition> getALLByProIds(String engName);

	public List<ConditionProperityVo> getConDeviceVo(Integer conditionId);
}
