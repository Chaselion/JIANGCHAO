package com.zy.dmop.security.controller;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	private static final String LOGIN_PAGE = "login";

	@RequestMapping(method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		boolean isMobile = HttpRequestDeviceUtil.isMobileDevice(request);		
		if(isMobile){
			return "mobile/login";
		}
		return LOGIN_PAGE;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String fail(
			@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String username,
			Map<String, Object> map, HttpServletRequest request) {

		String msg = parseException(request);
		map.put("msg", msg);
		map.put("username", username);
		boolean isMobile = HttpRequestDeviceUtil.isMobileDevice(request);		
		if(isMobile){
			return "mobile/login";
		}else{
			return LOGIN_PAGE;
		}
	}

	private String parseException(ServletRequest request) {
		String errorString = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		Class<?> error = null;
		try {
			if (errorString != null) {
				error = Class.forName(errorString);
			}
		} catch (ClassNotFoundException e) {
			//LOG.error(Exceptions.getStackTraceAsString(e));
		} 
		
		String msg = "其他错误！";
		if (error != null) {
			if (error.equals(UnknownAccountException.class))
				msg = "未知帐号错误！";
			else if (error.equals(IncorrectCredentialsException.class))
				msg = "密码错误！";
			//else if (error.equals(IncorrectCaptchaException.class))
			//	msg = "验证码错误！";
			else if (error.equals(AuthenticationException.class))
				msg = "认证失败！";
			else if (error.equals(DisabledAccountException.class))
				msg = "账号被冻结！";
		}

		return "登录失败，" + msg;
	}
	
}
