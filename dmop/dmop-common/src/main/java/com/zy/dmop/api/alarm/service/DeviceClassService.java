package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceClass;

public interface DeviceClassService {

	public PageResult<DeviceClass> pageQueryAlarm(Page page) throws ErrorMessageException;

	public DeviceClass createDeviceClass(DeviceClass deviceClass);
	
	public void deleteDeviceClass(int deviceClassId);
	
	public DeviceClass getClassById(int deviceClassId);
    
    public void updateDeviceClass(DeviceClass deviceClass);

	public int getDeviceClassById(int deviceClassId);
	
	public List<DeviceClass> getDeviceClass();
}
