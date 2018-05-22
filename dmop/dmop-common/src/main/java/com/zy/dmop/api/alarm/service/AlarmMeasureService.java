package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;

public interface AlarmMeasureService {

	public PageResult<AlarmMeasure> pageQueryAlarm(Page page) throws ErrorMessageException;

	public AlarmMeasure createMeasure(AlarmMeasure alarmMeasure);
	
	public void deleteMeasure(int measureId);
	
	public AlarmMeasure getMeasureById(int measureId);
    
    public void updateMeasure(AlarmMeasure alarmMeasure);

	public int getAlarmMeasureById(int measureId);
	
	public List<AlarmMeasure> getMeasure();

	List<AlarmMeasure> getMeasureNameByIfActive(int strategyId);
}
