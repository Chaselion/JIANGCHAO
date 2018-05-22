package com.zy.dmop.api.web.service;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.SystemLog;


public interface SystemLogService {
		
		public PageResult<SystemLog> pageQuerySystemLog(String startCreateDateStr,String endCreateDateStr,Page page);
		
		
		public List<SystemLog> getSystemLogs();


		void delSystemLogById(long systemLogId);
}