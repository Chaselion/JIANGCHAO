package com.zy.dmop.controller;

import java.text.ParseException;
import java.util.Date;
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

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.CustomService;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.api.web.service.OrganizationService;
import com.zy.dmop.api.web.service.UserService;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.User;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.DateUtil;

@Controller
@RequestMapping("/custom")

public class CustomController {
	private static Logger log = Logger.getLogger(CustomController.class);
	//定义一个操作日志的所属界面字符串
	public static final String PAGE = "客户";
	
	
	@Autowired
	 private CustomService customService;
	@Autowired
	 private OrganizationService organizationService;
	@Autowired
	 private UserService userService;
	@Autowired
	private OperateLogService operateLogService;
	
	@RequestMapping(value="/querypage",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryAlarm(
			@RequestParam(value="start", required=false) Integer start ,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value="countPerPage", required=false) Integer countPerPage) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		//User loginUser = SessionUtil.getCommonUserFromSession();
		
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		
		try {
			PageResult<Custom> pageResult = customService.pageQueryCustom(name,page);
			
			List<Custom> data = pageResult.getData();
			/*int aa=data.size();
			for(int a=0;a<aa;a++){
			}*/
			commonMsg.setSuccess(true);
			returnMap.put("customs", data);
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
	@RequiresPermissions(value="System.SecurityMgmt.Role.add")
	@RequestMapping(value="/create",method=RequestMethod.POST)
	@ResponseBody
	public CommonMessage create(@RequestBody Map<String, Object> requestData) {
		HashMap<String, Object> roleMap = (HashMap<String, Object>) requestData.get("role");
		Custom role = new Custom();
		Organization org=new Organization();
		role.setName(roleMap.get("name").toString());
		role.setDescription(roleMap.get("description").toString());
		role.setCreateDateTime(new Date());
		role.setLinkManName(roleMap.get("linkname").toString());
		role.setLinkManPhone(roleMap.get("linkphone").toString());
		role.setLocation(roleMap.get("location").toString());
		role.setState(Integer.parseInt(roleMap.get("state").toString()));
		role.setType(Integer.parseInt(roleMap.get("type").toString()));
		role.setNote(roleMap.get("note").toString());
		role.setModifyDateTime(new Date());
		User loginUser = SessionUtil.getCommonUserFromSession();
		CommonMessage msg = new CommonMessage();
		String newtimestr=roleMap.get("expiretime").toString();
		Date startCreateDateSql = null;
		long startCreateTime;
		try {
			startCreateTime = DateUtil.getTimeOfDate(newtimestr, "yyyy-MM-dd");	
			startCreateDateSql = new Date(startCreateTime);
			if(startCreateDateSql.before(new Date())){
				msg.setSuccess(false);
				msg.setErrorMessage("新建客户失败，到期时间应大于当天时间！");
				return msg;
			}
			role.setExpireDateTime(startCreateDateSql);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		/*ArrayList<Object> funcIds = (ArrayList<Object>) requestData.get("funcs");
		List<Long> funcIdList = new ArrayList<Long>();
		for (Object funcId : funcIds) {
			funcIdList.add(Long.valueOf(funcId.toString()));
		}
		
		User loginUser = SessionUtil.getCommonUserFromSession();*/
		
		//CommonMessage msg = new CommonMessage();
		
		// 检查传入的功能id是否在用户可用的功能集合内!!!!
	/*	boolean isPermitted = functionService.isPermittedFunctionsAndPackages(loginUser, funcIdList);
		if (!isPermitted) {
			msg.setSuccess(false);
			msg.setErrorMessage("该操作请求了未授权的资源!操作失败!");
			
			return msg;
		}*/
		
		//InvokeQueue invokeQueue = new InvokeQueue();
		try {
			// 1.创建角色
			role = customService.createCustom(role);
			org.setName(role.getName());
			org.setParentId(1);
			org.setCreateDateTime(role.getCreateDateTime());
			org.setType(role.getType());
			org.setCustomId(role.getCustomId());
			org.setAlarmStrategyId(-1);
			organizationService.createOrganization(org);
			
			msg.setSuccess(true);
			msg.setErrorMessage("新建客户成功！");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			
			//手动回滚
			//invokeQueue.invoke();
			
			msg.setSuccess(false);
			msg.setErrorMessage("新建客户失败！");
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=role.getName()+" "+PAGE;
		operateLogService.addInsert(loguser, content);
		return msg;
	}
	//
	@RequestMapping(value="/getLocation",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getLocation(@RequestParam(value="id") int customId) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		data.put("commonMessage", commonMsg);
		
		Custom custom = customService.getCustomById(customId);
		if (custom == null) {
			commonMsg.setSuccess(true);
			data.put("location", "常州");
		} else {
			commonMsg.setSuccess(true);
			data.put("location", custom.getLocation());
		}
		
		return data;
	} 
	
	@RequiresPermissions(value="System.SecurityMgmt.Role.delete")
	@RequestMapping(value="/delete", method= RequestMethod.POST)
   	@ResponseBody
    public CommonMessage delete(@RequestParam(value="id", required=true) int id) {
    	//User loginUser = SessionUtil.getCommonUserFromSession();
		
		CommonMessage msg = new CommonMessage();
		Custom custom =customService.getCustomById(id);
		try {
			// TODO !!!!!!!!!!!!! 如何保证三次数据库操作在一个事务中??????????
			// 由于关联外键，注意删除的顺序！！
			// 删除角色用户关联关系
			
			// 删除用户
			customService.deleteCustom(id);
			List<User> users =userService.getUsersByCustomid(id);
			if(users!=null) {
				int a=users.size();
				for(int i=0;i<a;i++) {
					userService.deleteUser(users.get(0).getUserId());
				}
	
			}
			msg.setSuccess(true);
			msg.setErrorMessage("删除用户成功！");
		} catch (Exception e) {
			
			log.error(e.getMessage(), e);
			
			msg.setSuccess(false);
			msg.setErrorMessage("删除用户失败！");
		}
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=custom.getName()+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return msg;
    }
	
	@RequiresPermissions(value="System.SecurityMgmt.Role.show")
	@RequestMapping(value="/getcustom",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getRole(@RequestParam(value="id") int customId) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		data.put("commonMessage", commonMsg);
		
		Custom role = customService.getCustomById(customId);
		if (role == null) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("指定的客户不存在");
		} else {
			/*List<ConfigMeta> roleOwnedFuncs = roleConfigMetaService.findFunctionsAndFunctionPackagesByRoleId(roleId);
			Set<Long> roleOwnedFuncIds = extractFuncIds(roleOwnedFuncs);
			IFunctionViewTreeDataComponentConverter tdcConverter = new RoleRelateCheckableFunctionViewTreeDataComponentConverter(roleOwnedFuncIds);
			
			User loginUser = SessionUtil.getCommonUserFromSession();
			List<FunctionView> funcTree = functionService.getFunctionTreeByUser(loginUser);
			List<TreeDataComponent> funcs = tdcConverter.convert2TreeDataComponent(funcTree);*/
			
			commonMsg.setSuccess(true);
			data.put("role", role);
			//data.put("funcs", funcs);
		}
			
		return data;
	} 
	@RequiresPermissions(value="System.SecurityMgmt.Role.update")
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public CommonMessage update(@RequestBody Map<String, Object> requestData) {
		HashMap<String, Object> roleMap = (HashMap<String, Object>) requestData.get("role");
		Custom role = new Custom();
		CommonMessage msg = new CommonMessage();
		role.setCustomId(Integer.parseInt(roleMap.get("id").toString()));
		role.setName(roleMap.get("name").toString());
		role.setDescription(roleMap.get("description").toString());
		role.setLinkManName(roleMap.get("linkname").toString());
		role.setLinkManPhone(roleMap.get("linkphone").toString());
		role.setLocation(roleMap.get("location").toString());
		role.setState(Integer.parseInt(roleMap.get("state").toString()));
		role.setNote(roleMap.get("note").toString());
		role.setType(Integer.parseInt(roleMap.get("type").toString()));
		role.setModifyDateTime(new Date());
		String newtimestr=roleMap.get("expiretime").toString();
		Date startCreateDateSql = null;
		long startCreateTime;
		try {
			startCreateTime = DateUtil.getTimeOfDate(newtimestr, "yyyy-MM-dd");
			
			startCreateDateSql = new Date(startCreateTime);
			if(startCreateDateSql.before(new Date())){
				msg.setSuccess(false);
				msg.setErrorMessage("修改客户失败，到期时间应大于当天时间！");
				return msg;
			}
			Date a=new Date();
			role.setExpireDateTime(startCreateDateSql);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			customService.updateCustom(role);
			/*roleConfigMetaService.deleteByRoleId(role.getId());
			roleConfigMetaService.createRoleConfigMetas(role, funcIdList);*/
			
			msg.setSuccess(true);
			msg.setErrorMessage("修改客户成功！");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			
			msg.setSuccess(false);
			msg.setErrorMessage("修改客户失败！");
		}
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=role.getName()+" "+PAGE;
		operateLogService.addUpdate(loguser, content);
		return msg;
	}
	
	
}
