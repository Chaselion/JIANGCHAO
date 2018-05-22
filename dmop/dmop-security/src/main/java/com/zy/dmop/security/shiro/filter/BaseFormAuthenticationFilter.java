package com.zy.dmop.security.shiro.filter;

import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dmop.api.web.dao.OperateLogDao;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.User;


public class BaseFormAuthenticationFilter extends FormAuthenticationFilter {
	private static Logger log = Logger.getLogger(BaseFormAuthenticationFilter.class);
	@Autowired
	private OperateLogDao operateLogDao;
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
	
		
		httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + this.getSuccessUrl());
//		
		 User user = (User) subject.getPrincipal();
		 OperateLog operateLog = new OperateLog();
		 Object id = null;
		 try {
				id = user.getUserId();
			} catch (Exception e) {
			}
		 operateLog.setUserId((Integer) id);
		 operateLog.setOrganizationId(user.getOrganizationId());
	     operateLog.setCreateDateTime(new Date());
	     operateLog.setModifyDateTime(new Date());
	     operateLog.setText("登录");
	     operateLogDao.insertOperateLog(operateLog);
//		if (user.getUserType() == UserType.SYSTEM) {
//			httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + this.getSuccessUrl());
//		} else if (user.getUserType() == UserType.TENANT) {
//			httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/tenant/index");
//		} else if (user.getUserType() == UserType.SUBTENANT) {
//			httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/subtenant/index");
//		}
		
		return false;
	}
	
	/**
	 * 覆盖isAccessAllowed，改变shiro的验证逻辑。
	 * 避免不能多次登录的错误。
	 * @param request
	 * @param response
	 * @param mappedValue
	 * @return  
	 * @see org.apache.shiro.web.filter.authc.AuthenticatingFilter#isAccessAllowed(javax.servlet.ServletRequest, javax.servlet.ServletResponse, java.lang.Object)
	 */
    @Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		try {
			// 先判断是否是登录操作
			if (isLoginSubmission(request, response)) {
				if (log.isTraceEnabled()) {
					log.trace("Login submission detected.  Attempting to execute login.");
				}
				return false;
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return super.isAccessAllowed(request, response, mappedValue);
	}
}
