package com.zy.dmop.resource.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.RealtimeLogDao;
import com.zy.dmop.api.web.service.RealTimeLogService;
import com.zy.dmop.model.RealTimeLog;
import com.zy.dmop.model.SystemLog;
@Component("realTimeLogService")
public class RealtimeLogServiceImpl implements RealTimeLogService {
	@Autowired
	private RealtimeLogDao realtimeLogDao;
	@Override
	public PageResult<SystemLog> pageQueryRealtimeLog(String startCreateDateStr,String endCreateDateStr,Page page) {
		PageResult<SystemLog> pageResult;
		pageResult = realtimeLogDao.pageQueryRealtimeLog(startCreateDateStr,endCreateDateStr,page);
		return pageResult;
	}

	@Override
	public List<SystemLog> getRealtimeLogs() {
		List<SystemLog> realtimeLogs = realtimeLogDao.getRealtimeLogs();
		return realtimeLogs;
	}

	@Override
	public void delRealtimeLogById(long realtimeLogId) {
		realtimeLogDao.delRealtimeLogById(realtimeLogId);

	}

}
