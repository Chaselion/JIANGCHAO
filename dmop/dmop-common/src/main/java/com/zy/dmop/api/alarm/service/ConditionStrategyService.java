package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.ConditionStrategy;

public interface ConditionStrategyService {
	public PageResult<ConditionStrategy> pageQueryAlarm(Page page) throws ErrorMessageException;
	
	public void deleteStrategy(int conditionId);

	public List<ConditionStrategy> getConditionIds(Integer strategyId);
	public List<AlarmCondition> getCondition(Integer Strategy);
	
	public void deleteConditionStrategy(Integer StrategyId,Integer ConditionId);

	public void delConditions(Integer strategyId,List<Integer> conditionIds);

	public void delete(int strategyId);
}
