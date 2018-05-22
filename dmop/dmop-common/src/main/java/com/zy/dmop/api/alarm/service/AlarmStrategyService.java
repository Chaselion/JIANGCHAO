package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.AlarmStrategy;

public interface AlarmStrategyService {

	public PageResult<AlarmStrategy> pageQueryAlarm(Page page) throws ErrorMessageException;

	public AlarmStrategy createStrategy(AlarmStrategy alarmStrategy);
	
	public void deleteStrategy(int strategyId);
	
	public AlarmStrategy getStrategyById(int strategyId);
    
    public void updateStrategy(AlarmStrategy alarmStrategy);

	public int getAlarmStrategyById(int strategyId);
	
	public List<AlarmStrategy> getStrategy();

	public void addConditionNameToStrategy(List<Integer> conditionIds, int strategyId);

	public void addMethodToStrategy(List<Integer> methodIds, int strategyId);
	
	public void addStrategyId(int strategyId);

	List<AlarmMeasure> getMeasure(Integer Strategy);

	void deleteMeasureStrategy(Integer StrategyId, Integer MeasureId);
}
