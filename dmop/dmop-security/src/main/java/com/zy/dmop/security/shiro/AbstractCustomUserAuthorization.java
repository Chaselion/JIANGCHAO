package com.zy.dmop.security.shiro;

import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dmop.api.web.service.CustomService;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.User;

public abstract class AbstractCustomUserAuthorization extends AbstractUserAuthorization implements UserAuthorization {
	/*@Autowired
	protected CustomService customService;*/

	protected void checkCustomState(int customId){
		/*int state = customService.getCustomStateById(customId);
		if(state==CUSTOM_IS_NOT_EXIST){
			throw new UnknownAccountException();
		}
		if(state==CUSTOM_IS_DISABLE){
			throw new UnknownAccountException();
		}	*/
	}
	
	 protected AuthorizationInfo defaultGetCustomAuthorizationInfo(User user) {
		 List<PermissionGroup> permissionGroups = getPermissionGroupOfUser(user);
		 Set<String> groupSet = makePermissionGroupSet(permissionGroups);
		 Set<String> functionSet = getFunctionsAndFunctionPackagesOfPermissionGroups(permissionGroups);
		 SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		 simpleAuthorizationInfo.addRoles(groupSet);
		 simpleAuthorizationInfo.addStringPermissions(functionSet);
		 
		return simpleAuthorizationInfo;
		 
	 }
}
