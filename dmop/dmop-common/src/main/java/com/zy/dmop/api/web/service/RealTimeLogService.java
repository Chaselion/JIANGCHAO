package com.zy.dmop.api.web.service;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.RealTimeLog;
import com.zy.dmop.model.SystemLog;

public interface RealTimeLogService {
		
		public PageResult<SystemLog> pageQueryRealtimeLog(String startCreateDateStr,String endCreateDateStr,Page page);
		
		
		public List<SystemLog> getRealtimeLogs();


		void delRealtimeLogById(long realtimeLogId);
}
