package com.zy.dmop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.zy.dmop.api.alarm.service.AlarmMeasureService;
import com.zy.dmop.api.alarm.service.AlarmStrategyService;
import com.zy.dmop.api.alarm.service.ConditionStrategyService;
import com.zy.dmop.api.alarm.service.MeasureStrategyService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.AlarmStrategy;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.model.User;
import com.zy.dmop.util.CommonMessage;


@Controller
@RequestMapping("/alarmStrategy")
public class AlarmStrategyController {
	private static Logger log = Logger.getLogger(AlarmStrategyController.class);
	//定义一个操作日志的所属界面字符串
	public static final String PAGE = "报警策略";
	@Autowired
	private OperateLogService operateLogService;
	@Autowired
	private AlarmStrategyService alarmStrategyService;
	@Autowired
	private AlarmConditionService alarmConditionService;
	@Autowired
	private AlarmMeasureService alarmMeasureService;
	@Autowired
	private ConditionStrategyService conditionStrategyService;
	
	@Autowired 
	private MeasureStrategyService measureStrategyService;
	
	@RequestMapping(value="/queryAlarmStrategy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryAlarmStrategy(		
			@RequestParam(value="start", required=false) Integer start , 
			@RequestParam(value="countPerPage", required=false) Integer countPerPage) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 15 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		
		try {
			PageResult<AlarmStrategy> pageResult = alarmStrategyService.pageQueryAlarm(page);
			List<AlarmStrategy> data=pageResult.getData();
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
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org05.add")
	@RequestMapping(value="/createStrategy",method=RequestMethod.POST)
	@ResponseBody
	  
	public CommonMessage createStrategy(@RequestBody Map<String, Object> requestParam) throws Exception {
		HashMap<String, Object> request = (HashMap<String, Object>) requestParam.get("strategy");
		CommonMessage commonMsg = new CommonMessage();
		
		User loginUser = SessionUtil.getCommonUserFromSession();

		AlarmStrategy alarmStrategy = new AlarmStrategy();
		alarmStrategy.setName(request.get("name").toString());
		alarmStrategy.setIfActive(Integer.parseInt(request.get("ifActive").toString()));
		alarmStrategy.setNote(request.get("note").toString());
    	
    	try {
    		alarmStrategyService.createStrategy(alarmStrategy);
			
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
		String content=alarmStrategy.getName()+" "+PAGE;
		operateLogService.addInsert(loguser, content);
		return commonMsg;
	}
	
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org05.delete")
	@RequestMapping(value="/deleteStrategy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteStrategy(@RequestParam("strategyId") int strategyId) {
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		AlarmStrategy alarmStrategy = alarmStrategyService.getStrategyById(strategyId);
		try {
			//删除对应条件策略集合表
			this.conditionStrategyService.delete(strategyId);
			//删除对应方式策略集合表
			this.measureStrategyService.delete(strategyId);
			this.alarmStrategyService.deleteStrategy(strategyId);
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
		String content=alarmStrategy.getName()+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return returnedData;
	}
	/**
	 * 根据选择对应策将id插入到集合表中
	 */
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org05.add")
	@RequestMapping(value="/addStrategyId",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addCondition(@RequestParam("strategyId") int strategyId) {
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		try {
			alarmStrategyService.addStrategyId(strategyId);
		} catch (Exception e) {
			log.error("插入失败");
		}
		return returnedData;
	} 
	
	
	/**
	 * 根据是否启动来查询条件的名字
	 * @return
	 */
	@RequestMapping(value="/getConditionNameByIfActive",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getConditionNameByIfActive(@RequestParam("strategyId") int strategyId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		List<AlarmCondition> conditionName = null;    
			conditionName = alarmConditionService.getConditionNameByIfActive(strategyId);
			commonMsg.setSuccess(true);
			returnMap.put("alarms", conditionName);
		return returnMap;	
	}
	
	/**
	 * 根据是否启动来查询方式的名字
	 * @return
	 */
	@RequestMapping(value="/getMeasureNameByIfActive",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMeasureNameByIfActive(@RequestParam("strategyId") int strategyId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		List<AlarmMeasure> measureName = null;    
				measureName = alarmMeasureService.getMeasureNameByIfActive(strategyId);
			commonMsg.setSuccess(true);
			returnMap.put("alarms", measureName);
		return returnMap;	
	}

	
	
	/**
	 * 确定按钮
	 * 根据策略对应id
	 * 返回参数一个为策略对应id
	 * 一个为选择的条件的id集合
	 * 根据添加的条件插入对应的集合表中
	 */
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org05.add")
	@RequestMapping(value="/addConditionToStrategy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addConditionNameToStrategy(@RequestBody Map<String, Object> requestData){
		List<Integer>  conditionIds=(List<Integer>) requestData.get("alarmConditionId");
		Integer strategyId=Integer.parseInt(requestData.get("alarmStrategyId").toString());
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		//先将条件id遍历，取出之后先删除，然后在插入
		try {
			conditionStrategyService.delConditions(strategyId,conditionIds);
		} catch (Exception e) {
			log.error("遍历条件集合表，删除出现问题");
		}
		//删除完之后再将它插入到数据库
		this.alarmStrategyService.addConditionNameToStrategy(conditionIds,strategyId);
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		AlarmStrategy alarmStrategy = alarmStrategyService.getStrategyById(strategyId);
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=alarmStrategy.getName()+" "+PAGE+"的绑定条件";
		operateLogService.addInsert(loguser, content);
		return returnedData;
	}
	
	
	/**
	 * 确定按钮
	 * 根据策略对应id
	 * 返回参数一个为策略对应id
	 * 一个为选择的条件的id集合
	 * 根据添加的方式插入对应的集合表中
	 */
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org05.add")
	@RequestMapping(value="/addMethodToStrategy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addMethodToStrategy(@RequestBody Map<String, Object> requestData){
		List<Integer>  methodIds=(List<Integer>) requestData.get("alarmMethodId");
		Integer strategyId=Integer.parseInt(requestData.get("alarmStrategyId").toString());
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		//先将条件id遍历，取出之后先删除，然后在插入
		try {
			measureStrategyService.delConditions(strategyId,methodIds);
		} catch (Exception e) {
			log.error("遍历方式集合表，删除出现问题");
		}
		//删除完之后再将它插入到数据库
		this.alarmStrategyService.addMethodToStrategy(methodIds,strategyId);
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		AlarmStrategy alarmStrategy = alarmStrategyService.getStrategyById(strategyId);
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=alarmStrategy.getName()+" "+PAGE+"的绑定方式";
		operateLogService.addInsert(loguser, content);
		return returnedData;
	}
	
	
	
	@RequestMapping(value = "/getStrategy", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getStrategy(@RequestParam(value = "id", required = true) Integer id) {
		Map<String, Object> data = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		data.put("commonMessage", commonMsg);
		AlarmStrategy alarmStrategy = alarmStrategyService.getStrategyById(id);
		if (alarmStrategy == null) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("指定条件不存在");

			return data;
		}

		commonMsg.setSuccess(true);
		data.put("alarmStrategy", alarmStrategy);
		return data;
	}
	
	//修改报警策略
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org05.update")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage update(@RequestBody Map<String, Object> requestData) {
		HashMap<String, Object> alarmStrategy = (HashMap<String, Object>) requestData.get("alarmStrategy");
		AlarmStrategy requestModify  = new AlarmStrategy();
		requestModify.setAlarmStrategyId(Integer.parseInt(alarmStrategy.get("alarmStrategyId").toString()));
		requestModify.setName(alarmStrategy.get("name").toString());
		requestModify.setIfActive(Integer.parseInt(alarmStrategy.get("ifActive").toString()));
		requestModify.setNote(alarmStrategy.get("note").toString());
		CommonMessage msg = new CommonMessage();
		User loginUser = SessionUtil.getCommonUserFromSession();
		try {
			alarmStrategyService.updateStrategy(requestModify);
			msg.setSuccess(true);
			msg.setErrorMessage("修改策略成功！");
		} catch (Exception e) {

			log.error(e.getMessage(), e);

			msg.setSuccess(false);
			msg.setErrorMessage("修改策略失败！");
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=requestModify.getName()+" "+PAGE;
		operateLogService.addUpdate(loguser, content);
		return msg;
	}
	
	/**
	 * 对应策略id绑定的条件进行查询
	 */
	@RequestMapping(value="/queryConditions",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryConditions(	
			@RequestParam(value="strategyId", required=false) Integer strategyId) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		try {
			List<AlarmCondition> alarmConditions = conditionStrategyService.getCondition(strategyId);
			commonMsg.setSuccess(true);
			returnMap.put("alarmConditions", alarmConditions);
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
	
	/**
	 * 对应策略id绑定的方式进行查询
	 */
	@RequestMapping(value="/queryMethods",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryMethods(	
			@RequestParam(value="alarmStrategyId", required=false) Integer alarmStrategyId) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		try {
			List<AlarmMeasure> alarmMeasures = measureStrategyService.getMeasure(alarmStrategyId);
			commonMsg.setSuccess(true);
			returnMap.put("alarmMeasures", alarmMeasures);
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
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org05.delete")
	@RequestMapping(value="/deleteConditionStrategy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteConditionStrategy(@RequestParam("strategyId") int strategyId,
			@RequestParam("conditionId") int conditionId) {
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		try {
			conditionStrategyService.deleteConditionStrategy(strategyId, conditionId);
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("删除失败!");
			
			log.error(e.getMessage(), e);
		}
		User loguser=new User();
		AlarmStrategy alarmStrategy = alarmStrategyService.getStrategyById(strategyId);
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=alarmStrategy.getName()+" "+PAGE+"的绑定条件";
		operateLogService.addDelete(loguser, content);
		return returnedData;
	}
	

	@RequiresPermissions(value="Tenant.SecurityMgmt.Org05.delete")
	@RequestMapping(value="/deleteMeasureStrategy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMeasureStrategy(@RequestParam("strategyId") int strategyId,
			@RequestParam("measureId") int measureId) {
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		try {
			alarmStrategyService.deleteMeasureStrategy(strategyId, measureId);
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("删除成功");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("删除失败!");
			
			log.error(e.getMessage(), e);
		}
		User loguser=new User();
		AlarmStrategy alarmStrategy = alarmStrategyService.getStrategyById(strategyId);
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=alarmStrategy.getName()+" "+PAGE+"的绑定方式";
		operateLogService.addDelete(loguser, content);
		return returnedData;
	}

}
