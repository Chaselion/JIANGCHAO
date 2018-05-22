package com.zy.dmop.resource.alarm.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.MeasureStrategyDao;
import com.zy.dmop.api.alarm.service.MeasureStrategyService;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.MeasureStrategy;
@Component("measureStrategyService")
public class MeasureStrategyServiceImpl implements MeasureStrategyService{
	@Autowired
	private MeasureStrategyDao measureStrategyDao;
	
	@Override
	public void deleteMeasure(int alarmMeasureId) {
		measureStrategyDao.deleteMeasure(alarmMeasureId);
	};
	@Override
	public List<MeasureStrategy> getMeasureStrategy(Integer alarmStrategyId){
		return measureStrategyDao.getMeasureStrategy(alarmStrategyId);
	}
	@Override
	public List<AlarmMeasure> getMeasure(Integer alarmStrategyId){
		return measureStrategyDao.getMeasure(alarmStrategyId);
	}
	
	@Override
	public void deleteMeasureStrategy(Integer alarmStrategyId,Integer alarmMeasureId) {
		measureStrategyDao.deleteMeasureStrategy(alarmStrategyId, alarmMeasureId);
	}
	@Override
	public PageResult<MeasureStrategy> pageQueryAlarm(Page page) {
		// TODO Auto-generated method stub
		return measureStrategyDao.pageQueryAlarm(page);
	}
	@Override
	public void delConditions(Integer strategyId,List<Integer> methodIds) {
		for(int i = 0;i<methodIds.size();i++) {
			int method=methodIds.get(i);
			measureStrategyDao.deleteMeasureStrategy(strategyId, method);
		}
		
		
	}
	@Override
	public void delete(int strategyId) {
		measureStrategyDao.delete(strategyId);
		
	};
}
