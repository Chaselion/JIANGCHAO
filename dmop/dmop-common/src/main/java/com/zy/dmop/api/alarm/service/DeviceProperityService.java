package com.zy.dmop.api.alarm.service;

import java.util.List;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceProperity;

public interface DeviceProperityService {
	
	public PageResult<DeviceProperity> pageQueryAlarm(Page page) throws ErrorMessageException;

	public DeviceProperity createDeviceProperity(DeviceProperity deviceProperity);
	
	public void deleteDeviceProperity(int deviceProperityId);
	
	public DeviceProperity getProperityById(int deviceProperityId);
    
    public void updateDeviceProperity(DeviceProperity deviceProperity);

	public int getDeviceProperityById(int deviceProperityId);
	
	public List<DeviceProperity> getDeviceProperity();
	
	public String getProperutyNameById(int deviceProperityId);
	
	public List<DeviceProperity> getAllDeviceProperity(int deviceClassId);

	public List<String> getProEngNames(List<Integer> deviceProIds);
}
