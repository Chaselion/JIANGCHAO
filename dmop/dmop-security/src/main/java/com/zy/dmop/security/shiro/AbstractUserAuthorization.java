package com.zy.dmop.security.shiro;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dmop.api.security.UserState;
import com.zy.dmop.api.security.service.UserPermissionGroupService;
import com.zy.dmop.api.security.service.UserPermissionService;
import com.zy.dmop.api.web.dao.OperateLogDao;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.Permission;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.User;


public abstract class AbstractUserAuthorization {
	private static Logger log = Logger.getLogger(AbstractUserAuthorization.class);
	@Autowired
	protected UserPermissionGroupService userPermissionGroupService;
	
	@Autowired
	private OperateLogDao operateLogDao;
	
	@Autowired
	protected UserPermissionService userPermissionService;
	protected final static int CUSTOM_IS_NOT_EXIST = 0;
	protected final static int CUSTOM_IS_DISABLE = 2;
	protected final static int CUSTOM_IS_AVAILABLE = 1;
	protected final static int CUSTOM_IS_TOURIST = 3;
	
	/*@Autowired
	protected String RoleService;*/
	/**
	 * @TODO 判断用户状态是否异常、在此打登入日志？？？
	 * @param puly
	 */
	protected void defaultCheckUserStatus(User user,OperateLog operateLog) {
		if (user == null) {
	    	log.info("user is null");
	        throw new UnknownAccountException();
	    }
		if (UserState.valueOf(user.getState()) == UserState.REMOVED) {
			log.info("user[" + user.getUsername() + "] is removed");
			throw new UnknownAccountException();
		}
		if (UserState.valueOf(user.getState()) == UserState.DISABLED) {
			log.info("user[" + user.getUsername() + "] is disabled");
			throw new DisabledAccountException();
		}
		 if (UserState.valueOf(user.getState())==UserState.AVAILABLE){
			 log.info("user[" + user.getUsername() + "] is available");
			operateLog.setUserId(user.getUserId());
	    	operateLog.setCreateDateTime(new Date());
	    	operateLog.setModifyDateTime(new Date());
	    	operateLog.setText("登录");
	    	log.debug("进入数据库存储");
	    	operateLogDao.insertOperateLog(operateLog);
	    } 
		
	}
	
	
	protected List<PermissionGroup> getPermissionGroupOfUser(User user) {
		List<PermissionGroup> list = new ArrayList<PermissionGroup>();
		list.add(userPermissionGroupService.findPermissionGroupByUserId(user.getUserId()));
		return list;
	}

	protected Set<String> makePermissionGroupSet(List<PermissionGroup> permissionGroups) {
		Set<String> ownedPermissionGroup = new HashSet<String>();

		for (PermissionGroup group : permissionGroups) {
			ownedPermissionGroup.add(String.valueOf(group.getPermissionGroupId()));
		}
		return ownedPermissionGroup;
	}

	protected Set<String> getFunctionsAndFunctionPackagesOfPermissionGroups(List<PermissionGroup> permissionGroups) {
		Set<String> ownedFunctions = new HashSet<String>();

		for (PermissionGroup group : permissionGroups) {
			
			List<Permission> permissions = userPermissionService.findFunctionsAndFunctionPackagesByPermissionGroupId(group.getPermissionGroupId());

			ownedFunctions.addAll(extractCodes(permissions));
		}

		return ownedFunctions;
	}

	protected Set<String> extractCodes(List<Permission> permissions) {

		List<Set<String>> permissionCodes = new ArrayList<>(); 
		for (Permission permission : permissions) {
			HashSet<String> generatePermissionArray = permission.generatePermissionArray();
			permissionCodes.add(generatePermissionArray);
		}
		HashSet<String> set = permissionCodes.stream().flatMap(Set::stream).collect(Collectors.toCollection(HashSet::new));
		
		return set;
	}
}
