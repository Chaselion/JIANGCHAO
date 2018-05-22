package com.zy.dmop.api.web.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.OperateCusUserVo;

public interface OperateLogDao {
	public void deleteOperateLog(Long operateLogId);

	public PageResult<OperateCusUserVo> pageQueryOperateLog(String startCreateDateStr,String endCreateDateStr,Page page, List<Integer> aorgIds);

	public List<OperateLog> getOperateLogs();
	
	public void insertOperateLog(OperateLog operateLog);
	
	public List<OperateCusUserVo> exportOperateLog(List<Integer> aorgIds);
	//获取所有操作日志缓存
	public List<OperateLog> getAllOperateLogForCache();
	//
	
}