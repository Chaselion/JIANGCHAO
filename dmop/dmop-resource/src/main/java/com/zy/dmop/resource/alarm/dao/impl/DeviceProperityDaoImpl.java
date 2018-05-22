package com.zy.dmop.resource.alarm.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.DeviceProperityDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceProperity;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
@Component("deviceProperityDao")
public class DeviceProperityDaoImpl extends NamedParameterJdbcDaoSupport implements DeviceProperityDao {

	@Override
	public PageResult<DeviceProperity> pageQueryAlarm(Page page) {
		return null;
	}

	@Override
	public DeviceProperity createDeviceProperity(DeviceProperity deviceProperity) {
		return null;
	}

	@Override
	public void deleteDeviceProperity(int deviceProperityId) {

	}

	@Override
	public void updateDeviceProperity(DeviceProperity deviceProperity) {

	}

	@Override
	public DeviceProperity getDeviceProperityById(int deviceProperityId) {
		return null;
	}

	@Override
	public List<DeviceProperity> getDeviceProperity() {
		StringBuilder sql = new StringBuilder();
    	sql.append("select * from device_properity ");
		return getNamedParameterJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<DeviceProperity>(DeviceProperity.class));
	}

	@Override
	public String getProperutyNameById(int deviceProperityId) {
		Object o = CacheUtil.getModel(CacheConstant.MODEL_DEVICE_PROPERITY, deviceProperityId);
		if(o != null) {
			return ((DeviceProperity)o).getName();
		}else {			
			String sql = "select name from device_properity where device_properity_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", deviceProperityId);
			return getNamedParameterJdbcTemplate().queryForObject(sql, params,String.class);
		}
	}

	@Override
	public List<DeviceProperity> getAllDeviceProperity(int deviceClassId) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_DEVICE_PROPERITY);
		if(cache != null && cache.size() > 0) {
			List<DeviceProperity> rev = new ArrayList<>();
			for(Object o : cache) {
				DeviceProperity dp = (DeviceProperity)o;
				if(dp.getDeviceClassId() == deviceClassId) {
					rev.add(dp);
				}
			}
			return rev;
		}else {			
			StringBuilder sql = new StringBuilder();
			sql.append("select * from device_properity where device_class_id=:deviceClassId");
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("deviceClassId", deviceClassId);
			return getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<DeviceProperity>(DeviceProperity.class));
		}
	}

	@Override
	public String getProEngName(int deviceProId) {
		Object o = CacheUtil.getModel(CacheConstant.MODEL_DEVICE_PROPERITY, deviceProId);
		if(o != null) {
			return ((DeviceProperity)o).getEnglishName();
		}else {
			String sql = "select english_name from device_properity where device_properity_id=:id";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", deviceProId);
			return getNamedParameterJdbcTemplate().queryForObject(sql, params,String.class);
		}
	}

	@Override
	public List<DeviceProperity> getAllDeviceProperityForCache() {
		StringBuilder sql = new StringBuilder();
    	sql.append("select * from device_properity ");
		return getNamedParameterJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<DeviceProperity>(DeviceProperity.class));
	}

}
