package com.zy.dmop.controller;

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
import com.zy.dmop.api.common.exception.permission.ConvertComponentToPermissionPoolException;
import com.zy.dmop.api.common.exception.permission.DeletePermissionGroupException;
import com.zy.dmop.api.common.exception.permission.GetPermissionGroupByOrganizationException;
import com.zy.dmop.api.common.exception.permission.QueryPermissionGroupBindedUserException;
import com.zy.dmop.api.common.exception.permission.UnbindPermissionGroupException;
import com.zy.dmop.api.common.exception.permission.UpdatePermissionGroupException;
import com.zy.dmop.api.common.exception.permission.UpdatePermissionPoolException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.api.web.service.PermissionGroupService;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.TreeDataComponent;
import com.zy.dmop.model.User;
import com.zy.dmop.util.CommonMessage;


@Controller
@RequestMapping("/permissiongroup")
public class PermissionGroupController {
	private static Logger log = Logger.getLogger(PermissionGroupController.class);
	//定义一个操作日志的所属界面字符串
		public static final String PAGE = "权限";
		@Autowired
		private OperateLogService operateLogService;
	@Autowired
	private PermissionGroupService permissiongroupService;
	
	@RequestMapping(value="/querypage",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryPermissionGroup(
			@RequestParam(value="start", required=false) Integer start , 
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
			PageResult<PermissionGroup> pageResult = permissiongroupService.pageQueryPermissionGroup(page);
			
			List<PermissionGroup> data = pageResult.getData();
			/*int aa=data.size();
			for(int a=0;a<aa;a++){
			}*/
			commonMsg.setSuccess(true);
			returnMap.put("permissiongroups", data);
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
	
	@SuppressWarnings("unchecked")
	@RequiresPermissions(value="System.SecurityMgmt.Org.add")
	@RequestMapping(value="/create",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createPermissionGroup(@RequestBody Map<String,Object> requestData){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		PermissionGroup permissionGroup = new PermissionGroup();
		Map<String, Object> groupData =  (Map<String, Object>) requestData.get("permissionGroup");
		permissionGroup.setName(groupData.get("name").toString());
		permissionGroup.setDescription(groupData.get("description").toString());
		permissionGroup.setCustomId(loginUser.getCustomId());
		permissionGroup.setOrganizationId(loginUser.getOrganizationId());
		permissionGroup.setCreateDateTime(new Date());
		permissionGroup.setModifyDateTime(new Date());
		List<Map<String, Object>>  poolData =  (List<Map<String, Object>>) requestData.get("permissionPool");
		boolean success = permissiongroupService.createPermissionGroup(permissionGroup,poolData);
		
		if(success){
			commonMsg.setSuccess(true);
		}else {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("授权失败，请联系客服");
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=permissionGroup.getName()+" "+PAGE;
		operateLogService.addInsert(loguser, content);
		
		return returnMap;
		
	}
	@RequestMapping(value="/get",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getById(@RequestParam Integer groupId){
		User loginUser = SessionUtil.getCommonUserFromSession();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		PermissionGroup permissionGroup = permissiongroupService.getPermissionGroupById(groupId);
		if(null!=permissionGroup.getPermissionGroupId()){
			returnMap.put("group", permissionGroup);
			commonMsg.setSuccess(true);
		}else{
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("查询详细信息失败");
		}
		return returnMap;
	}
	
	@RequiresPermissions(value="System.SecurityMgmt.Org.delete")
	@RequestMapping(value="/deletePermissionGroup",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deletePermissionGroup(@RequestParam(value="groupId",required=true) Integer groupId){
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		resultMap.put("commonMessage", commonMsg);	
		PermissionGroup permissionGroup = permissiongroupService.getPermissionGroupById(groupId);
		try {
			permissiongroupService.deletePermissionGroup(groupId);
			commonMsg.setSuccess(true);
		}catch (QueryPermissionGroupBindedUserException e1) {
			log.error(e1);
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("权限组绑定用户查询失败");
		}catch (UnbindPermissionGroupException e2) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("解除权限组绑定失败");
		}catch (DeletePermissionGroupException e3) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("删除权限组失败");
		}catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("操作失败");
		}
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=permissionGroup.getName()+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return resultMap;
	}
	
	@RequiresPermissions(value="System.SecurityMgmt.Org.update")
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> update(@RequestBody Map<String,Object> requestData){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		PermissionGroup permissionGroup = new PermissionGroup();
		Map<String, Object> groupData =  (Map<String, Object>) requestData.get("permissionGroup");
		permissionGroup.setPermissionGroupId((Integer)groupData.get("permissionGroupId"));
		permissionGroup.setName(groupData.get("name").toString());
		permissionGroup.setDescription(groupData.get("description").toString());
		permissionGroup.setCustomId(loginUser.getCustomId());
		permissionGroup.setOrganizationId(loginUser.getOrganizationId());
		permissionGroup.setCreateDateTime(new Date());
		permissionGroup.setModifyDateTime(new Date());
		List<Map<String, Object>>  poolData =  (List<Map<String, Object>>) requestData.get("permissionPool");
		
		try {
			boolean success = permissiongroupService.updatePermissionGroup(permissionGroup,poolData);
			if(success){
				commonMsg.setSuccess(true);
				
			}else{
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage("出现未知错误");
			}
		} catch (UpdatePermissionGroupException e1) {
			log.error(e1);
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("更新权限组失败");
		}catch (ConvertComponentToPermissionPoolException e2) {
			log.error(e2);
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("构建权限树失败");
		}catch (UpdatePermissionPoolException e3) {
			log.error(e3);
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("改变权限池出错");
		}catch (Exception e) {
			log.error(e);
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("出现未知错误");
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=permissionGroup.getName()+" "+PAGE;
		operateLogService.addUpdate(loguser, content);
		return returnMap;
	}
	
	@RequestMapping(value="getPermissionGroupByOrganization",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getPermissionGroupByOrganization(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer Organization = loginUser.getOrganizationId();
		List<PermissionGroup> groups = null;
		try {
			groups = permissiongroupService.getPermissionGroupByOrganization(Organization);
			if(null!=groups){
				returnMap.put("groups", groups);
				commonMsg.setSuccess(true);
			}else {
				commonMsg.setErrorMessage("查询可用的权限组错误");
				commonMsg.setSuccess(false);
			}
		} catch (GetPermissionGroupByOrganizationException e) {	
			commonMsg.setErrorMessage("查询可用的权限组错误");
			commonMsg.setSuccess(false);
			e.printStackTrace();
		} catch (Exception e1) {
			commonMsg.setErrorMessage("出现未知错误");
			commonMsg.setSuccess(false);
			e1.printStackTrace();
		}
		
		
		
		return returnMap;
	}
}
