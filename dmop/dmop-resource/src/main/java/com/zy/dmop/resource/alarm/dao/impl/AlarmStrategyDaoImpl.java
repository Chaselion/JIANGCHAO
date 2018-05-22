package com.zy.dmop.resource.alarm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmMeasureDao;
import com.zy.dmop.api.alarm.dao.AlarmStrategyDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.AlarmStrategy;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.model.MeasureStrategy;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
@Component("alarmStrategyDao")
public class AlarmStrategyDaoImpl extends NamedParameterJdbcDaoSupport implements AlarmStrategyDao {
	@Autowired
	private AlarmMeasureDao alarmMeasureDao;
	
	@Override
	public PageResult<AlarmStrategy> pageQueryAlarm(Page page) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_ALARM_STRATEGY);
		if(cache != null && cache.size() > 0) {
			List<AlarmStrategy> ml = new ArrayList<>();
			for(Object o : cache) {
				ml.add((AlarmStrategy)o);
			}
			page.setCount(cache.size());
			ml = ml.subList(page.getStart(), (page.getStart() + page.getLimit()) > ml.size() ? ml.size() : (page.getStart() + page.getLimit()));
			PageResult<AlarmStrategy> pr = new PageResult<AlarmStrategy>(page, ml);
			return pr;
		}else {
			Map<String, Object> params = new HashMap<String, Object>();
			StringBuilder sqlCondition = new StringBuilder();
			sqlCondition.append("from alarm_strategy ");
			StringBuilder sql = new StringBuilder();
			sql.append("select * ");
			sql.append(sqlCondition.toString());
			sql.append("limit " + page.getStart() + ", " + page.getLimit());
			StringBuilder sqlCount = new StringBuilder();
			sqlCount.append("select count(*) ");
			sqlCount.append(sqlCondition.toString());
			
			List<AlarmStrategy> list=getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<AlarmStrategy>(AlarmStrategy.class));
			int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
			page.setCount(count);
			PageResult<AlarmStrategy> pr = new PageResult<AlarmStrategy>(page, list);
			return pr;
		}
	}

	@Override
	public AlarmStrategy createStrategy(final AlarmStrategy alarmStrategy) {
		final String sql = "insert into alarm_strategy "
				+ "(name, if_active,  note)  "
				+ "values(?, ?, ?) ";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int count = getJdbcTemplate().update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				int i = 0;
	            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
/*	            ps.setInt(++i, alarmStrategy.getAlarmMeasureId());*/
	            ps.setString(++i, alarmStrategy.getName());
/*	            ps.setDate(++i, new Date(alarmStrategy.getCreateDateTime().getTime()));
	            ps.setDate(++i, new Date(alarmStrategy.getModifyDateTime().getTime()));*/
	            ps.setInt(++i, alarmStrategy.getIfActive());
	            ps.setString(++i, alarmStrategy.getNote());
				return ps;
			}
		}, keyHolder);
		alarmStrategy.setAlarmStrategyId(keyHolder.getKey().intValue());
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_STRATEGY, alarmStrategy.getAlarmStrategyId(), alarmStrategy);
		return alarmStrategy;
	}

	@Override
	public void deleteStrategy(int strategyId) {
		String sql = "delete from alarm_strategy where alarm_strategy_id=:strategyId";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("strategyId", strategyId);
		
		getNamedParameterJdbcTemplate().update(sql, params);
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_STRATEGY, strategyId, null);
	}

	@Override
	public void updateStrategy(final AlarmStrategy alarmStrategy) {
		String sql = "update alarm_strategy set name=:name, if_active=:ifActive, note=:note "
				+ "where alarm_strategy_id=:strategyId";
		Map<String, Object> params = new HashMap<String, Object>();
/*		params.put("alarmMeasureId", alarmStrategy.getAlarmMeasureId());*/
		params.put("name", alarmStrategy.getName());
/*		params.put("createDateTime", alarmStrategy.getCreateDateTime());
		params.put("modifyDateTime", alarmStrategy.getModifyDateTime());*/
		params.put("ifActive", alarmStrategy.getIfActive());
		params.put("note", alarmStrategy.getNote());
		params.put("strategyId", alarmStrategy.getAlarmStrategyId());
		getNamedParameterJdbcTemplate().update(sql, params);
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_STRATEGY, alarmStrategy.getAlarmStrategyId(), alarmStrategy);
	}

	@Override
	public AlarmStrategy getAlarmStrategyById(int strategyId) {
		Object object = CacheUtil.getModel(CacheConstant.MODEL_ALARM_STRATEGY, strategyId);
		if(object != null) {
			return (AlarmStrategy)object;
		}else {
			String sql = "select * from alarm_strategy where alarm_strategy_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", strategyId);
			AlarmStrategy a=new AlarmStrategy();
			List<AlarmStrategy> alarmStrategy = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmStrategy>(AlarmStrategy.class));
			if (alarmStrategy == null || alarmStrategy.size() != 1) {
				return a;
			} else {
				return alarmStrategy.get(0);
			} 
		}
	}

	@Override
	public List<AlarmStrategy> getStrategy(int strategyId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AlarmStrategy> selectAllAlarmStrategy() {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_ALARM_STRATEGY);
		if(cache != null && cache.size() > 0) {
			List<AlarmStrategy> asl = new ArrayList<>();
			for(Object o : cache) {
				asl.add((AlarmStrategy)o);
			}
			return asl;
		}else {
			String sql = new StringBuffer()
					.append("select ")
					.append("	* ")
					.append("from ")
					.append("	alarm_strategy ")
					.toString();
			List<AlarmStrategy> list = getJdbcTemplate().query(sql, new BeanPropertyRowMapper<AlarmStrategy>(AlarmStrategy.class));
			return list;
		}
	}



	@Override
	public void addStrategyId(int strategyId) {
		String sql = "insert into condition_strategy (alarm_strategy_id)  values(?)";
		getJdbcTemplate().execute(sql);
	} 

	@Override
	public void addNameToStrategy(final int conditionid, final int strategyId) {
		final String sql = "insert into condition_strategy ( alarm_condition_id, alarm_strategy_id ) values(?, ? )";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int count = getJdbcTemplate().update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				int i = 0;
	            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            ps.setInt(++i, conditionid);
	            ps.setInt(++i, strategyId);
				return ps;
			}
		}, keyHolder);
		int id = keyHolder.getKey().intValue();
		ConditionStrategy cs = new ConditionStrategy();
		cs.setId(id);
		cs.setAlarmConditioId(conditionid);
		cs.setAlarmStrategyId(strategyId);
		CacheUtil.updateModel(CacheConstant.MODEL_CONDITION_STRATEGY, id, cs);
	}
	

	@Override
	public void addMethodToStrategy(final int methodId, final int strategyId) {
		final String sql = "insert into measure_strategy ( alarm_measure_id, alarm_strategy_id ) values(?, ? )";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int count = getJdbcTemplate().update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				int i = 0;
	            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            ps.setInt(++i, methodId);
	            ps.setInt(++i, strategyId);
				return ps;
			}
		}, keyHolder);
		int id = keyHolder.getKey().intValue();
		MeasureStrategy ms = new MeasureStrategy();
		ms.setId(id);
		ms.setAlarmMeasureId(methodId);
		ms.setAlarmStrategyId(strategyId);
		CacheUtil.updateModel(CacheConstant.MODEL_MEASURE_STRATEGY, id, ms);
	}
	
	@Override
	public List<MeasureStrategy> getMeasureStrategy(Integer strategy) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_MEASURE_STRATEGY);
		if(cache != null && cache.size() > 0) {
			List<MeasureStrategy> ml = new ArrayList<>();
			for(Object object : cache) {
				MeasureStrategy ms = (MeasureStrategy)object;
				if(ms.getAlarmStrategyId() == strategy) {
					ml.add(ms);
				}
			}
			return ml;
		}else {
			String sql = "select * from measure_strategy where alarm_strategy_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", strategy);
			List<MeasureStrategy> measureStrategys = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<MeasureStrategy>(MeasureStrategy.class));
			return measureStrategys;
		}
	}
	@Override
	public List<AlarmMeasure> getMeasure(Integer strategy) {
		List<MeasureStrategy> measureStrategys=getMeasureStrategy( strategy);
		int i=0;
		List<AlarmMeasure> lists=new ArrayList<AlarmMeasure>();
	    for(i=0;i<measureStrategys.size();i++) {
	    	AlarmMeasure alarmMeasure= alarmMeasureDao.getAlarmMeasureById(measureStrategys.get(i).getAlarmMeasureId());
	    	lists.add(alarmMeasure);
	    }
		return lists;
	}

	@Override
	public void deleteMeasureStrategy(Integer strategyId,Integer measureId) {
        final String sql = "delete from measure_strategy where alarm_measure_id=:measureId and alarm_strategy_id=:strategyId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("strategyId", strategyId);
		params.put("measureId", measureId);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_MEASURE_STRATEGY);
		if(cache != null && cache.size() > 0) {
			for(Object object : cache) {
				MeasureStrategy ms = (MeasureStrategy)object;
				if(ms.getAlarmStrategyId() == strategyId && ms.getAlarmMeasureId() == measureId) {
					CacheUtil.updateModel(CacheConstant.MODEL_MEASURE_STRATEGY, ms.getId(), null);
				}
			}
		}
	}

	@Override
	public List<AlarmStrategy> getAllAlarmStrategyForCache() {
		String sql ="select * from alarm_strategy";
		List<AlarmStrategy> list = getJdbcTemplate().query(sql, new BeanPropertyRowMapper<AlarmStrategy>(AlarmStrategy.class));
		return list;	
	}


}
