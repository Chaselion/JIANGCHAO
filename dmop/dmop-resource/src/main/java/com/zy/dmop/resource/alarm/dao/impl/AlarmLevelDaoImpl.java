package com.zy.dmop.resource.alarm.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmLevelDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmLevel;
@Component("alarmLevelDao")
public class AlarmLevelDaoImpl extends NamedParameterJdbcDaoSupport implements AlarmLevelDao {

	@Override
	public PageResult<AlarmLevel> pageQueryAlarm(Page page) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition = new StringBuilder();
	    sqlCondition.append("from alarm_level ");
	    StringBuilder sql = new StringBuilder();
	    sql.append("select * ");
	    sql.append(sqlCondition.toString());
	    sql.append("limit " + page.getStart() + ", " + page.getLimit());
	    StringBuilder sqlCount = new StringBuilder();
	    sqlCount.append("select count(*) ");
	    sqlCount.append(sqlCondition.toString());
			
	    List<AlarmLevel> list=getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<AlarmLevel>(AlarmLevel.class));
	    int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
	    page.setCount(count);
		PageResult<AlarmLevel> pr = new PageResult<AlarmLevel>(page, list);
		return pr;
	}

	@Override
	public AlarmLevel createLevel(final AlarmLevel alarmLevel) {
		final String sql = "insert into alarm_level "
				+" (level, parent_id, level_name, create_date_time, modify_date_time, note) "
				+" values(?, ?, ?, ?, ?, ? ) ";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int count = getJdbcTemplate().update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				int i = 0;
	            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            ps.setInt(++i, alarmLevel.getLevel());
	            ps.setInt(++i, alarmLevel.getParentId());
	            ps.setString(++i, alarmLevel.getLevelName());
	            ps.setDate(++i, new Date(alarmLevel.getCreateDateTime().getTime()));
	            ps.setDate(++i, new Date(alarmLevel.getModifyDateTime().getTime()));
	            ps.setString(++i, alarmLevel.getNote());
				return ps;
			}
		}, keyHolder);
		return alarmLevel;
	}

	@Override
	public void deleteLevel(int levelId) {
		String sql = "delete from alarm_level where alarm_level_id=:levelId";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("levelId", levelId);
		
		getNamedParameterJdbcTemplate().update(sql, params);

	}

	@Override
	public void updateLevel(final AlarmLevel alarmLevel) {
		String sql = "update alarm_level set  level=:level, parent_id=:parentId, level_name=:levelName,"
				+ " create_date_time=:createDateTime, modify_date_time=:modifyDateTime, note=:note "
				+ "where alarm_level_id=:levelId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("level", alarmLevel.getLevel());
		params.put("parentId", alarmLevel.getParentId());
		params.put("levelName", alarmLevel.getLevelName());
		params.put("createDateTime", alarmLevel.getCreateDateTime());
		params.put("modifyDateTime", alarmLevel.getModifyDateTime());
		params.put("note", alarmLevel.getNote());
		params.put("levelId", alarmLevel.getAlarmLevelId());
		getNamedParameterJdbcTemplate().update(sql, params);


	}

	@Override
	public AlarmLevel getAlarmLevelById(int levelId) {
		String sql = "select * from alarm_level where alarm_level_id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("id", levelId);
    	List<AlarmLevel> alarmLevel = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmLevel>(AlarmLevel.class));
    	if (alarmLevel == null || alarmLevel.size() != 1) {
			return null;
		} else {
			return alarmLevel.get(0);
		}
	}

	@Override
	public List<AlarmLevel> getLevel() {
		// TODO Auto-generated method stub
		return null;
	}

}
