package com.zy.dmop.resource.alarm.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.DeviceClassDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
@Component("deviceClassDao")
public class DeviceClassDaoImpl extends NamedParameterJdbcDaoSupport implements DeviceClassDao {

	@Override
	public PageResult<DeviceClass> pageQueryAlarm(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DeviceClass createDeviceClass(DeviceClass deviceClass) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteDeviceClass(int deviceClassId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateDeviceClass(DeviceClass deviceClass) {
		// TODO Auto-generated method stub

	}

	@Override
	public DeviceClass getDeviceClassById(int deviceClassId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DeviceClass> getDeviceClass() {
		List<Object> list = CacheUtil.getModelList(CacheConstant.MODEL_DEVICE_CLASS);
		List<DeviceClass> rev = new ArrayList<>();
		if(list != null && list.size() != 0) {
			for(Object o : list) {
				rev.add((DeviceClass)o);
			}
		}else{
			StringBuilder sql = new StringBuilder();
	    	sql.append("select * from device_class ");
			return getNamedParameterJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<DeviceClass>(DeviceClass.class));
		}
		return rev;
	}

	@Override
	public List<DeviceClass> getAllDeviceClassForCache() {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from device_class ");
		return getNamedParameterJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<DeviceClass>(DeviceClass.class));
	}

}
