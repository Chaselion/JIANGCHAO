package com.zy.dmop.resource.alarm.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmMeasureDao;
import com.zy.dmop.api.alarm.dao.MeasureStrategyDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.MeasureStrategy;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
import com.zy.dmop.resource.dao.mapper.MeasureStrategyRowMapper;

@Component("measureStrategyDao")
public class MeasureStrategyDaoImpl extends NamedParameterJdbcDaoSupport implements MeasureStrategyDao {

	@Autowired
	private AlarmMeasureDao alarmMeasureDao;
	
	@Override
	public PageResult<MeasureStrategy> pageQueryAlarm(Page page) {
		return null;
	}

	@Override
	public void deleteMeasure(int alarmMeasureId) {
		String sql = "delete from measure_strategy where alarm_measure_id=:alarmMeasureId";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("alarmMeasureId", alarmMeasureId);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_MEASURE_STRATEGY);
		if(cache != null && cache.size() > 0) {
			for(Object object : cache) {
				MeasureStrategy ms = (MeasureStrategy)object;
				if(ms.getAlarmMeasureId() == alarmMeasureId) {
					CacheUtil.updateModel(CacheConstant.MODEL_MEASURE_STRATEGY, ms.getId(), null);
				}
			}
		}
	}

	@Override
	public List<MeasureStrategy> getMeasureStrategy(Integer alarmStrategyId) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_MEASURE_STRATEGY);
		if(cache != null && cache.size() > 0) {
			List<MeasureStrategy> list = new ArrayList<>();
			for(Object object : cache) {
				MeasureStrategy ms = (MeasureStrategy)object;
				if(ms.getAlarmStrategyId() == alarmStrategyId) {
					list.add(ms);
				}
			}
			return list;
		}else {			
			String sql = "select * from measure_strategy where alarm_strategy_id=:alarmStrategyId ";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("alarmStrategyId", alarmStrategyId);
			List<MeasureStrategy> measureStrategys = getNamedParameterJdbcTemplate().query(sql, params, new MeasureStrategyRowMapper());
			return measureStrategys;
		}
	}
	@Override
	public List<AlarmMeasure> getMeasure(Integer alarmStrategyId) {
		List<MeasureStrategy> measureStrategys = getMeasureStrategy(alarmStrategyId);
		List<AlarmMeasure> lists = new ArrayList<AlarmMeasure>();
	    for(int i = 0; i<measureStrategys.size(); i++) {
	    	AlarmMeasure a = alarmMeasureDao.getAlarmMeasureById(measureStrategys.get(i).getAlarmMeasureId());
	    	lists.add(a);
	    }
		return lists;
	}
	@Override
	public void deleteMeasureStrategy(Integer alarmStrategyId,Integer alarmMeasureId) {
        final String sql = "delete from measure_strategy where alarm_measure_id=:alarmMeasureId and alarm_strategy_id=:alarmStrategyId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("alarmStrategyId", alarmStrategyId);
		params.put("alarmMeasureId", alarmMeasureId);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_MEASURE_STRATEGY);
		if(cache != null && cache.size() > 0) {
			for(Object object : cache) {
				MeasureStrategy ms = (MeasureStrategy)object;
				if(ms.getAlarmMeasureId() == alarmMeasureId && ms.getAlarmStrategyId() == alarmStrategyId) {
					CacheUtil.updateModel(CacheConstant.MODEL_MEASURE_STRATEGY, ms.getId(), null);
				}
			}
		}
	}

	@Override
	public void delConditions(int method) {
		final String sql = "delete from measure_strategy where alarm_measure_id=:alarmMeasureId ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("alarmMeasureId", method);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_MEASURE_STRATEGY);
		if(cache != null && cache.size() > 0) {
			for(Object object : cache) {
				MeasureStrategy ms = (MeasureStrategy)object;
				if(ms.getAlarmMeasureId() == method) {
					CacheUtil.updateModel(CacheConstant.MODEL_MEASURE_STRATEGY, ms.getId(), null);
				}
			}
		}
	}

	@Override
	public void delete(int strategyId) {
		final String sql = "delete from measure_strategy where alarm_strategy_id=:strategyId ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("strategyId", strategyId);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_MEASURE_STRATEGY);
		if(cache != null && cache.size() > 0) {
			for(Object object : cache) {
				MeasureStrategy ms = (MeasureStrategy)object;
				if(ms.getAlarmStrategyId() == strategyId) {
					CacheUtil.updateModel(CacheConstant.MODEL_MEASURE_STRATEGY, ms.getId(), null);
				}
			}
		}
	}

	@Override
	public List<MeasureStrategy> getAllMeasureStrategyForCache() {
		String sql = "select * from measure_strategy";
		Map<String, Object> params = new HashMap<String, Object>();
		List<MeasureStrategy> measureStrategys = getNamedParameterJdbcTemplate().query(sql, params, new MeasureStrategyRowMapper());
		return measureStrategys;
	}

	

}
