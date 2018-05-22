package com.zy.dmop.api.alarm.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.AlarmLevel;


public interface AlarmLevelDao {
	//分页查询
	PageResult<AlarmLevel> pageQueryAlarm(Page page);
	//插入配置条件
	public AlarmLevel createLevel(AlarmLevel alarmLevel);
	//删除对应配置条件
	public void deleteLevel(int levelId);
	//更新配置条件
	public void updateLevel(AlarmLevel alarmLevel);
	//根据id查询
	public AlarmLevel getAlarmLevelById(int levelId);
	//查所有条件
	public List<AlarmLevel> getLevel();
}
