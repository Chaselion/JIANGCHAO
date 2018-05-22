package com.zy.dmop.resource.alarm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.DeviceClassDao;
import com.zy.dmop.api.alarm.service.DeviceClassService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.DeviceClass;
@Component("deviceClassService")
public class DeviceClassServiceImpl implements DeviceClassService {
	@Autowired
	private DeviceClassDao deviceClassDao;
	@Override
	public PageResult<DeviceClass> pageQueryAlarm(Page page) throws ErrorMessageException {
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
	public DeviceClass getClassById(int deviceClassId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateDeviceClass(DeviceClass deviceClass) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getDeviceClassById(int deviceClassId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DeviceClass> getDeviceClass() {
		// TODO Auto-generated method stub
		return deviceClassDao.getDeviceClass();
	}

}
