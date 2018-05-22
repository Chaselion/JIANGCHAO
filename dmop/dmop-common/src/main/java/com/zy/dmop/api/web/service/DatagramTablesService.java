package com.zy.dmop.api.web.service;

import java.util.Date;
import java.util.List;

import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;

public interface DatagramTablesService {
	//根据登陆者的组织id查询下面对应的组织id
	public List<Organization> getOrgName(Integer orgId);
	//根据组织id或许终端名称
	public List<Terminal> getTerName(Integer orgId);
	//根据终端号，起始结束时间来查询历史数据
	public List<HistoryData> getData(String terminalNum,String startTime,String endTime);
	public List<Terminal> getTerNum(String terName);

}
