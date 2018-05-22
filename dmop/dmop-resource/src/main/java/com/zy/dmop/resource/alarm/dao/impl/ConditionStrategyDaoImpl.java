package com.zy.dmop.resource.alarm.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmConditionDao;
import com.zy.dmop.api.alarm.dao.ConditionStrategyDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
import com.zy.dmop.resource.dao.mapper.ConditionStrategyRowMapper;
@Component("conditionStrategyDao")
public class ConditionStrategyDaoImpl extends NamedParameterJdbcDaoSupport implements ConditionStrategyDao {

	@Autowired
	private AlarmConditionDao alarmConditionDao;
	
	@Override
	public PageResult<ConditionStrategy> pageQueryAlarm(Page page) {
		
		return null;
	}

	@Override
	public void deleteCondition(int id) {
		String sql = "delete from condition_strategy where alarm_condition_id=:conditionId";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("conditionId", id);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_CONDITION_STRATEGY);
		if(cache != null && cache.size() > 0) {
			for(Object object : cache) {
				ConditionStrategy ms = (ConditionStrategy)object;
				if(ms.getAlarmConditioId() == id) {
					CacheUtil.updateModel(CacheConstant.MODEL_CONDITION_STRATEGY, ms.getId(), null);
				}
			}
		}
	}




	@Override
	public List<ConditionStrategy> getConditionIds(Integer strategyId) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_CONDITION_STRATEGY);
		if(cache != null && cache.size() > 0) {
			List<ConditionStrategy> list = new ArrayList<>();
			for(Object object : cache) {
				ConditionStrategy ms = (ConditionStrategy)object;
				if(ms.getAlarmStrategyId() == strategyId) {
					list.add(ms);
				}
			}
			return list;
		}else {
			String sql = "select * from condition_strategy where alarm_strategy_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", strategyId);
			List<ConditionStrategy> alarmCondition =getNamedParameterJdbcTemplate().query(sql, params,new ConditionStrategyRowMapper()); 
			return alarmCondition;
		}
	}
	
	@Override
	public List<ConditionStrategy> getConditionStrategy(Integer Strategy) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_CONDITION_STRATEGY);
		if(cache != null && cache.size() > 0) {
			List<ConditionStrategy> list = new ArrayList<>();
			for(Object object : cache) {
				ConditionStrategy ms = (ConditionStrategy)object;
				if(ms.getAlarmStrategyId() == Strategy) {
					list.add(ms);
				}
			}
			return list;
		}else {
			String sql = "select * from condition_strategy where alarm_strategy_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", Strategy);
			List<ConditionStrategy> alarmCondition =getNamedParameterJdbcTemplate().query(sql, params,new ConditionStrategyRowMapper()); 
			return alarmCondition;
		}
	}
	@Override
	public List<AlarmCondition> getCondition(Integer Strategy) {
		List<ConditionStrategy> conditionStrategys=getConditionStrategy( Strategy);
		int i=0;
		List<AlarmCondition> lists=new ArrayList<AlarmCondition>();
	    for(i=0;i<conditionStrategys.size();i++) {
	    	AlarmCondition a= alarmConditionDao.getAlarmConditionById(conditionStrategys.get(i).getAlarmConditioId());
	    	lists.add(a);
	    }
		return lists;
	}
	@Override
	public void deleteConditionStrategy(Integer strategyId,Integer conditionId) {
        final String sql = "delete from condition_strategy where alarm_condition_id=:conditionId and alarm_strategy_id=:strategyId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("strategyId", strategyId);
		params.put("conditionId", conditionId);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_CONDITION_STRATEGY);
		if(cache != null && cache.size() > 0) {
			for(Object object : cache) {
				ConditionStrategy ms = (ConditionStrategy)object;
				if(ms.getAlarmConditioId() == conditionId && ms.getAlarmStrategyId() == strategyId) {
					CacheUtil.updateModel(CacheConstant.MODEL_CONDITION_STRATEGY, ms.getId(), null);
				}
			}
		}
	}

	@Override
	public void delete(int strategyId) {
		final String sql = "delete from condition_strategy where alarm_strategy_id=:strategyId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("strategyId", strategyId);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_CONDITION_STRATEGY);
		if(cache != null && cache.size() > 0) {
			for(Object object : cache) {
				ConditionStrategy ms = (ConditionStrategy)object;
				if(ms.getAlarmStrategyId() == strategyId) {
					CacheUtil.updateModel(CacheConstant.MODEL_CONDITION_STRATEGY, ms.getId(), null);
				}
			}
		}
	}

	@Override
	public List<ConditionStrategy> getAllConditionStrategyForCache() {
		String sql = "select * from condition_strategy";
		Map<String, Object> params = new HashMap<String, Object>();
		List<ConditionStrategy> conditionStrategys = getNamedParameterJdbcTemplate().query(sql, params, new ConditionStrategyRowMapper());
		return conditionStrategys;
	}
}
