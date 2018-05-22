package com.zy.dmop.api.alarm.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.AlarmStrategy;
import com.zy.dmop.model.MeasureStrategy;


public interface AlarmStrategyDao {
	//分页查询
	PageResult<AlarmStrategy> pageQueryAlarm(Page page);
	//插入配置条件
	public AlarmStrategy createStrategy(AlarmStrategy alarmStrategy);
	//删除对应配置条件
	public void deleteStrategy(int strategyId);
	//更新配置条件
	public void updateStrategy(AlarmStrategy alarmStrategy);
	//根据id查询
	public AlarmStrategy getAlarmStrategyById(int strategyId);
	//查所有条件
	public List<AlarmStrategy> getStrategy(int strategyId);
	
	public List<AlarmStrategy> selectAllAlarmStrategy();
	public List<AlarmStrategy> getAllAlarmStrategyForCache();
	void addNameToStrategy(final int conditionid,final int strategyId);
	
	void addStrategyId(int strategyId);
	List<MeasureStrategy> getMeasureStrategy(Integer Strategy);
	List<AlarmMeasure> getMeasure(Integer Strategy);
	void deleteMeasureStrategy(Integer StrategyId, Integer MeasureId);
	void addMethodToStrategy(int methodId, int strategyId);
}
