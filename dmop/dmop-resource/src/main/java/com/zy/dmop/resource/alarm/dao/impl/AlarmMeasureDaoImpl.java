package com.zy.dmop.resource.alarm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmMeasureDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
@Component("alarmMeasureDao")
public class AlarmMeasureDaoImpl extends NamedParameterJdbcDaoSupport implements AlarmMeasureDao {

	@Override
	public PageResult<AlarmMeasure> pageQueryAlarm(Page page) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_ALARM_MEASURE);
		if(cache != null && cache.size() > 0) {
			List<AlarmMeasure> ml = new ArrayList<>();
			for(Object o : cache) {
				ml.add((AlarmMeasure)o);
			}
			page.setCount(cache.size());
			ml = ml.subList(page.getStart(), (page.getStart() + page.getLimit()) > ml.size() ? ml.size() : (page.getStart() + page.getLimit()));
			PageResult<AlarmMeasure> pr = new PageResult<AlarmMeasure>(page, ml);
			return pr;
		}else {
			Map<String, Object> params = new HashMap<String, Object>();
			StringBuilder sqlCondition = new StringBuilder();
			sqlCondition.append("from alarm_measure ");
			StringBuilder sql = new StringBuilder();
			sql.append("select * ");
			sql.append(sqlCondition.toString());
			sql.append("limit " + page.getStart() + ", " + page.getLimit());
			StringBuilder sqlCount = new StringBuilder();
			sqlCount.append("select count(*) ");
			sqlCount.append(sqlCondition.toString());
			List<AlarmMeasure> list=getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<AlarmMeasure>(AlarmMeasure.class));
			int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
			page.setCount(count);
			PageResult<AlarmMeasure> pr = new PageResult<AlarmMeasure>(page, list);
			return pr;
		}
	}

	@Override
	public AlarmMeasure createMeasure(final AlarmMeasure alarmMeasure) {
		final String sql = "insert into alarm_measure "
				+" (name, message, email, voice, when_trigger, when_relieve,if_active,note,format,typeID) "
				+" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int count = getJdbcTemplate().update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				int i = 0;
	            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            ps.setString(++i, alarmMeasure.getName());
	            ps.setInt(++i, alarmMeasure.getMessage());
	            ps.setInt(++i, alarmMeasure.getEmail());
	            ps.setInt(++i, alarmMeasure.getVoice());
	            ps.setInt(++i, alarmMeasure.getWhenTrigger());
	            ps.setInt(++i, alarmMeasure.getWhenRelieve());
	            ps.setInt(++i, alarmMeasure.getIfActive());
//	            ps.setDate(++i, new Date(alarmMeasure.getCreateDateTime().getTime()));
//	            ps.setDate(++i, new Date(alarmMeasure.getModifyDateTime().getTime()));
	            ps.setString(++i, alarmMeasure.getNote());
	            ps.setString(++i, alarmMeasure.getFormat());
	            ps.setInt(++i, alarmMeasure.getTypeID());
				return ps;
			}
		}, keyHolder);
		alarmMeasure.setAlarmMeasureId(keyHolder.getKey().intValue());
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_MEASURE, alarmMeasure.getAlarmMeasureId(), alarmMeasure);
		return alarmMeasure;
	}

	@Override
	public void deleteMeasure(int measureId) {
		String sql = "delete from alarm_measure where alarm_measure_id=:measureId";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("measureId", measureId);
		
		getNamedParameterJdbcTemplate().update(sql, params);
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_MEASURE, measureId, null);
	}

	@Override
	public void updateMeasure(final AlarmMeasure alarmMeasure) {
		String sql = "update alarm_measure set  name=:name, "
				+ " when_trigger=:whenTrigger, when_relieve=:whenRelieve, "
				+ " if_active=:ifActive, note=:note , format=:format, typeID=:typeID"
				+ " where alarm_measure_id=:alarmMeasureId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", alarmMeasure.getName());
	/*	params.put("message", alarmMeasure.getMessage());*/
	/*	params.put("email", alarmMeasure.getEmail());*/
	/*	params.put("voice", alarmMeasure.getVoice());*/
		params.put("whenTrigger", alarmMeasure.getWhenTrigger());
		params.put("whenRelieve", alarmMeasure.getWhenRelieve());
		params.put("ifActive", alarmMeasure.getIfActive());
	/*	params.put("createDateTime", alarmMeasure.getCreateDateTime());
		params.put("modifyDateTime", alarmMeasure.getModifyDateTime());
		params.put("note", alarmMeasure.getNote());*/
		params.put("note", alarmMeasure.getNote());
		params.put("alarmMeasureId", alarmMeasure.getAlarmMeasureId());
		params.put("format", alarmMeasure.getFormat());
		params.put("typeID", alarmMeasure.getTypeID());
		getNamedParameterJdbcTemplate().update(sql, params);
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_MEASURE, alarmMeasure.getAlarmMeasureId(), alarmMeasure);
	}

	@Override
	public AlarmMeasure getAlarmMeasureById(int measureId) {
		Object o = CacheUtil.getModel(CacheConstant.MODEL_ALARM_MEASURE, measureId);
		if(o != null) {
			return (AlarmMeasure)o;
		}else {			
			String sql = "select * from alarm_measure where alarm_measure_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", measureId);
			List<AlarmMeasure> alarmMeasure = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmMeasure>(AlarmMeasure.class));
			if (alarmMeasure == null || alarmMeasure.size() != 1) {
				return null;
			} else {
				return alarmMeasure.get(0);
			}
		}
	}

	@Override
	public List<AlarmMeasure> getMeasure() {
		return null;
	}
	
	@Override
	public List<AlarmMeasure> getMeasureNameByIfActive(int strategyId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", strategyId);
		String sql = "select * from alarm_measure where if_active=1 and alarm_measure_id not in(select alarm_measure_id from measure_strategy where measure_strategy.alarm_measure_id=alarm_measure.alarm_measure_id and measure_strategy.alarm_strategy_id=:id)";
		List<AlarmMeasure> alarmMeasure = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmMeasure>(AlarmMeasure.class));
		return alarmMeasure;
	}

	@Override
	public List<AlarmMeasure> getAllAlarmMeasureForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from alarm_measure";
		List<AlarmMeasure> alarmMeasure = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmMeasure>(AlarmMeasure.class));
		return alarmMeasure;
	}

}
