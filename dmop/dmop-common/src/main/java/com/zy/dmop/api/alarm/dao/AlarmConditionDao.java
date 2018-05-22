package com.zy.dmop.api.alarm.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.model.vo.ConditionProperityVo;


public interface AlarmConditionDao {
	//分页查询
	PageResult<ConditionDeviceVo> pageQueryAlarm(Page page);
	//插入配置条件
	public AlarmCondition createCondition(AlarmCondition alarmCondition);
	//删除对应配置条件
	public void deleteCondition(int conditionId);
	//更新配置条件
	public void updateCondition(AlarmCondition alarmCondition);
	//根据id查询
	public AlarmCondition getAlarmConditionById(int conditionId);
	//查所有条件
	public List<AlarmCondition> getCondition();
	
	public List<AlarmCondition> getAllAlarmConditionForCache();
	List<AlarmCondition> getConditionNameByIfActive(int strategyId);
	
	List<Integer> getDeviceProIds(List<ConditionStrategy> conditionIds);
	
	List<AlarmCondition> getAllByIds(int conditionId);
	
	int getProPerityIdByName(String engName);
	
	List<AlarmCondition> getAllByProId(int properityId);
	List<ConditionProperityVo> getConDeviceVo(Integer id);
}
