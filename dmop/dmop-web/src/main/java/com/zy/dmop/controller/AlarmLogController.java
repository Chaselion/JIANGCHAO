package com.zy.dmop.controller;

import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.zy.dmop.api.alarm.service.AlarmLogService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.model.User;
import com.zy.dmop.util.CommonMessage;

@Controller
@RequestMapping("/alarmLog")
public class AlarmLogController {
	private static Logger log= Logger.getLogger(AlarmLogController.class);
	
	@Autowired
	private AlarmLogService alarmLogService;

	
	//告警日志查询
	@RequestMapping(value="/queryLogAlarm",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryAlarm(
			@RequestParam(value="startCreateDate", required=false) String startCreateDateStr,
			@RequestParam(value="endCreateDate", required=false) String endCreateDateStr,
			@RequestParam(value="start", required=false) Integer start , 
			@RequestParam(value="countPerPage", required=false) Integer countPerPage) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		
		try {
			PageResult<AlarmLog> pageResult = alarmLogService.pageQueryAlarm( page,startCreateDateStr,endCreateDateStr,organizationId);
			commonMsg.setSuccess(true);
			returnMap.put("alarms", pageResult.getData());
			returnMap.put("page", pageResult.getPage());
		} catch (ErrorMessageException e) {
			log.error(e.getMessage(), e);
			
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(e.getErrorMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("查询失败!");
		}
		return returnMap;
	}
}
