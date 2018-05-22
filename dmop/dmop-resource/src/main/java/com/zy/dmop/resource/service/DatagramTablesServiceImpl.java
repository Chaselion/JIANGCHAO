package com.zy.dmop.resource.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.DatagramTablesDao;
import com.zy.dmop.api.web.service.DatagramTablesService;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
@Component("datagramTablesService")
public class DatagramTablesServiceImpl implements DatagramTablesService {
	@Autowired
	private DatagramTablesDao datagramTablesDao;
	@Override
	public List<Organization> getOrgName(Integer orgId) {
		return datagramTablesDao.getOrgName(orgId);
	}

	@Override
	public List<Terminal> getTerName(Integer orgId) {
		return datagramTablesDao.getTerName(orgId);
	}

	@Override
	public List<HistoryData> getData(String terminalNum, String startTime, String endTime) {
		return datagramTablesDao.getData(terminalNum, startTime, endTime);
	}

	@Override
	public List<Terminal> getTerNum(String terName) {
		return datagramTablesDao.getTerNum(terName);
	}

}
