package com.zy.dmop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.alarm.service.AlarmConditionService;
import com.zy.dmop.api.alarm.service.ConditionStrategyService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.util.CommonMessage;




@Controller
@RequestMapping("/alarmCondition")
public class AlarmConditionController {
	private static Logger log = Logger.getLogger(AlarmConditionController.class);
	//定义一个操作日志的所属界面字符串
		public static final String PAGE = "报警条件";
		@Autowired
		private OperateLogService operateLogService;
	@Autowired
	private AlarmConditionService alarmConditionService;
	@Autowired
	private ConditionStrategyService conditionStrategyService;
	//修改create条件方法
	@RequiresPermissions(value="Tenant.SecurityMgmt.Role.add")
	@RequestMapping(value="/create",method=RequestMethod.POST)
	@ResponseBody
	public CommonMessage create(HttpServletRequest request,
			HttpServletResponse response,AlarmCondition alarmCondition) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		User loginUser = SessionUtil.getCommonUserFromSession();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
    	try {
    		if(null==alarmCondition.getAlarmConditionId()) {
    			alarmConditionService.createCondition(alarmCondition);
    			User loguser=new User();
    			loguser.setUserId(loginUser.getUserId());
    			loguser.setOrganizationId(loginUser.getOrganizationId());
    			String content=alarmCondition.getConditionName()+" "+PAGE;
    			operateLogService.addInsert(loguser, content);
    		}else {
    			alarmConditionService.updateCondition(alarmCondition);
    			User loguser=new User();
    			loguser.setUserId(loginUser.getUserId());
    			loguser.setOrganizationId(loginUser.getOrganizationId());
    			String content=alarmCondition.getConditionName()+" "+PAGE;
    			operateLogService.addUpdate(loguser, content);
    		}
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("添加报警参数失败!");
			log.error(e.getMessage(), e);
		}
		return commonMsg;
	}
	
	
	//告警条件分页查询
	@RequestMapping(value="/queryConditionAlarm",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryAlarm(
			
			@RequestParam(value="start", required=false) Integer start , 
			@RequestParam(value="countPerPage", required=false) Integer countPerPage) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		
		try {
			PageResult<ConditionDeviceVo> pageResult = alarmConditionService.pageQueryAlarm(page);
			List<ConditionDeviceVo> data=pageResult.getData();
			commonMsg.setSuccess(true);
			returnMap.put("alarms", data);
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
	@RequiresPermissions(value="Tenant.SecurityMgmt.Role.add")
	@RequestMapping(value="/createCondition",method=RequestMethod.POST)
	@ResponseBody
	public CommonMessage createCondition(@RequestBody Map<String, Object> requestParam) throws Exception {
		HashMap<String, Object> request = (HashMap<String, Object>) requestParam.get("condition");
		CommonMessage commonMsg = new CommonMessage();
		
		User loginUser = SessionUtil.getCommonUserFromSession();
		AlarmCondition alarmCondition = new AlarmCondition();
    	alarmCondition.setConditionName(request.get("conditionName").toString());
    	alarmCondition.setInitialAlarmLevelId(Integer.parseInt(request.get("initialAlarmLevelId").toString()));
    	alarmCondition.setDeviceClassId(Integer.parseInt(request.get("deviceClassId").toString()));
    	alarmCondition.setDeviceProperityId(Integer.parseInt(request.get("deviceProperityId").toString()));
    	alarmCondition.setIfAutoPromote(Integer.parseInt(request.get("ifAutoPromote").toString()));
    	alarmCondition.setPromoteValue(Double.valueOf(request.get("promoteValue").toString()));
    	alarmCondition.setJudgeRule(Integer.parseInt(request.get("judgeRule").toString()));
    	alarmCondition.setJudgeJuniorValue(Double.valueOf(request.get("judgeJuniorValue").toString()));  	
    	alarmCondition.setJudgeSeniorValue(Double.valueOf(request.get("judgeSeniorValue").toString()));
    	alarmCondition.setTriggerDuration(Integer.parseInt(request.get("triggerDuration").toString()));;
    	alarmCondition.setRelieveDuration(Integer.parseInt(request.get("relieveDuration").toString()));
    	alarmCondition.setIfRelieveNotice(Integer.parseInt(request.get("ifRelieveNotice").toString()));
    	alarmCondition.setIfActive(Integer.parseInt(request.get("ifActive").toString()));
    	
    	try {
    		alarmConditionService.createCondition(alarmCondition);
			
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
			
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("添加报警参数失败!");
			
			log.error(e.getMessage(), e);
		}
    	User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=alarmCondition.getConditionName()+" "+PAGE;
		operateLogService.addInsert(loguser, content);
		return commonMsg;
	}
	
	@RequestMapping(value="/getAlarmConditionById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAlarmConditionById(@RequestParam("conditionId") int conditionId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		AlarmCondition condition = alarmConditionService.getAlarmConditionById(conditionId);
			commonMsg.setSuccess(true);
			returnMap.put("alarms", condition);
		return returnMap;	
	}
	
	@RequiresPermissions(value="Tenant.SecurityMgmt.Role.delete")
	@RequestMapping(value="/deleteCondition",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCondition(@RequestParam("conditionId") int conditionId) {
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		AlarmCondition condition = alarmConditionService.getAlarmConditionById(conditionId);
	/*	if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		try {
			this.alarmConditionService.deleteCondition(conditionId);
			conditionStrategyService.deleteStrategy(conditionId);
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("删除失败!");
			
			log.error(e.getMessage(), e);
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=condition.getConditionName()+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return returnedData;
	}
	@RequiresPermissions(value="Tenant.SecurityMgmt.Role.update")
	@RequestMapping(value = "/updateCondition", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage updateCondition(@RequestBody Map<String, Object> requestData) {
		HashMap<String, Object> alarmCondition = (HashMap<String, Object>) requestData.get("alarmCondition");
		AlarmCondition requestModify = new AlarmCondition();
		requestModify.setAlarmConditionId(Integer.parseInt(alarmCondition.get("alarmConditionId").toString()));
		requestModify.setAlarmConditionId(Integer.parseInt(alarmCondition.get("alarmConditionId").toString()));
	   	requestModify.setConditionName(alarmCondition.get("conditionName").toString());
    	requestModify.setInitialAlarmLevelId(Integer.parseInt(alarmCondition.get("initialAlarmLevelId").toString()));
    	requestModify.setDeviceClassId(Integer.parseInt(alarmCondition.get("deviceClassId").toString()));
    	requestModify.setDeviceProperityId(Integer.parseInt(alarmCondition.get("deviceProperityId").toString()));
    	requestModify.setIfAutoPromote(Integer.parseInt(alarmCondition.get("ifAutoPromote").toString()));
    	requestModify.setPromoteValue(Double.valueOf(alarmCondition.get("promoteValue").toString()));
    	requestModify.setJudgeRule(Integer.parseInt(alarmCondition.get("judgeRule").toString()));
    	requestModify.setJudgeJuniorValue(Double.valueOf(alarmCondition.get("judgeJuniorValue").toString()));  	
    	requestModify.setJudgeSeniorValue(Double.valueOf(alarmCondition.get("judgeSeniorValue").toString()));
    	requestModify.setTriggerDuration(Integer.parseInt(alarmCondition.get("triggerDuration").toString()));;
    	requestModify.setRelieveDuration(Integer.parseInt(alarmCondition.get("relieveDuration").toString()));
    	requestModify.setIfRelieveNotice(Integer.parseInt(alarmCondition.get("ifRelieveNotice").toString()));
    	requestModify.setIfActive(Integer.parseInt(alarmCondition.get("ifActive").toString()));
		CommonMessage msg = new CommonMessage();
		try {
			alarmConditionService.updateCondition(requestModify);
			msg.setSuccess(true);
			msg.setErrorMessage("修改条件成功！");
		} catch (Exception e) {

			log.error(e.getMessage(), e);

			msg.setSuccess(false);
			msg.setErrorMessage("修改条件失败！");
		}
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=requestModify.getConditionName()+" "+PAGE;
		operateLogService.addUpdate(loguser, content);
		return msg;
	}
	
	//批量删除
	@RequiresPermissions(value="Tenant.SecurityMgmt.Role.delete")
	@RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage batchDelete(HttpServletRequest request) throws Exception {
		String ids=request.getParameter("ids");
		//String ids1=ids.substring(1, ids.length()-1);
		String[] id=ids.split(",");
		CommonMessage commonMsg = new CommonMessage();
		for (int i = 0; i <id.length; i++)
			{
				try {
					alarmConditionService.deleteCondition(Integer.parseInt(id[i]));
					conditionStrategyService.deleteStrategy(Integer.parseInt(id[i]));
								
					} catch (Exception e) {
					commonMsg.setSuccess(false);
					commonMsg.setErrorMessage("删除操作失败!");
								
					}
			}
		return commonMsg;
	}
}
