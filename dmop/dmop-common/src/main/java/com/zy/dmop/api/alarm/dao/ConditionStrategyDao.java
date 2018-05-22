package com.zy.dmop.api.alarm.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.ConditionStrategy;

public interface ConditionStrategyDao {
	//分页查询
	PageResult<ConditionStrategy> pageQueryAlarm(Page page);
	
	//删除对应配置条件
	public void deleteCondition(int Id);
	
	public List<ConditionStrategy> getConditionStrategy(Integer Strategy);
	
	public List<AlarmCondition> getCondition(Integer Strategy);
	
	public List<ConditionStrategy> getAllConditionStrategyForCache();
	
	public void deleteConditionStrategy(Integer StrategyId,Integer ConditionId);


	List<ConditionStrategy> getConditionIds(Integer strategyId);

	void delete(int strategyId);

}
