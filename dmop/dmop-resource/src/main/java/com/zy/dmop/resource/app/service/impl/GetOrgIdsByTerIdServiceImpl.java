package com.zy.dmop.resource.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.resource.app.dao.GetOrgIdsByTerIdDao;
import com.zy.dmop.resource.app.service.GetOrgIdsByTerIdService;
@Component("getOrgIdsByTerIdService")
public class GetOrgIdsByTerIdServiceImpl implements GetOrgIdsByTerIdService {
	@Autowired
	private GetOrgIdsByTerIdDao getOrgIdsByTerIdDao;
	@Override
	public Integer getOrgIds(String terminalId) {
		return getOrgIdsByTerIdDao.getOrgIds(terminalId);
	}

}
