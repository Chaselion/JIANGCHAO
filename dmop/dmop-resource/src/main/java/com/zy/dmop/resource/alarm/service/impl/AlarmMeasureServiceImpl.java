package com.zy.dmop.resource.alarm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmMeasureDao;
import com.zy.dmop.api.alarm.service.AlarmMeasureService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.AlarmMeasure;
@Component("alarmMeasureService")
public class AlarmMeasureServiceImpl implements AlarmMeasureService {
	@Autowired
	private AlarmMeasureDao alarmMeasureDao;
	@Override
	public PageResult<AlarmMeasure> pageQueryAlarm(Page page) throws ErrorMessageException {
		PageResult<AlarmMeasure> pageResult;
		pageResult = alarmMeasureDao.pageQueryAlarm(page);
		return pageResult;
	}

	@Override
	public AlarmMeasure createMeasure(AlarmMeasure alarmMeasure) {
		return alarmMeasureDao.createMeasure(alarmMeasure);
	}

	@Override
	public void deleteMeasure(int measureId) {
		alarmMeasureDao.deleteMeasure(measureId);
	}

	@Override
	public AlarmMeasure getMeasureById(int measureId) {
		return alarmMeasureDao.getAlarmMeasureById(measureId);
	}

	@Override
	public void updateMeasure(AlarmMeasure alarmMeasure) {
		alarmMeasureDao.updateMeasure(alarmMeasure);
	}

	@Override
	public int getAlarmMeasureById(int measureId) {
		return 0;
	}

	@Override
	public List<AlarmMeasure> getMeasure() {
		return alarmMeasureDao.getMeasure();
	}

	@Override
	public List<AlarmMeasure> getMeasureNameByIfActive(int strategyId) {
		// TODO Auto-generated method stub
		return alarmMeasureDao.getMeasureNameByIfActive(strategyId);
	}
}
