package com.zy.dmop.controller;

import java.awt.Robot;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.alarm.service.AlarmLogService;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.dao.DevicepropertyDao;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.api.web.service.OrganizationService;
import com.zy.dmop.api.web.service.PermissionGroupService;
import com.zy.dmop.api.web.service.UserService;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.OrganizationView;
import com.zy.dmop.model.vo.UserView;
import com.zy.dmop.resource.service.IncorrectPasswordException;
import com.zy.dmop.spring.web.util.ViewUtil;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.StringUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	private static Logger log = Logger.getLogger(UserController.class);
	//定义一个操作日志的所属界面字符串
			public static final String PAGE = "用户";
	@Autowired
	private UserService userService;
	@Autowired
	private AlarmLogService alarmService;
	@Autowired
	private OrganizationService organizationService;

	@Autowired
	private PermissionGroupService permissiongroupService;
	@Autowired
	private OperateLogService operateLogService;
	@RequiresUser
	@RequestMapping(value = "/queryUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> query(@RequestParam(value = "realname", required = true) String realname,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "orgId", required = false) Integer queryOrgId,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "startCreateDate", required = false) String startCreateDateStr,
			@RequestParam(value = "endCreateDate", required = false) String endCreateDateStr,

			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "countPerPage", required = false) Integer countPerPage) {
		//
		// Subject subject = SecurityUtils.getSubject();
		//
		// subject.getPrincipal());
		//
		// Module root = moduleService.getModuleTree();
		//
		// filterNotPermitted(root, subject);
		realname = StringUtil.convertNullToEmpty(realname);
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;

		 User loginUsera = SessionUtil.getCommonUserFromSession();
		 Integer customId=loginUsera.getCustomId();
		 Integer organizationId = loginUsera.getOrganizationId();
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		PageResult<User> pageResult=userService.queryUsers(organizationId,realname,page);
		//PageResult<User> pageResult = userService.queryUsers(loginUser, username, realname, queryOrgId, status,startCreateDateStr, endCreateDateStr, page);
		List<OrganizationView> orgTrees = organizationService.getOrgsTreeByUser(loginUsera.getCustomId());
		List<UserView> userViews = ViewUtil.convertToUserViews(pageResult.getData(), orgTrees);

		List<Map<String, Object>> paramList = new ArrayList<Map<String, Object>>();
		for (UserView uv : userViews) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", String.valueOf(uv.getId()));
			map.put("username", uv.getUsername());
			map.put("realname", uv.getRealname());
			map.put("mobilePhone", uv.getMobilePhone());
			map.put("email", uv.getEmail());
			map.put("password", uv.getPassword());
			map.put("note", uv.getNote());
			map.put("permission", permissiongroupService.getPermissionGroupById(uv.getPermissionGroupId()).getName());

			// map.put("organization_id",
			// String.valueOf(uv.getOrganization_id()));
			// map.put("organization_name", uv.getOrganizationName());
			map.put("organization_path", uv.getOrganizationPath());
			// map.put("status_display",
			// getStatusDisplayString(uv.getStatus()));
			map.put("status", uv.getStatus());
			map.put("createTime", uv.getCreatTime());
			map.put("modifyTime", uv.getModifyTime());
			// map.put("editable", EntityPermissionHelper.getEditable(uv,
			// loginUser));
			map.put("alarmlevelid", uv.getAlarmLevelId());
			paramList.add(map);
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		commonMsg.setSuccess(true);
		data.put("commonMessage", commonMsg);
		data.put("users", paramList);
		data.put("page", pageResult.getPage());
		return data;
	}
    
	@RequiresPermissions(value="System.SecurityMgmt.User.show")
	@RequestMapping(value = "/getUserWithRole", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getUserWithRole(@RequestParam(value = "id", required = true) int id,
			@RequestParam(value = "onlyUserOwn", required = false) Boolean onlyUserOwn) {
		onlyUserOwn = onlyUserOwn == null ? Boolean.FALSE : onlyUserOwn;

		Map<String, Object> data = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		data.put("commonMessage", commonMsg);

		User user = userService.getUserById(id);
		if (user == null) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("指定的用户不存在");

			return data;
		}

		Organization org = organizationService.getOrganizationById(user.getOrganizationId());
		// user.setOrganization(org);

		List<Map<String, Object>> paramList = new ArrayList<Map<String, Object>>();
		commonMsg.setSuccess(true);
		data.put("user", user);
		data.put("organization", org);
		return data;
	}
	@RequiresPermissions(value="System.SecurityMgmt.User.add")
	 @RequestMapping(value="/create", method= RequestMethod.POST)
		@ResponseBody
	    public CommonMessage create(@RequestBody Map<String, Object> requestData) {
	    	HashMap<String, Object> userMap = (HashMap<String, Object>) requestData.get("user");
			User newUser = new User();
			newUser.setUsername(userMap.get("username").toString());
			newUser.setPassword(userMap.get("password").toString());
			newUser.setRealname(userMap.get("realname").toString());
			newUser.setMobilePhone(userMap.get("mobilePhone").toString());
			newUser.setEmail(userMap.get("email").toString());
			newUser.setOrganizationId(Integer.parseInt(userMap.get("orgId").toString()));
			newUser.setState(Integer.parseInt(userMap.get("status").toString()));
			//newUser.setRegisterDateTime(new Date());
			newUser.setNote(userMap.get("note").toString());
			Integer groupId = Integer.parseInt(userMap.get("groupId").toString());
			newUser.setPermissionGroupId(groupId==0?null:groupId);
			newUser.setAlarmLevelId(Integer.parseInt(userMap.get("alarmlev").toString()));
	    	CommonMessage msg = new CommonMessage();
			
			if (newUser.getState() ==0) {
				msg.setSuccess(false);
				msg.setErrorMessage("该操作请求了未授权的资源!操作失败!");
				
				return msg;
			}
			if (newUser.getOrganizationId()==1) {
				msg.setSuccess(false);
				msg.setErrorMessage("授予的组织架构越权!操作失败!");
				
				return msg;
			}
			User sameNameUser = userService.findUserByUsername(newUser.getUsername());
			if (sameNameUser != null) {
				msg.setSuccess(false);
				msg.setErrorMessage("创建失败!用户名已存在。");
				
				return msg;
			}
			Integer customId=organizationService.getcustomId(newUser.getOrganizationId());
			User loginUser = SessionUtil.getCommonUserFromSession();
			newUser.setCustomId(customId);
			// TODO 检查用户名是否存在
			
			// 检查传入的组织id是否在用户可用的组织集合内!!!!
			/*boolean isOrganizationPermitted = organizationService.isPermittedOrganization(loginUser, loginUser.getOrganizationId());
			if (!isOrganizationPermitted) {
				msg.setSuccess(false);
				msg.setErrorMessage("该操作请求了未授权的资源!操作失败!");
				
				return msg;
			}
			
			List<Long> roleIdList = extractRoleIds(requestData);
			
			// 检查传入的角色id是否在用户可用的角色集合内!!!!
			boolean isPermitted = roleService.isPermittedRoles(loginUser, roleIdList);
			if (!isPermitted) {
				msg.setSuccess(false);
				msg.setErrorMessage("该操作请求了未授权的资源!操作失败!");
				
				return msg;
			}
			
			UserType userType = loginUser.getUserType();
			if (userType == UserType.SYSTEM) {
				newUser.setCreatorType(UserCreatorType.SYSTEM_CREATED);
				newUser.setUserType(UserType.SYSTEM);
				newUser.setTenantId(Const.NULL_TENANT_ID);
				newUser.setParentTenantId(Const.NULL_TENANT_ID);
			} else if (userType == UserType.TENANT) {
				newUser.setCreatorType(UserCreatorType.TENANT_CREATED);
				newUser.setUserType(UserType.TENANT);
				newUser.setTenantId(loginUser.getTenantId());
				newUser.setParentTenantId(Const.NULL_TENANT_ID);
			} else if (userType == UserType.SUBTENANT) {
				newUser.setCreatorType(UserCreatorType.SUBTENANT_CREATED);
				newUser.setUserType(UserType.SUBTENANT);
				newUser.setTenantId(loginUser.getTenantId());
				newUser.setParentTenantId(loginUser.getParentTenantId());
			}*/

			//InvokeQueue invokeQueue = new InvokeQueue();
			try {
				newUser = userService.createUser(newUser);
				/*final User innerUser = newUser;
				invokeQueue.offerFirst(new Runnable() {
					@Override
					public void run() {
						try {
							userService.deleteUser(innerUser.getId());
						} catch (Exception e) {
							log.error(e.getMessage(), e);
						}
					}
				});
				
				userRoleService.createUserRoles(newUser, roleIdList);*/
				
				msg.setSuccess(true);
				msg.setErrorMessage("新建用户成功！");
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				
				//手动回滚
				//invokeQueue.invoke();
				
				msg.setSuccess(false);
				msg.setErrorMessage("新建用户失败！");
			}
			User loguser=new User();
			loguser.setUserId(loginUser.getUserId());
			loguser.setOrganizationId(loginUser.getOrganizationId());
			String content=newUser.getUsername()+" "+PAGE;
			operateLogService.addInsert(loguser, content);
			return msg;
	    }
	@RequestMapping(value = "/lock", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage lock(@RequestParam(value = "id", required = true) int id) {
		CommonMessage msg = new CommonMessage();

		// User loginUser = SessionUtil.getCommonUserFromSession();

		User targetModifyUser = userService.getUserById(id);
		if (targetModifyUser == null) {
			msg.setSuccess(false);
			msg.setErrorMessage("用户不存在!");
			return msg;
		}

		// 检查请求被修改的用户是否可被修改
		/*
		 * boolean isUserEditPermitted = EntityPermissionHelper.getEditable(new
		 * UserView(targetModifyUser), loginUser); if (!isUserEditPermitted) {
		 * msg.setSuccess(false); msg.setErrorMessage("该操作请求了未授权的资源!操作失败!");
		 * 
		 * return msg; }
		 */

		try {
			userService.updateUserStatus(id, 2);
			
			msg.setSuccess(true);
			msg.setErrorMessage("禁用用户成功！");
		} catch (Exception e) {

			log.error(e.getMessage(), e);

			msg.setSuccess(false);
			msg.setErrorMessage("禁用用户失败！");
		}

		return msg;
	}

	@RequestMapping(value = "/unlock", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage unlock(@RequestParam(value = "id", required = true) int id) {
		CommonMessage msg = new CommonMessage();

		// User loginUser = SessionUtil.getCommonUserFromSession();

		User targetModifyUser = userService.getUserById(id);
		if (targetModifyUser == null) {
			msg.setSuccess(false);
			msg.setErrorMessage("用户不存在!");
			return msg;
		}

		// 检查请求被修改的用户是否可被修改
		/*
		 * boolean isUserEditPermitted = EntityPermissionHelper.getEditable(new
		 * UserView(targetModifyUser), loginUser); if (!isUserEditPermitted) {
		 * msg.setSuccess(false); msg.setErrorMessage("该操作请求了未授权的资源!操作失败!");
		 * 
		 * return msg; }
		 */

		try {
			userService.updateUserStatus(id, 1);

			msg.setSuccess(true);
			msg.setErrorMessage("启用用户成功！");
		} catch (Exception e) {

			log.error(e.getMessage(), e);

			msg.setSuccess(false);
			msg.setErrorMessage("启用用户失败！");
		}

		return msg;
	}
	
	@RequiresPermissions(value="System.SecurityMgmt.User.delete")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage delete(@RequestParam(value = "id", required = true) int id) {
		// User loginUser = SessionUtil.getCommonUserFromSession();

		CommonMessage msg = new CommonMessage();

		User requestUser = userService.getUserById(id);
		/*
		 * if (requestUser != null) { //检查传入的user是否可被当前用户删除 if
		 * (!EntityPermissionHelper.getEditable(new UserView(requestUser),
		 * loginUser)) { msg.setSuccess(false);
		 * msg.setErrorMessage("该操作请求了未授权的资源!操作失败!");
		 * 
		 * return msg; } } else { msg.setSuccess(true);
		 * msg.setErrorMessage("删除用户成功！");
		 * 
		 * return msg; }
		 */

		try {
			// TODO !!!!!!!!!!!!! 如何保证三次数据库操作在一个事务中??????????
			// 由于关联外键，注意删除的顺序！！
			// 删除角色用户关联关系
			// userRoleService.deleteByUserId(id);
			// 删除用户
			userService.deleteUser(id);

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
		String content=requestUser.getUsername()+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return msg;
	}
    
	@RequiresPermissions(value="System.SecurityMgmt.User.update")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage update(@RequestBody Map<String, Object> requestData) {
		HashMap<String, Object> userMap = (HashMap<String, Object>) requestData.get("user");
		User requestModifyUser = new User();
		requestModifyUser.setUserId(Integer.parseInt(userMap.get("id").toString()));
		requestModifyUser.setRealname(userMap.get("realname").toString());
		requestModifyUser.setMobilePhone(userMap.get("mobilePhone").toString());
		requestModifyUser.setEmail(userMap.get("email").toString());
		requestModifyUser.setOrganizationId(Integer.parseInt(userMap.get("orgId").toString()));
		requestModifyUser.setState(Integer.parseInt(userMap.get("status").toString()));
		requestModifyUser.setAlarmLevelId(Integer.parseInt(userMap.get("alarmlev").toString()));
		Integer permissionGroupId = Integer.parseInt(userMap.get("groupId").toString());
		requestModifyUser.setPermissionGroupId(permissionGroupId==0?null:permissionGroupId);
		requestModifyUser.setNote(userMap.get("note").toString());
		CommonMessage msg = new CommonMessage();
		if (requestModifyUser.getOrganizationId()==1) {
			msg.setSuccess(false);
			msg.setErrorMessage("授予的组织等级越权!操作失败!");
			
			return msg;
		}

	

		// User loginUser = SessionUtil.getCommonUserFromSession();

		// TODO 检查用户名是否存在

		User targetModifyUser = userService.getUserById(requestModifyUser.getUserId());
		if (targetModifyUser == null) {
			msg.setSuccess(false);
			msg.setErrorMessage("用户不存在!");
			return msg;
		}


		try {
			// TODO !!!!!!!!!!!!! 如何保证三次数据库操作在一个事务中??????????
			userService.updateUser(requestModifyUser);
	
			msg.setSuccess(true);
			msg.setErrorMessage("修改用户成功！");
		} catch (Exception e) {

			log.error(e.getMessage(), e);

			msg.setSuccess(false);
			msg.setErrorMessage("修改用户失败！");
		}
		User loguser=new User();
		User loginUser = SessionUtil.getCommonUserFromSession();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=targetModifyUser.getUsername()+" "+PAGE;
		operateLogService.addUpdate(loguser, content);
		return msg;
	}

	@RequestMapping(value = "/initpsd", method = RequestMethod.POST)
	@ResponseBody
	//重置用户密码
	public CommonMessage initpsd(@RequestParam(value = "id", required = true) int id) {
		CommonMessage msg = new CommonMessage();

		User targetModifyUser = userService.getUserById(id);
		if (targetModifyUser == null) {
			msg.setSuccess(false);
			msg.setErrorMessage("用户不存在!");
			return msg;
		}

		try {
			// TODO !!!!!!!!!!!!! 如何保证三次数据库操作在一个事务中??????????
			userService.initPwd(targetModifyUser, "123456");
			// userRoleService.deleteByUserId(targetModifyUser.getId());
			// userRoleService.createUserRoles(targetModifyUser, roleIdList);

			msg.setSuccess(true);
			msg.setErrorMessage("重置密码成功！");
		} catch (Exception e) {

			log.error(e.getMessage(), e);

			msg.setSuccess(false);
			msg.setErrorMessage("重置密码失败！");
		}

		return msg;
	}

	@RequestMapping(value = "/queryByPermissionGroup", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryByPermissionGroup(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		resultMap.put("commonMessage", commonMsg);
		String group = request.getParameter("groupId");
		//查询绑定该权限组的用户
		List<User> users = userService.getUserByPermissionGroup(Integer.parseInt(group));
		
		
			commonMsg.setSuccess(true);
			resultMap.put("affectUsers", users);
		
		return resultMap;

	}	
	
	 @RequestMapping(value="/updatePwd", method= RequestMethod.POST)
		@ResponseBody
	    public CommonMessage updatePwd(@RequestBody Map<String, Object> requestData) {
			String oldPwd = requestData.get("oldpassword").toString();
			String newPwd = requestData.get("newpassword").toString();
			String confirmPwd = requestData.get("confirmpassword").toString();
			
	    	CommonMessage msg = new CommonMessage();
			if (newPwd.equals(confirmPwd)) {
				User loginUser = SessionUtil.getCommonUserFromSession();
				
				try {
					userService.updatePwd(loginUser, oldPwd, newPwd);
					
					msg.setSuccess(true);
					msg.setErrorMessage("修改密码成功!");
				} catch(IncorrectPasswordException e) {
					msg.setSuccess(false);
					msg.setErrorMessage(e.getMessage());
				} catch (Exception e) {
					log.error(e.getMessage(), e);
					
					msg.setSuccess(false);
					msg.setErrorMessage("修改密码失败!");
				}
			} else {
				msg.setSuccess(false);
				msg.setErrorMessage("修改密码失败!两次输入的密码不一致!");
			}
			
			return msg;
	    }
	}


