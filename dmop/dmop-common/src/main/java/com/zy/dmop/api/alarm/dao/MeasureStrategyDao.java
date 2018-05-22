package com.zy.dmop.api.alarm.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.MeasureStrategy;

public interface MeasureStrategyDao {
	//分页查询
	public PageResult<MeasureStrategy> pageQueryAlarm(Page page);
	
	public void deleteMeasure(int alarmMeasureId);
	
	public List<MeasureStrategy> getMeasureStrategy(Integer alarmStrategyId);
	
	public List<MeasureStrategy> getAllMeasureStrategyForCache();

	public List<AlarmMeasure> getMeasure(Integer alarmStrategyId);

	public void deleteMeasureStrategy(Integer alarmStrategyId,Integer alarmMeasureId);

	public void delConditions(int method);

	public void delete(int strategyId);
}
