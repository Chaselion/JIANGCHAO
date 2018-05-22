package com.zy.dmop.security.shiro;

import org.apache.shiro.authz.AuthorizationInfo;

import com.zy.dmop.model.User;

public interface UserAuthorization {
	public void checkUserStatus(User user);
	public AuthorizationInfo getAuthorizationInfo(User user);
}
