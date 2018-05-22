package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmLevel;

public interface AlarmLevelService {

	public PageResult<AlarmLevel> pageQueryAlarm(Page page) throws ErrorMessageException;

	public AlarmLevel createLevel(AlarmLevel alarmLevel);
	
	public void deleteLevel(int levelId);
	
	public AlarmLevel getLevelById(int levelId);
    
    public void updateLevel(AlarmLevel alarmLevel);

	public int getAlarmLevelById(int levelId);
	
	public List<AlarmLevel> getLevel();
}
