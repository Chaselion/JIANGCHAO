package com.zy.dmop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.alarm.service.DeviceClassService;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.util.CommonMessage;
@Controller
@RequestMapping("/deviceClass")
public class DeviceClassController {
	private static Logger log = Logger.getLogger(DeviceClassController.class);
	
	@Autowired
	private DeviceClassService deviceClassService;


	@RequestMapping(value = "/getDeviceClass", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getDeviceClass(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		List<DeviceClass> deviceClass = deviceClassService.getDeviceClass();
		if (null == deviceClass) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("对象不存在");
		} else {
			commonMsg.setSuccess(true);
			returnMap.put("deviceClass", deviceClass);
		}
		return returnMap;
	}
}
