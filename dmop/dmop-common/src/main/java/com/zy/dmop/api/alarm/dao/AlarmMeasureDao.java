package com.zy.dmop.api.alarm.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;


public interface AlarmMeasureDao {
	//分页查询
	PageResult<AlarmMeasure> pageQueryAlarm(Page page);
	//插入配置条件
	public AlarmMeasure createMeasure(AlarmMeasure alarmMeasure);
	//删除对应配置条件
	public void deleteMeasure(int measureId);
	//更新配置条件
	public void updateMeasure(AlarmMeasure alarmMeasure);
	//根据id查询
	public AlarmMeasure getAlarmMeasureById(int measureId);
	//查所有条件
	public List<AlarmMeasure> getMeasure();
	
	public List<AlarmMeasure> getAllAlarmMeasureForCache();
	List<AlarmMeasure> getMeasureNameByIfActive(int strategyId);
}
