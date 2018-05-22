package com.zy.dmop.resource.alarm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmStrategyDao;
import com.zy.dmop.api.alarm.service.AlarmStrategyService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.AlarmStrategy;
import com.zy.dmop.model.ConditionStrategy;
@Component("alarmStrategyService")
public class AlarmStrategyServiceImpl implements AlarmStrategyService {
	@Autowired
	private AlarmStrategyDao alarmStrategyDao;
	@Override
	public PageResult<AlarmStrategy> pageQueryAlarm(Page page) throws ErrorMessageException {
		PageResult<AlarmStrategy> pageResult;
		pageResult = alarmStrategyDao.pageQueryAlarm(page);
		return pageResult;
	}
	@Override
	public AlarmStrategy createStrategy(AlarmStrategy alarmStrategy) {
		return alarmStrategyDao.createStrategy(alarmStrategy);
	}

	@Override
	public void deleteStrategy(int strategyId) {
		alarmStrategyDao.deleteStrategy(strategyId);
	}

	@Override
	public AlarmStrategy getStrategyById(int strategyId) {
		return alarmStrategyDao.getAlarmStrategyById(strategyId);
	}

	@Override
	public void updateStrategy(AlarmStrategy alarmStrategy) {
		alarmStrategyDao.updateStrategy(alarmStrategy);
	}

	@Override
	public int getAlarmStrategyById(int strategyId) {
		return 0;
	}
//暂停
	@Override
	public List<AlarmStrategy> getStrategy() {
		return alarmStrategyDao.getStrategy(0);
	}

//	@Override
//	public void addConditionNameToStrategy(List<AlarmCondition> conditionIds) {
//		for(int i=0;i<conditionIds.size();i++) {
//			AlarmCondition conditionid=conditionIds.get(i);
//			alarmStrategyDao.addNameToStrategy(conditionid);
//		}
//		
//	}
	@Override
	public void addStrategyId(int strategyId) {
		alarmStrategyDao.addStrategyId(strategyId);
		
	}
	@Override
	public void addConditionNameToStrategy(List<Integer> conditionIds, int strategyId) {
		for(int i=0;i<conditionIds.size();i++) {
			int conditionid=conditionIds.get(i);
			alarmStrategyDao.addNameToStrategy(conditionid,strategyId);
		}
	
	}
	
	@Override
	public void addMethodToStrategy(List<Integer> methodIds, int strategyId) {
		for(int i=0;i<methodIds.size();i++) {
			int methodId=methodIds.get(i);
			alarmStrategyDao.addMethodToStrategy(methodId,strategyId);
		}
	
	}
	
	@Override
	public List<AlarmMeasure> getMeasure(Integer Strategy) {
		// TODO Auto-generated method stub
		return alarmStrategyDao.getMeasure(Strategy);
	}
	
	@Override
	public void deleteMeasureStrategy(Integer StrategyId,Integer MeasureId) {
		alarmStrategyDao.deleteMeasureStrategy(StrategyId, MeasureId);
		
	}

}
