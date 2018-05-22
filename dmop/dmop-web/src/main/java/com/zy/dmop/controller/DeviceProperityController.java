package com.zy.dmop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.alarm.service.DeviceProperityService;
import com.zy.dmop.model.DeviceProperity;
import com.zy.dmop.util.CommonMessage;

@Controller
@RequestMapping("/deviceProperity")
public class DeviceProperityController {
	private static Logger log = Logger.getLogger(DeviceProperityController.class);
	
	@Autowired
	private DeviceProperityService deviceProperityService;


	@RequestMapping(value = "/getDeviceProperity", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getDeviceProperity(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		List<DeviceProperity> deviceProperity = deviceProperityService.getDeviceProperity();
		if (null == deviceProperity) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("对象不存在");
		} else {
			commonMsg.setSuccess(true);
			returnMap.put("deviceProperity", deviceProperity);
		}
		return returnMap;
	}
	
	@RequestMapping(value = "/getAllDeviceProperity", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAllDeviceProperity(@RequestParam(value="deviceClassId", required=true) int deviceClassId){
			Map<String, Object> returnMap = new HashMap<String, Object>();
			CommonMessage commonMsg = new CommonMessage();
			returnMap.put("commonMessage", commonMsg);
			List<DeviceProperity> deviceProperity = deviceProperityService.getAllDeviceProperity(deviceClassId);
			returnMap.put("deviceProperity", deviceProperity);
			return returnMap;
	
	}
}
