package com.zy.dmop.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.alarm.dao.AlarmStrategyDao;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.CustomService;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.api.web.service.OrganizationService;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.api.web.service.UserService;
import com.zy.dmop.model.AlarmStrategy;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;
import com.zy.dmop.util.CommonMessage;



@Controller
@RequestMapping("/organization")
public class OrganizationController {
	private static final Logger log = Logger.getLogger(OrganizationController.class);
	//定义一个操作日志的所属界面字符串
		public static final String PAGE = "组织";
		@Autowired
		private OperateLogService operateLogService;
	@Autowired
	private OrganizationService organizationService;
	
	@Autowired
	private AlarmStrategyDao alarmStrategy;
	
	@Autowired
	private CustomService customService;
	@Autowired
	private UserService userService;
	@Autowired
	private TerminalService terminalService;
	
	
	@RequiresPermissions(value="System.SecurityMgmt.Ani.add")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage add(@RequestBody Organization org) throws Exception {
		log.info("request AddOrg");
		
		org.setCreateDateTime(new Date());
		org.setModifyDateTime(new Date());
		User loginUser = SessionUtil.getCommonUserFromSession();
		int customId=organizationService.getcustomId(org.getParentId());
		org.setCustomId(customId);
		//UserType userType = loginUser.getUserType();
	//	if (userType == UserType.SYSTEM) {
			
			//org.setType(1);
		/*} else {
			org.setTenantId(loginUser.getTenantId());
			if (userType == UserType.TENANT) {
				org.setType(OrganizationType.TENANT);
			} else if (userType == UserType.SUBTENANT) {
				org.setType(OrganizationType.SUBTENANT);
			}
		}*/
		
		CommonMessage commonMsg = new CommonMessage();
		try {
			organizationService.createOrganization(org);
			
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
			
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("添加组织信息失败!");
			
			log.error(e.getMessage(), e);
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=org.getName()+" "+PAGE;
		operateLogService.addInsert(loguser, content);
		return commonMsg;
	}
	
	@RequestMapping(value = "/getOrg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getById(@RequestParam("orgId") int orgId) throws Exception {
		log.info("request getById");
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		Organization organization = organizationService.getOrganizationById(orgId);
		if (organization == null) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("指定的组织不存在");
		} else {
			
			commonMsg.setSuccess(true);
			returnMap.put("org", organization);
		}
		
		return returnMap;
	}
	
	@RequiresPermissions(value="System.SecurityMgmt.Ani.update")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage update(@RequestBody Organization org) {
		log.info("request update");
		
		CommonMessage msg = new CommonMessage();
		
		// TODO 检查传入的org是否可被当前用户修改
		try {
			org.setModifyDateTime(new Date());
			organizationService.updateOrganization(org);
			List<Terminal> list=terminalService.findAll(org.getOrganizationId());
			if(list!=null){
			for(Terminal terminal:list){
				terminalService.updateStrategy(terminal.getTerminalId(), org.getAlarmStrategyId());
			  }
			}
			msg.setSuccess(true);
			msg.setErrorMessage("更新组织信息成功！");
		} catch (Exception e) {
			
			log.error(e.getMessage(), e);
			
			msg.setSuccess(false);
			msg.setErrorMessage("更新组织信息失败！");
		}
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=org.getName()+" "+PAGE;
		operateLogService.addUpdate(loguser, content);
		return msg;
	}

	@RequiresPermissions(value="System.SecurityMgmt.Ani.delete")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage delete(@RequestParam("orgId") int orgId) {
		log.info("request delete");
		
		CommonMessage msg = new CommonMessage();
		Organization org = organizationService.getOrganizationById(orgId);
		// 检查组织下是否还有子组织
		long childrenCount = organizationService.getChildOrganizationCount(orgId);
		if (childrenCount > 0) {
			msg.setSuccess(false);
			msg.setErrorMessage("删除失败！该组织还有下级组织，请先删除下级组织后重试！");
			return msg;
		}
		if (orgId ==1) {
			msg.setSuccess(false);
			msg.setErrorMessage("删除失败！dmop根组织不能删除！");
			return msg;
		}
		
		try {
			userService.deleteUserByOrg(orgId);
			terminalService.deleteTerminalByOrg(orgId);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 检查组织下是否还有用户
		/*long userCount = userService.getUserCountOfOrganization(orgId);
		if (userCount > 0) {
			msg.setSuccess(false);
			msg.setErrorMessage("删除失败！该组织下还有用户，请先删除用户后重试！");
			return msg;
		}*/
		
		// 删除组织
		try {
			organizationService.deleteOrganization(orgId);
			
			msg.setSuccess(true);
			msg.setErrorMessage("删除组织成功！");
		} catch (Exception e) {
			
			log.error(e.getMessage(), e);
			
			msg.setSuccess(false);
			msg.setErrorMessage("删除组织失败！");
		}
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=org.getName()+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return msg;
	}
	
	@RequestMapping(value="/queryAlarmStrategy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryAlarmCause() throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		User loginUser = SessionUtil.getCommonUserFromSession();
//		if (loginUser.getUserType() != UserType.TENANT) {
//			commonMsg.setSuccess(false);
//			commonMsg.setErrorMessage(MessageConst.ERRORMSG_UNAUTHORIZED);
//			return returnMap;
//		}
		
		List<AlarmStrategy> list = alarmStrategy.selectAllAlarmStrategy();
		if (list != null) {
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("成功获取报警策略");
			returnMap.put("alarmStrategy", list);
		}else {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("获取报警策略失败");
		}
		
		return returnMap;
	}
	@RequestMapping(value="/querycustom",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> querycustom() throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		User loginUser = SessionUtil.getCommonUserFromSession();
//		if (loginUser.getUserType() != UserType.TENANT) {
//			commonMsg.setSuccess(false);
//			commonMsg.setErrorMessage(MessageConst.ERRORMSG_UNAUTHORIZED);
//			return returnMap;
//		}
		
		List<Custom> list = customService.getCustoms();
		if (list != null) {
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("成功获取报警策略");
			returnMap.put("customs", list);
		}else {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("获取报警策略失败");
		}
		
		return returnMap;
	}
	
	
	
	
	
	
	
	
	
	
	
}
