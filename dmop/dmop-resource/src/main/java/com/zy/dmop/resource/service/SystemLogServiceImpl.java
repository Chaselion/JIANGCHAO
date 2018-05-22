package com.zy.dmop.resource.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.SystemLogDao;
import com.zy.dmop.api.web.service.SystemLogService;
import com.zy.dmop.model.SystemLog;

@Component("systemLogService")
@Transactional(propagation=Propagation.REQUIRED)
public class SystemLogServiceImpl implements SystemLogService {
	@Autowired
	private SystemLogDao systemLogDao;
	@Override
	public PageResult<SystemLog> pageQuerySystemLog(String startCreateDateStr,String endCreateDateStr,Page page) throws ErrorMessageException {

		PageResult<SystemLog> pageResult;
		pageResult = systemLogDao.pageQuerySystemLog(startCreateDateStr,endCreateDateStr,page);

		return pageResult;
	}

	@Override
	public void delSystemLogById(long systemLogId) {
		// TODO Auto-generated method stub
		systemLogDao.delSystemLogById(systemLogId);
	}

	@Override
	public List<SystemLog> getSystemLogs(){
		List<SystemLog> systemLogs = systemLogDao.getSystemLogs();
		return systemLogs;
	}
}
