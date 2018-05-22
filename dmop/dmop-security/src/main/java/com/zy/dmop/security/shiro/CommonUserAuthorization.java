package com.zy.dmop.security.shiro;

import org.apache.shiro.authz.AuthorizationInfo;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.User;
@Component("userAuthorization")
public class CommonUserAuthorization extends AbstractCustomUserAuthorization implements UserAuthorization {

	@Override
	public void checkUserStatus(User user) {
		
	}

	@Override
	public AuthorizationInfo getAuthorizationInfo(User user) {
		AuthorizationInfo authorizationInfo = defaultGetCustomAuthorizationInfo(user);
		return authorizationInfo;
	}

}
