package com.zy.dmop.api.alarm.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceProperity;


public interface DeviceProperityDao {
	//分页查询
	PageResult<DeviceProperity> pageQueryAlarm(Page page);
	//插入配置条件
	public DeviceProperity createDeviceProperity(DeviceProperity deviceProperity);
	//删除对应配置条件
	public void deleteDeviceProperity(int deviceProperityId);
	//更新配置条件
	public void updateDeviceProperity(DeviceProperity deviceProperity);
	//根据id查询
	public DeviceProperity getDeviceProperityById(int deviceProperityId);
	//查所有条件
	public List<DeviceProperity> getDeviceProperity();
	public List<DeviceProperity> getAllDeviceProperityForCache();
	//根据id查询name
	public String getProperutyNameById(int deviceProperityId);
	//根据id查所有条件
	public List<DeviceProperity> getAllDeviceProperity(int deviceClassId);
	String getProEngName(int deviceProId);
}
