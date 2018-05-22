package com.zy.dmop.api.security.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.zy.dmop.model.User;


public class SessionUtil {
	public static User getCommonUserFromSession() {
//		CommonUser commonUser = (CommonUser) Contexts.getSessionContext().get(Const.SESSION_KEY_USER);
//		return commonUser;
		
		Subject subject = SecurityUtils.getSubject();
		return (User) subject.getPrincipal();
	}
	
	public static boolean hasRole(String roleId) {
		Subject subject = SecurityUtils.getSubject();
		return subject.hasRole(roleId);
	}
	
	
}
