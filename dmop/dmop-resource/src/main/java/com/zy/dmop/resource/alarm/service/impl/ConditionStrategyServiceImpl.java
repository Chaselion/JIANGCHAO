package com.zy.dmop.resource.alarm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.ConditionStrategyDao;
import com.zy.dmop.api.alarm.service.ConditionStrategyService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.ConditionStrategy;
@Component("conditionStrategyService")
public class ConditionStrategyServiceImpl implements ConditionStrategyService {
	@Autowired
	private ConditionStrategyDao conditionStrategyDao;
	@Override
	public PageResult<ConditionStrategy> pageQueryAlarm(Page page) throws ErrorMessageException {
		// TODO Auto-generated method stub
		return conditionStrategyDao.pageQueryAlarm(page);
	}

	@Override
	public void deleteStrategy(int conditionId) {
		// TODO Auto-generated method stub
		conditionStrategyDao.deleteCondition(conditionId);
	}

	@Override
	public List<ConditionStrategy> getConditionIds(Integer strategyId) {
		// TODO Auto-generated method stub
		return conditionStrategyDao.getConditionIds(strategyId);
	}
	
	@Override
	public List<AlarmCondition> getCondition(Integer Strategy) {
		// TODO Auto-generated method stub
		return conditionStrategyDao.getCondition(Strategy);
	}
	
	@Override
	public void deleteConditionStrategy(Integer StrategyId,Integer ConditionId) {
		conditionStrategyDao.deleteConditionStrategy(StrategyId, ConditionId);
		
	}

	@Override
	public void delConditions(Integer strategyId,List<Integer> conditionIds) {
		for(int i = 0;i<conditionIds.size();i++) {
			int conditionid=conditionIds.get(i);
			conditionStrategyDao.deleteConditionStrategy(strategyId, conditionid);
		}
		
	}

	@Override
	public void delete(int strategyId) {
		conditionStrategyDao.delete(strategyId);
		
	}

}
