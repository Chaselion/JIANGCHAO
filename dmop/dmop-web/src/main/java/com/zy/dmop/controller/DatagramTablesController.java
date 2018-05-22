package com.zy.dmop.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.web.service.DatagramTablesService;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.util.CommonMessage;
@Controller
@RequestMapping("/Datagram")
public class DatagramTablesController {
	@Autowired
	private DatagramTablesService datagramTablesService;
	//根据登陆者的组织id查询下面对应的组织id
	
	@RequestMapping(value = "/getOrgName", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getOrgName(
			@RequestParam(value = "orgId", required = false) Integer orgId){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		List<Organization> org = null;
		try {
			org = datagramTablesService.getOrgName(orgId);
		} catch (Exception e) {
			System.out.println("查询出错");
		}
		if (null == org) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("对象不存在");
		} else {
			commonMsg.setSuccess(true);
			returnMap.put("deviceClass", org);
		}
		return returnMap;
	}
	//根据组织id或许终端名称
	@RequestMapping(value = "/getTerName", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTerName(
			@RequestParam(value = "orgId", required = false) Integer orgId){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		List<Terminal> terminal = null;
		try {
			terminal = datagramTablesService.getTerName(orgId);
		} catch (Exception e) {
			System.out.println("查询出错");
		}
		if (null == terminal) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("对象不存在");
		} else {
			commonMsg.setSuccess(true);
			returnMap.put("deviceClass", terminal);
		}
		return returnMap;
	}
	//根据终端号，起始结束时间来查询历史数据
	@RequestMapping(value = "/getData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getData(
			@RequestParam(value = "terminalNum", required = false) String terminalNum,
			@RequestParam(value = "startTime", required = false) String startTime,
			@RequestParam(value = "endTime", required = false) String endTime) throws ParseException{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		List<HistoryData> data = null;
		try {
			data = datagramTablesService.getData(terminalNum, startTime, endTime);
		} catch (Exception e) {
			System.out.println("查询出错");
		}
		if (null == data) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("对象不存在");
		} else {
			commonMsg.setSuccess(true);
			returnMap.put("deviceClass", data);
		}
		return returnMap;
	}
	
	//根据终端名称去查询终端号
	//根据组织id或许终端名称
		@RequestMapping(value = "/getTerNum", method = RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> getTerNum(
				@RequestParam(value = "terName", required = false) String terName){
			Map<String, Object> returnMap = new HashMap<String, Object>();
			CommonMessage commonMsg = new CommonMessage();
			returnMap.put("commonMessage", commonMsg);
			List<Terminal> terminal = null;
			try {
				terminal = datagramTablesService.getTerNum(terName);
			} catch (Exception e) {
				System.out.println("查询出错");
			}
			if (null == terminal) {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage("对象不存在");
			} else {
				commonMsg.setSuccess(true);
				returnMap.put("deviceClass", terminal);
			}
			return returnMap;
		}
}