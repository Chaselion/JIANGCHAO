package com.zy.dmop.resource.alarm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.DeviceProperityDao;
import com.zy.dmop.api.alarm.service.DeviceProperityService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceProperity;
@Component("deviceProperityService")
public class DeviceProperityServiceImpl implements DeviceProperityService {
	@Autowired 
	private DeviceProperityDao deviceProperityDao;
	
	@Override
	public PageResult<DeviceProperity> pageQueryAlarm(Page page) throws ErrorMessageException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DeviceProperity createDeviceProperity(DeviceProperity deviceProperity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteDeviceProperity(int deviceProperityId) {
		// TODO Auto-generated method stub

	}

	@Override
	public DeviceProperity getProperityById(int deviceProperityId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateDeviceProperity(DeviceProperity deviceProperity) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getDeviceProperityById(int deviceProperityId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DeviceProperity> getDeviceProperity() {
		// TODO Auto-generated method stub
		return deviceProperityDao.getDeviceProperity();
	}

	@Override
	public String getProperutyNameById(int deviceProperityId) {
		
		return deviceProperityDao.getProperutyNameById(deviceProperityId);
	}

	@Override
	public List<DeviceProperity> getAllDeviceProperity(int deviceClassId) {
		// TODO Auto-generated method stub
		return deviceProperityDao.getAllDeviceProperity(deviceClassId);
	}

	@Override
	public List<String> getProEngNames(List<Integer> deviceProIds) {
		List<String> proEngNames=new ArrayList<String>();
		for (int i = 0; i < deviceProIds.size(); i++) {
			int deviceProId=deviceProIds.get(i);
			String name=deviceProperityDao.getProEngName(deviceProId);
			proEngNames.add(name);
		}
		return proEngNames;
	}

}
