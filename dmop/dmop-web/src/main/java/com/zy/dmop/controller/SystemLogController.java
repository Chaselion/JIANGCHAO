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
import com.zy.dmop.api.web.service.SystemLogService;
import com.zy.dmop.model.SystemLog;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.StringUtil;


@Controller
@RequestMapping("/systemLog")
public class SystemLogController {
	private static Logger log = Logger.getLogger(OperateLogController.class);
	
	@Autowired
	private SystemLogService systemLogService;
	
	@RequestMapping(value = "/pageQuerySystemLog", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> pageQuerySystemLog(
			@RequestParam(value="startCreateDate", required=false) String startCreateDateStr,
			@RequestParam(value="endCreateDate", required=false) String endCreateDateStr,
			@RequestParam(value="text", required=false) String text,
			@RequestParam(value = "start", required = false) Integer start, 
			@RequestParam(value = "countPerPage", required = false)  Integer countPerPage){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		//User loginUser = SessionUtil.getCommonUserFromSession();
		text = StringUtil.convertNullToEmpty(text);
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		
		try {
			PageResult<SystemLog> pageResult = systemLogService.pageQuerySystemLog(startCreateDateStr,endCreateDateStr,page);		
			List<SystemLog> data = pageResult.getData();
			int aa=data.size();
			commonMsg.setSuccess(true);
			returnMap.put("systemLogs", data);
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
	
	@RequestMapping(value = "/delSystemLogById", method = RequestMethod.POST)
	@ResponseBody
	/*public Map<String,Object> delSystemLogById(@RequestParam("systemLogId") Long systemLogId){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		this.systemLogService.deleteSystemLog(systemLogId);
		return returnedData;
	}*/
	
	   public CommonMessage delSystemLogById(@RequestParam(value="systemLogId", required=true) Long systemLogId) {
    	//User loginUser = SessionUtil.getCommonUserFromSession();
		
		CommonMessage msg = new CommonMessage();
		
		//User requestUser = userService.getUserById(id);
		/*if (requestUser != null) {
			//检查传入的user是否可被当前用户删除
			if (!EntityPermissionHelper.getEditable(new UserView(requestUser), loginUser)) {
				msg.setSuccess(false);
				msg.setErrorMessage("该操作请求了未授权的资源!操作失败!");
				
				return msg;
			}
		} else {
			msg.setSuccess(true);
			msg.setErrorMessage("删除用户成功！");
			
			return msg;
		}*/
		
		try {
			// TODO !!!!!!!!!!!!! 如何保证三次数据库操作在一个事务中??????????
			// 由于关联外键，注意删除的顺序！！
			// 删除角色用户关联关系
			//userRoleService.deleteByUserId(id);
			// 删除用户
			systemLogService.delSystemLogById(systemLogId);
			
			msg.setSuccess(true);
			msg.setErrorMessage("删除日志成功！");
		} catch (Exception e) {
			
			log.error(e.getMessage(), e);
			
			msg.setSuccess(false);
			msg.setErrorMessage("删除日志失败！");
		}
		
		return msg;
    }
	
	@RequestMapping(value = "/getSystemLogs", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getSystemLogs(){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
			this.systemLogService.getSystemLogs();
		return returnedData;
	}

}

