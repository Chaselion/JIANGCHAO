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

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.dao.OperateLogDao;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.OperateCusUserVo;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.StringUtil;

import kafka.log.Log;


@Controller
@RequestMapping("/operateLog")
public class OperateLogController {
	private static Logger log = Logger.getLogger(OperateLogController.class);
	

	@Autowired
	private OperateLogService operateLogService;
	
	
	@Autowired
	private OperateLogDao operateLogDao;
	@RequestMapping(value = "/pageQueryOperateLog", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> pageQueryOperateLog( 
			@RequestParam(value="startCreateDate", required=false) String startCreateDateStr,
			@RequestParam(value="endCreateDate", required=false) String endCreateDateStr,
			@RequestParam(value="text", required=false) String text,
			@RequestParam(value = "start", required = false) Integer start, 
			@RequestParam(value = "countPerPage", required = false)  Integer countPerPage){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();
		text = StringUtil.convertNullToEmpty(text);
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		
		try {
			PageResult<OperateCusUserVo> pageResult = operateLogService.pageQueryOperateLog(startCreateDateStr,endCreateDateStr,page,organizationId);		
			List<OperateCusUserVo> data = pageResult.getData();
			int aa=data.size();
			commonMsg.setSuccess(true);
			returnMap.put("operateLogs", data);
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
	
	
	@RequestMapping(value = "/delOperateLogById", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage delOperateLogById(@RequestParam("id") Long operateLogId){
		log.info("request delOperateLogById=" + operateLogId);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage msg = new CommonMessage();
		returnedData.put("commonMsg", msg);
			this.operateLogService.deleteOperateLog(operateLogId);
			msg.setSuccess(true);
			msg.setErrorMessage("删除日志成功！");
		return msg;
	}
	
	@RequestMapping(value = "/getOperateLogs", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getOperateLogs(){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
			this.operateLogService.getOperateLogs();
		return returnedData;
	}
	
/*	@RequestMapping(value="/exitLog",method=RequestMethod.POST)
	 @ResponseBody
	 public Map<String,Object> exitLog(User user){
		 Map<String,Object> loginMap = new HashMap<String,Object>();
		 CommonMessage commonMsg = new CommonMessage();
		 loginMap.put("commonMessage", commonMsg);
		 commonMsg.setSuccess(true);
		 OperateLog operateLog = new OperateLog();
	     operateLog.setCreateDateTime(new Date());
	     operateLog.setModifyDateTime(new Date());
	     operateLog.setText("退出");
	     operateLogDao.insertOperateLog(operateLog);
		 loginMap.put("commonMsg", commonMsg);
		 return loginMap;
	 }*/
}
