package com.zy.dmop.security.shiro;

import java.util.Collection;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.dexcoder.dal.JdbcDao;
import com.zy.dmop.api.web.service.UserService;
import com.zy.dmop.model.User;

public class ShiroUserDbRealm extends AuthorizingRealm {
	private static final Integer LOGIN_STATE =2;
	@Autowired
	private UserService userService;
	@Autowired
	private UserAuthorization userAuthorization;
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		  UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
		  String username = token.getUsername();
		  User user = userService.findByUsername(username);
		  if (user.getState()==LOGIN_STATE) {
		    	throw new DisabledAccountException();
		    }
		  
		return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getSalt()), getName());
	}
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		Collection<?> collection = principalCollection.fromRealm(getName());
		if (collection == null || collection.isEmpty()) {
            return null;
        }
		User user = (User) collection.iterator().next();
		AuthorizationInfo authorizationInfo = userAuthorization.getAuthorizationInfo(user);
		
		return authorizationInfo;
	}


}
