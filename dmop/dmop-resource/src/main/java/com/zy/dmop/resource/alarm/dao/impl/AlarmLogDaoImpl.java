package com.zy.dmop.resource.alarm.dao.impl;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmLogDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.model.vo.TerminalStrategyVo;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;




@Component("alarmLogDao")
public class AlarmLogDaoImpl extends NamedParameterJdbcDaoSupport implements AlarmLogDao{
	private static Logger log = Logger.getLogger(AlarmLogDaoImpl.class);
	//分页查询
	@Override
	public PageResult<AlarmLog> pageQueryAlarm(Page page,Date startCreateDate,Date endCreateDate,List<Integer> orgIds) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition = new StringBuilder();
    	sqlCondition.append(" from alarm_log ");
    	sqlCondition.append(" where organization_id in(:orgIds) ");
    	params.put("orgIds", orgIds);
    	if (startCreateDate != null) {
    		sqlCondition.append("and create_date_time >= :startCreateDate ");
    		params.put("startCreateDate", startCreateDate);
    	}
    	if (endCreateDate != null) {
    		sqlCondition.append(" and create_date_time <= :endCreateDate ");
    		params.put("endCreateDate", endCreateDate);
    	}
    	sqlCondition.append(" order by create_date_time desc ");
    	StringBuilder sql = new StringBuilder();
    	sql.append("select * ");
    	sql.append(sqlCondition.toString());
    	sql.append("limit " + page.getStart() + ", " + page.getLimit());
    	StringBuilder sqlCount = new StringBuilder();
    	sqlCount.append("select count(*) ");
    	sqlCount.append(sqlCondition.toString());
    	List<AlarmLog> list=getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<AlarmLog>(AlarmLog.class));
    	int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
    	page.setCount(count);
		PageResult<AlarmLog> pr = new PageResult<AlarmLog>(page, list);
		return pr;
	}
	@Override
	public AlarmLog createLog(final AlarmLog alarmLog) {
		final String sql = "insert into alarm_log "
				+ " (organization_id,device_class, device_name, condition_name, "
				+ " is_relieve, is_promote, organization_name, current_alarm_level, "
				+ " current_alarm_value, create_date_time, custom_name, is_send,"
				+ " measure_name, modify_date_time, message,is_confirm) "
				+ " values(:organizationId,:deviceClass,:deviceName, :conditionName, "
				+ " :isRelieve,:isPromote,:organizationName,:currentAlarmLevel, "
				+ " :currentAlarmValue,:createDateTime,:customName, :isSend, "
				+ "	:measureName,:modifyDateTime,:message,:isConfirm) ";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(alarmLog), keyHolder);
		long id = keyHolder.getKey().longValue();
		alarmLog.setAlarmLogId(id);
		return alarmLog;
		
	}
	@Override
	public void deleteLog(int logId) {
		String sql = "delete from alarm_log where alarm_log_id=:logId";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("logId", logId);
		getNamedParameterJdbcTemplate().update(sql, params);
		
	}
	@Override
	public void updateLog(final AlarmLog alarmLog) {
	}
	@Override
	public AlarmLog getAlarmLogById(int logId) {
		String sql = "select * from alarm_log where alarm_level_id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("id", logId);
    	List<AlarmLog> alarmLog = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmLog>(AlarmLog.class));
    	if (alarmLog == null || alarmLog.size() != 1) {
			return null;
		} else {
			return alarmLog.get(0);
		}
	}
	@Override
	public List<AlarmLog> getLog() {
		return null;
	}

	@Override
	public List<AlarmLog> getAlarmLogs(List<Integer> orgIds) {
		 Map<String, Object> params = new HashMap<String, Object>();
		 params.put("orgIds", orgIds);
	    	StringBuilder sql = new StringBuilder();
	    	sql.append("select * from alarm_log where organization_id in(:orgIds) order by create_date_time desc ");
	    	List<AlarmLog> list=getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<AlarmLog>(AlarmLog.class));
	    	
			return list;
	}
	@Override
	public void update(int count,String time,String terminalId) {
		String sql="update data_num set alarm_volume=:alarmVolue where terminalId=:terminalId and date=:time";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("alarmVolue", count);
		params.put("terminalId", time);
		params.put("time", terminalId);
		getNamedParameterJdbcTemplate().update(sql, params);
		
	}
	@Override
	public AlarmLog getAlarm(String terminlId) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from terminal t ");
		StringBuilder sql = new StringBuilder();
		sql.append(" select t.organization_id,t.terminal_num deviceName,o.name organizationName, c.name customName,dc.name deviceClass ");
		sql.append(sqlCondition.toString());
		sql.append("LEFT JOIN organization o on t.organization_id=o.organization_id ");
    	sql.append("LEFT JOIN custom c on c.custom_id=o.custom_id ");
    	sql.append("LEFT JOIN device_class dc on dc.device_class_id=t.device_class_id ");
		sql.append(" where t.terminal_num=:terminlId ");
        params.put("terminlId", terminlId);
		List<AlarmLog> list = getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<AlarmLog>(AlarmLog.class));
		return list.get(0);
	}
	@Override
	public int getInfo(String terminalId, String date, Double value) {
		String sql = new StringBuffer()
				.append(" select * ")
				.append(" from alarm_log ")
				.append(" where device_name=:terminalId ")
				.append(" and current_alarm_value=:value ")
				.append(" and create_date_time like :date ")
				.append(" and is_relieve=1 ")
				.toString();
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("terminalId", terminalId);
		params.put("value", value);
		params.put("date","%"+ date+"%");
		List<AlarmLog> info=getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmLog>(AlarmLog.class));
		if(info.isEmpty()) {
			return 0;
		}
		return info.size();
	}
	@Override
	public void updateLog(String terminalId, String conditionName, String date,
			Integer isRelieve, String message) {
		java.util.Date time=new java.util.Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creTime=df.format(time);
		String sql="update alarm_log set create_date_time=:creTime,is_relieve=:isRelieve,message=:message "
				+ "where device_name=:terminalId and condition_name=:conditionName and create_date_time <= :date and is_relieve=1";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("creTime", creTime);
		params.put("isRelieve", isRelieve);
		params.put("message", message);
		params.put("terminalId", terminalId);
		params.put("conditionName", conditionName);
		params.put("date", date);
		getNamedParameterJdbcTemplate().update(sql, params);
	}
	@Override
	public Integer getRelieve(String terminalId,Double value) {
		String sql = "select is_relieve from alarm_log where device_name=:terminalId and current_alarm_value=:value";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("terminalId", terminalId);
    	params.put("value", value);
    	Integer a=0;
		 a=getNamedParameterJdbcTemplate().queryForObject(sql, params,Integer.class);
		return a==null?1:a;
	}
	@Override
	public void updateConfirm(String terminalId, Double value,String username) {
		String sql="update alarm_log set is_confirm=:isConfirm,confirm_person=:confirmPerson,confirm_time=:confirmTime where device_name=:terminalId and current_alarm_value=:value";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("isConfirm", 1);
    	params.put("confirmPerson", username);
    	params.put("confirmTime", new Timestamp(System.currentTimeMillis()));
		params.put("terminalId", terminalId);
    	params.put("value", value);
		getNamedParameterJdbcTemplate().update(sql, params);
		
	}
	
}
