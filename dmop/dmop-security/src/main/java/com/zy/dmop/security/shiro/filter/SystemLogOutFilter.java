package com.zy.dmop.security.shiro.filter;

import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.dao.OperateLogDao;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.User;

public class SystemLogOutFilter extends LogoutFilter {
	@Autowired
	private OperateLogDao operateLogDao;
	
	
	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		// 在这里执行退出系统前需要进行的操作
		Subject subject = getSubject(request, response);
		User user = (User)subject.getPrincipal();
		
		 OperateLog operateLog = new OperateLog();
		 Object id = null;
		try {
			id = user.getUserId();
		} catch (Exception e) {
		}
		 if(null==id) {
			 operateLog.setOrganizationId(user.getOrganizationId());;
			 operateLog.setCreateDateTime(new Date());
			 operateLog.setModifyDateTime(new Date());
			 operateLog.setText("异常退出");
			 operateLogDao.insertOperateLog(operateLog);
		 }
		 operateLog.setUserId((Integer) id);
		 operateLog.setOrganizationId(user.getOrganizationId());
	     operateLog.setCreateDateTime(new Date());
	     operateLog.setModifyDateTime(new Date());
	     operateLog.setText("退出");
	     operateLogDao.insertOperateLog(operateLog);

		String redirectUrl = getRedirectUrl(request, response, subject);

		try {

			subject.logout();

		} catch (SessionException ise) {

			ise.printStackTrace();

		}

		issueRedirect(request, response, redirectUrl);

		// 返回false表示不执行后续的过滤器，直接返回跳转到登录页面

		return false;

	}
}
