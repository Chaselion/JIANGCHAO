package com.zy.dmop.resource.alarm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmLevelDao;
import com.zy.dmop.api.alarm.service.AlarmLevelService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmLevel;

@Component("alarmLevelService")
public class AlarmLevelServiceImpl implements AlarmLevelService {
	@Autowired
	private AlarmLevelDao alarmLevelDao;
	@Override
	public PageResult<AlarmLevel> pageQueryAlarm(Page page) throws ErrorMessageException {
		PageResult<AlarmLevel> pageResult=alarmLevelDao.pageQueryAlarm(page);
		return pageResult;
	}

	@Override
	public AlarmLevel createLevel(AlarmLevel alarmLevel) {
		return alarmLevelDao.createLevel(alarmLevel);
	}

	@Override
	public void deleteLevel(int levelId) {
		alarmLevelDao.deleteLevel(levelId);
	}

	@Override
	public AlarmLevel getLevelById(int levelId) {
		return alarmLevelDao.getAlarmLevelById(levelId);
	}

	@Override
	public void updateLevel(AlarmLevel alarmLevel) {
		alarmLevelDao.updateLevel(alarmLevel);
	}

	@Override
	public int getAlarmLevelById(int levelId) {
		return 0;
	}

	@Override
	public List<AlarmLevel> getLevel() {
		return alarmLevelDao.getLevel();
	}

}
