package com.zy.dmop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.alarm.service.AlarmMeasureService;
import com.zy.dmop.api.alarm.service.MeasureStrategyService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.web.util.ServiceUtil;

import net.sf.json.JSONObject;




@Controller
@RequestMapping("/alarmMeasure")
public class AlarmMeasureController {
	private static Logger log = Logger.getLogger(AlarmMeasureController.class);
	//定义一个操作日志的所属界面字符串
			public static final String PAGE = "报警方式";
			@Autowired
			private OperateLogService operateLogService;
	@Autowired
	private AlarmMeasureService alarmMeasureService;
	@Autowired 
	private MeasureStrategyService measureStrategyService;
	//告警条件分页查询
	@RequestMapping(value="/queryMeasurePage",method=RequestMethod.POST)
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
			PageResult<AlarmMeasure> pageResult = alarmMeasureService.pageQueryAlarm(page);
			List<AlarmMeasure> data=pageResult.getData();
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
	
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org.add")
	@RequestMapping(value="/createMeasure",method=RequestMethod.POST)
	@ResponseBody
	public CommonMessage createCondition(@RequestBody Map<String, Object> requestParam) throws Exception {
		HashMap<String, Object> request = (HashMap<String, Object>) requestParam.get("measure");
		CommonMessage commonMsg = new CommonMessage();
		User loginUser = SessionUtil.getCommonUserFromSession();
		AlarmMeasure alarmMeasure = new AlarmMeasure();
    	alarmMeasure.setName(request.get("name").toString());
    	int typeID = Integer.parseInt(request.get("email").toString());
    	alarmMeasure.setEmail(typeID);
    	alarmMeasure.setMessage(0);
    	alarmMeasure.setVoice(0);
    	alarmMeasure.setWhenRelieve(Integer.parseInt(request.get("whenRelieve").toString()));
    	alarmMeasure.setWhenTrigger(Integer.parseInt(request.get("whenTrigger").toString()));
    	alarmMeasure.setIfActive(Integer.parseInt(request.get("ifActive").toString()));
    	alarmMeasure.setNote(request.get("note").toString());
    	alarmMeasure.setFormat(request.get("format").toString());
    	alarmMeasure.setTypeID(typeID);
    	commonMsg = testMeasure(alarmMeasure);
    	if(!commonMsg.isSuccess()) {
    		return commonMsg;
    	}
    	try {
    		alarmMeasureService.createMeasure(alarmMeasure);
			
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
		String content=alarmMeasure.getName()+" "+PAGE;
		operateLogService.addInsert(loguser, content);
		return commonMsg;
	}

	private CommonMessage testMeasure(AlarmMeasure alarmMeasure) {
		CommonMessage commonMsg = new CommonMessage();
		String format = alarmMeasure.getFormat();
    	if(format == null || format.trim().length() == 0) {
    		commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("构造体不可为空");
			return commonMsg;
    	}else {
    		int typeID = alarmMeasure.getTypeID();
    		JSONObject jo  = JSONObject.fromObject("{" + format + "}");
    		if(typeID == 1) {//短信，待扩展其他类型
    			if(jo.containsKey("com") && jo.containsKey("rate") && jo.containsKey("center")) {
//    				String com = jo.getString("com");
//    				String rate = jo.getString("rate");
//    				String center = jo.getString("center");
    			}else {
    				commonMsg.setSuccess(false);
    				commonMsg.setErrorMessage("构造体参数缺失");
    				return commonMsg;
    			}
    		}
    	}
    	commonMsg.setSuccess(true);
		return commonMsg;
	}
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org.delete")
	@RequestMapping(value = "/deleteMeasure", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage delete(@RequestParam("measureId") Integer measureId) throws Exception {
		CommonMessage commonMsg = new CommonMessage();
		User loginUser = SessionUtil.getCommonUserFromSession();
		AlarmMeasure alarmMeasure = new AlarmMeasure();
		AlarmMeasure measure = alarmMeasureService.getMeasureById(measureId);
		alarmMeasure.setAlarmMeasureId(measureId);
		try {
			   alarmMeasureService.deleteMeasure(measureId);
			   measureStrategyService.deleteMeasure(measureId);
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("删除操作失败!");
			log.error(e.getMessage(), e);
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=measure.getName()+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return commonMsg;
	}
	
	@RequestMapping(value = "/testMeasure", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage test(@RequestParam("measureId") Integer measureId, @RequestParam("add") String add) throws Exception {
		CommonMessage commonMsg = new CommonMessage();
		User loginUser = SessionUtil.getCommonUserFromSession();
		AlarmMeasure measure = alarmMeasureService.getMeasureById(measureId);
		JSONObject rev = new JSONObject();
		if(measure != null) {			
			if(measure.getFormat() != null && measure.getFormat().length() > 0) {
				String format = measure.getFormat();
				JSONObject jo = JSONObject.fromObject("{"+format+"}");
				int typeID = measure.getTypeID();
				if(typeID > 0) {
					if(typeID == 1) {//短信,待扩展其他类型				
						try {
							rev = ServiceUtil.sendSMS(jo.getString("com"), add, "测试短信，祝您生活愉快!", null);
						} catch (Exception e) {
							commonMsg.setSuccess(false);
							commonMsg.setErrorMessage("测试操作失败!");
							log.error(e.getMessage(), e);
						}
					}else {
						commonMsg.setSuccess(false);
						commonMsg.setErrorMessage("无效的报警测试！");
					}
				}else {
					commonMsg.setSuccess(false);
					commonMsg.setErrorMessage("无效的报警方式类型!");
					return  commonMsg;
				}
				commonMsg.setSuccess(rev.getBoolean("success"));
				commonMsg.setErrorMessage(rev.getString("message"));
			}else {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage("没有构造体！");
			}
		} else{
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("没有此实体！");
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=measure.getName()+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return commonMsg;
	}
	
	@RequestMapping(value = "/getAlarmWay", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getDeviceClass(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		Map<String, JSONObject> map = CacheUtil.getConfigValues(CacheConstant.CONFIG_ALARM_WAY);
		if (null == map) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("对象不存在");
		} else {
			List<JSONObject> list = new ArrayList<>();
			list.addAll(map.values());
			commonMsg.setSuccess(true);
			returnMap.put("alarmWay", list);
		}
		return returnMap;
	}
	
	@RequestMapping(value = "/getMeasure", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMeasure(@RequestParam("id") Integer id) {
		Map<String, Object> data = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		data.put("commonMessage", commonMsg);

		AlarmMeasure alarmMeasure = alarmMeasureService.getMeasureById(id);
		if (alarmMeasure == null) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("指定条件不存在");

			return data;
		}

		commonMsg.setSuccess(true);
		data.put("alarmMeasure", alarmMeasure);
		return data;
	}
	
	@RequiresPermissions(value="Tenant.SecurityMgmt.Org.update")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage update(@RequestBody Map<String, Object> requestData) {
		HashMap<String, Object> alarmMeasure = (HashMap<String, Object>) requestData.get("alarmMeasure");
		AlarmMeasure requestModify = new AlarmMeasure();
		requestModify.setAlarmMeasureId(Integer.parseInt(alarmMeasure.get("alarmMeasureId").toString()));
		requestModify.setName(alarmMeasure.get("name").toString());
		requestModify.setWhenRelieve(Integer.parseInt(alarmMeasure.get("whenRelieve").toString()));
		requestModify.setWhenTrigger(Integer.parseInt(alarmMeasure.get("whenTrigger").toString()));
		requestModify.setIfActive(Integer.parseInt(alarmMeasure.get("ifActive").toString()));
		requestModify.setNote(alarmMeasure.get("note").toString());
		requestModify.setFormat(alarmMeasure.get("format").toString());
		requestModify.setTypeID(Integer.parseInt(alarmMeasure.get("typeID").toString()));
		CommonMessage msg = new CommonMessage();
		msg = testMeasure(requestModify);
    	if(!msg.isSuccess()) {
    		return msg;
    	}
		User loginUser = SessionUtil.getCommonUserFromSession();
		try {
			alarmMeasureService.updateMeasure(requestModify);
			
			msg.setSuccess(true);
			msg.setErrorMessage("修改条件成功！");
		} catch (Exception e) {

			log.error(e.getMessage(), e);

			msg.setSuccess(false);
			msg.setErrorMessage("修改条件失败！");
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=requestModify.getName()+" "+PAGE;
		operateLogService.addUpdate(loguser, content);
		return msg;
	}
	//批量删除
	    @RequiresPermissions(value="Tenant.SecurityMgmt.Org.delete")
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
						alarmMeasureService.deleteMeasure(Integer.parseInt(id[i]));
						measureStrategyService.deleteMeasure(Integer.parseInt(id[i]));			
									
						} catch (Exception e) {
						commonMsg.setSuccess(false);
						commonMsg.setErrorMessage("删除操作失败!");
									
						}
				}
			return commonMsg;
		}
	
}
