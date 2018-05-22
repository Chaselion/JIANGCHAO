package com.zy.dmop.api.alarm.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceClass;


public interface DeviceClassDao {
	//分页查询
	PageResult<DeviceClass> pageQueryAlarm(Page page);
	//插入配置条件
	public DeviceClass createDeviceClass(DeviceClass deviceClass);
	//删除对应配置条件
	public void deleteDeviceClass(int deviceClassId);
	//更新配置条件
	public void updateDeviceClass(DeviceClass deviceClass);
	//根据id查询
	public DeviceClass getDeviceClassById(int deviceClassId);
	//查所有条件
	public List<DeviceClass> getDeviceClass();
	public List<DeviceClass> getAllDeviceClassForCache();
}
