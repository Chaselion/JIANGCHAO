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
import com.zy.dmop.api.web.service.RealTimeLogService;
import com.zy.dmop.model.SystemLog;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.StringUtil;


@Controller
@RequestMapping("/realtimeLog")
public class RealTimeLogController {
	private static Logger log = Logger.getLogger(OperateLogController.class);
	
	@Autowired
	private RealTimeLogService realTimeLogService;
	
	@RequestMapping(value = "/pageQueryRealtimeLog", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> pageQueryRealTimeLog( 
			@RequestParam(value="startCreateDate", required=false) String startCreateDateStr,
			@RequestParam(value="endCreateDate", required=false) String endCreateDateStr,
			@RequestParam(value = "method", required = false) String method, 
			@RequestParam(value = "start", required = false) Integer start, 
			@RequestParam(value = "countPerPage", required = false)  Integer countPerPage){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		//User loginUser = SessionUtil.getCommonUserFromSession();
		method = StringUtil.convertNullToEmpty(method);
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		
		try {
			PageResult<SystemLog> pageResult = realTimeLogService.pageQueryRealtimeLog( startCreateDateStr,endCreateDateStr,page);		
			List<SystemLog> data = pageResult.getData();
			/*int aa=data.size();
			for(int a=0;a<aa;a++){
			}*/
			commonMsg.setSuccess(true);
			returnMap.put("realTimeLogs", data);
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
	
	
	@RequestMapping(value = "/delRealTimeLogById", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage delRealTimeLogById(@RequestParam("id") Long id){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage msg = new CommonMessage();
		returnedData.put("commonMsg", msg);
			this.realTimeLogService.delRealtimeLogById(id);
			msg.setSuccess(true);
			msg.setErrorMessage("删除日志成功！");
		return msg;
	}
	
	@RequestMapping(value = "/getRealTimeLogs", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getRealTimeLogs(){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
			this.realTimeLogService.getRealtimeLogs();
		return returnedData;
	}

}

