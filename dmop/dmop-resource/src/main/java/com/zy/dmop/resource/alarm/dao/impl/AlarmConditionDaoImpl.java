package com.zy.dmop.resource.alarm.dao.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmConditionDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.DeviceProperity;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.model.vo.ConditionProperityVo;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
@Component("alarmConditionDao")
public class AlarmConditionDaoImpl extends NamedParameterJdbcDaoSupport implements AlarmConditionDao {

	@Override
	public PageResult<ConditionDeviceVo> pageQueryAlarm(Page page) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_ALARM_CONDITION);
		if(cache != null && cache.size() > 0) {
			List<ConditionDeviceVo> list = new ArrayList<>();
			for(Object o : cache) {
				AlarmCondition ac = (AlarmCondition)o;
				try {
					ConditionDeviceVo cdv = turnVo(ac);
					list.add(cdv);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
			page.setCount(list.size());
			list = list.subList(page.getStart(), (page.getStart() + page.getLimit()) > list.size() ? list.size() : (page.getStart() + page.getLimit()));
			PageResult<ConditionDeviceVo> pr = new PageResult<ConditionDeviceVo>(page, list);
			return pr;
		}else {
			Map<String, Object> params = new HashMap<String, Object>();
			StringBuilder sqlCondition = new StringBuilder();
			sqlCondition.append(" from alarm_condition a ");
			StringBuilder sql = new StringBuilder();
			sql.append("select a.alarm_condition_id, a.condition_name, a.initial_alarm_level_id, a.judge_rule, "
					+ "a.judge_junior_value, a.judge_senior_value, a.trigger_duration, "
					+ "a.relieve_duration, a.if_relieve_notice, a.if_auto_promote, a.promote_value,a.repeat_time, "
					+ "a.promote_condition, a.if_active, a.note,b.name device_class_name, c.name device_properity_name ");
			sql.append(sqlCondition.toString());
			sql.append(" left join device_class b on a.device_class_id=b.device_class_id ");
			sql.append(" left join device_properity c on a.device_properity_id=c.device_properity_id ");
			sql.append("limit " + page.getStart() + ", " + page.getLimit());
			StringBuilder sqlCount = new StringBuilder();
			sqlCount.append("select count(*) ");
			sqlCount.append(sqlCondition.toString());
			sqlCount.append(" left join device_class b on a.device_class_id=b.device_class_id ");
			sqlCount.append(" left join device_properity c on a.device_properity_id=c.device_properity_id ");
			
			List<ConditionDeviceVo> list=getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<ConditionDeviceVo>(ConditionDeviceVo.class));
			int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
			page.setCount(count);
			PageResult<ConditionDeviceVo> pr = new PageResult<ConditionDeviceVo>(page, list);
			return pr;
		}
	}

	private ConditionDeviceVo turnVo(AlarmCondition ac) throws IllegalArgumentException, IllegalAccessException {
		ConditionDeviceVo cdv = new ConditionDeviceVo();
		for(Field cdvF : cdv.getClass().getDeclaredFields()) {
			String cdvFName = cdvF.getName();
			cdvF.setAccessible(true);
			for(Field field : ac.getClass().getDeclaredFields()) {
				String acFName = field.getName();
				if(acFName.equals(cdvFName)) {
					field.setAccessible(true);
					cdvF.set(cdv, field.get(ac));;
				}
			}
			if("deviceClassName".equals(cdvFName)) {
				Object dcO = CacheUtil.getModel(CacheConstant.MODEL_DEVICE_CLASS, ac.getDeviceClassId());
				cdvF.set(cdv, dcO != null ? ((DeviceClass)dcO).getName() : "");;
			}
			if("deviceProperityName".equals(cdvFName)) {
				Object dpO = CacheUtil.getModel(CacheConstant.MODEL_DEVICE_PROPERITY, ac.getDeviceProperityId());
				cdvF.set(cdv, dpO != null ? ((DeviceProperity)dpO).getName() : "");;
			}
		}
		return cdv;
	}
	
	@Override
	public AlarmCondition createCondition(final AlarmCondition alarmCondition) {
		final String sql = "insert into alarm_condition "
				+ " (condition_name, device_class_id, device_properity_id, if_active, "
				+ " initial_alarm_level_id, if_auto_promote,  promote_value, "
				+ " judge_rule, judge_junior_value, judge_senior_value, trigger_duration, "
				+ " relieve_duration,repeat_time, if_relieve_notice,note) "
				+ " values(:conditionName,:deviceClassId, :deviceProperityId, "
				+ " :ifActive,:initialAlarmLevelId,:ifAutoPromote,:promoteValue, "
				+ " :judgeRule,:judgeJuniorValue,:judgeSeniorValue, :triggerDuration, "
				+ "	:relieveDuration,:repeatTime,:ifRelieveNotice,:note) ";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(alarmCondition), keyHolder);
		int id = keyHolder.getKey().intValue();
		alarmCondition.setAlarmConditionId(id);
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_CONDITION, id, alarmCondition);
		return alarmCondition;
	}
		

	@Override
	public void deleteCondition(int conditionId) {
		String sql = "delete from alarm_condition where alarm_condition_id=:conditionId";
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("conditionId", conditionId);
		
		getNamedParameterJdbcTemplate().update(sql, params);
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_CONDITION, conditionId, null);
	}

	@Override
	public void updateCondition(final AlarmCondition alarmCondition) {
		String sql = "update alarm_condition set  condition_name=:conditionName, "
				+ " device_class_id=:deviceClassId, device_properity_id=:deviceProperityId, if_active=:ifActive, "
				+ " initial_alarm_level_id=:initialAlarmLevelId, if_auto_promote=:ifAutoPromote, "
				+ " promote_value=:promoteValue, judge_rule=:judgeRule, judge_junior_value=:judgeJuniorValue, "
				+ " judge_senior_value=:judgeSeniorValue, trigger_duration=:triggerDuration, relieve_duration=:relieveDuration, "
				+ " if_relieve_notice=:ifRelieveNotice,repeat_time=:repeatTime,note=:note " 
				+ " where alarm_condition_id=:alarmConditionId";
		getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(alarmCondition));
		CacheUtil.updateModel(CacheConstant.MODEL_ALARM_CONDITION, alarmCondition.getAlarmConditionId(), alarmCondition);
	}

	@Override
	public AlarmCondition getAlarmConditionById(int conditionId) {
		Object obj = CacheUtil.getModel(CacheConstant.MODEL_ALARM_CONDITION, conditionId);
		if(obj == null) {			
			String sql = "select * from alarm_condition where alarm_condition_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", conditionId);
			List<AlarmCondition> alarmCondition = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmCondition>(AlarmCondition.class));
			if (alarmCondition == null || alarmCondition.size() != 1) {
				return null;
			} else {
				return alarmCondition.get(0);
			}
		}else {
			return (AlarmCondition)obj;
		}
	}

	@Override
	public List<AlarmCondition> getCondition() {
		return null;
	}

	@Override
	public List<AlarmCondition> getConditionNameByIfActive(int strategyId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", strategyId);
		String sql = "select * from alarm_condition where if_active=1 and alarm_condition_id not in(select alarm_condition_id from condition_strategy where condition_strategy.alarm_condition_id=alarm_condition.alarm_condition_id and condition_strategy.alarm_strategy_id=:id)";
		List<AlarmCondition> alarmCondition = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmCondition>(AlarmCondition.class));
		return alarmCondition;
	}



	@Override
	public List<Integer> getDeviceProIds(List<ConditionStrategy> conditionIds) {
		List<Integer> list=new ArrayList<Integer>(); 
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_ALARM_CONDITION);
		for (int i = 0; i < conditionIds.size(); i++) {
			int conditionId=conditionIds.get(i).getAlarmConditioId();
			if(cache != null && cache.size() > 0) {
				for(Object object : cache) {
					AlarmCondition ac = (AlarmCondition)object;
					if(ac.getAlarmConditionId() == conditionId) {
						list.add(ac.getDeviceProperityId());
						break;
					}
				}
			}else {				
				String sql = "select device_properity_id from alarm_condition where alarm_condition_id=?";
				Integer alarmCondition = getJdbcTemplate().queryForObject(sql, Integer.class, conditionId);
				//getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<Integer>(Integer.class));
				list.add(alarmCondition);
			}
		}
		return list;
	}

	@Override
	public List<AlarmCondition> getAllByIds(int conditionId) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_ALARM_CONDITION);
		if(cache != null && cache.size() > 0) {
			List<AlarmCondition> AlarmCondition = new ArrayList<>();
			for(Object object : cache) {
				AlarmCondition ac = (AlarmCondition)object;
				if(ac.getAlarmConditionId() == conditionId) {
					AlarmCondition.add(ac);
				}
			}
			return AlarmCondition;
		}else {			
			String sql = "select * from alarm_condition where alarm_condition_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", conditionId);
			List<AlarmCondition> AlarmCondition = getNamedParameterJdbcTemplate().query(sql.toString(), params, new BeanPropertyRowMapper<AlarmCondition>(AlarmCondition.class));
			if(AlarmCondition.size() == 0) {
				return null;
			}
			return AlarmCondition;
		}
	}

	@Override
	public int getProPerityIdByName(String engName) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_DEVICE_PROPERITY);
		if(cache != null && cache.size() > 0) {
			int rev = 0;
			for(Object o : cache) {
				DeviceProperity dp = (DeviceProperity)o;
				if(engName.equals(dp.getEnglishName())) {
					rev = dp.getDeviceProperityId();
					break;
				}
			}
			return rev;
		}else {
			String sql="select device_properity_id from device_properity where english_name=?";
			Integer properityId = getJdbcTemplate().queryForObject(sql, Integer.class, engName);
			return properityId;
		}
	}

	@Override
	public List<AlarmCondition> getAllByProId(int properityId) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_ALARM_CONDITION);
		if(cache != null && cache.size() > 0) {
			List<AlarmCondition> AlarmCondition = new ArrayList<>();
			for(Object object : cache) {
				AlarmCondition ac = (AlarmCondition)object;
				if(ac.getDeviceProperityId() == properityId) {
					AlarmCondition.add(ac);
				}
			}
			return AlarmCondition;
		}else {				
			String sql = "select * from alarm_condition where device_properity_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", properityId);
			List<AlarmCondition> AlarmCondition = getNamedParameterJdbcTemplate().query(sql.toString(), params, new BeanPropertyRowMapper<AlarmCondition>(AlarmCondition.class));
			if(AlarmCondition.size() == 0) {
				return null;
			}
			return AlarmCondition;
		}
	}

	@Override
	public List<ConditionProperityVo> getConDeviceVo(Integer id) {
		String sql = "select a.alarm_condition_id,"
				+ "a.device_properity_id,a.if_active,"
				+ "a.if_auto_promote,a.if_relieve_notice,"
				+ "a.initial_alarm_level_id,a.judge_rule,"
				+ "a.promote_condition,a.relieve_duration,a.repeat_time,"
				+ "a.trigger_duration,a.judge_junior_value,"
				+ "a.judge_senior_value,a.promote_value,"
				+ "d.name,d.english_name"
				+ " from alarm_condition a left join device_properity d "
				+ "on a.device_properity_id=d.device_properity_id where alarm_condition_id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		List<ConditionProperityVo> conditionProperityVo = getNamedParameterJdbcTemplate().query(sql.toString(), params, new BeanPropertyRowMapper<ConditionProperityVo>(ConditionProperityVo.class));
		if(0==conditionProperityVo.size() ) {
            return null;
        }
		return conditionProperityVo;
	}

	@Override
	public List<AlarmCondition> getAllAlarmConditionForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from alarm_condition";
		List<AlarmCondition> alarmCondition = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<AlarmCondition>(AlarmCondition.class));
		return alarmCondition;
	}
}
