package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.MeasureStrategy;

public interface MeasureStrategyService {
	public PageResult<MeasureStrategy> pageQueryAlarm(Page page);
	
	public void deleteMeasure(int alarmMeasureId);

	public List<MeasureStrategy> getMeasureStrategy(Integer alarmStrategyId);

	public List<AlarmMeasure> getMeasure(Integer alarmStrategyId);

	public void deleteMeasureStrategy(Integer alarmStrategyId,Integer alarmMeasureId);

	public void delConditions(Integer strategyId, List<Integer> methodIds);

	public void delete(int strategyId);
}
