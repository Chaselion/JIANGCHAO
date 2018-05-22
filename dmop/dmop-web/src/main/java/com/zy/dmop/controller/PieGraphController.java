package com.zy.dmop.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.app.service.PieGraphService;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.StringUtil;

@Controller
@RequestMapping("/pieGraph")
public class PieGraphController {
	private static Logger log = Logger.getLogger(PieGraphController.class);
	
	@Autowired
	private PieGraphService pieGraphService;
	
	@RequestMapping(value = "/getAlarmLogs", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAlarmLogs(
			@RequestParam(value = "startTime", required = false) Date startTime,
			@RequestParam(value = "endTime", required = false) Date endTime,
			@RequestParam(value = "terminalId", required = false) String terminalId)
			throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		terminalId = StringUtil.convertNullToEmpty(terminalId);
		
			HashSet<Map<String, Object>> alarmLog = pieGraphService.getAlarmLogs(organizationId, terminalId, startTime, endTime);
			commonMsg.setSuccess(true);
			returnMap.put("alarmLog", alarmLog);
		return returnMap;
	}
}
