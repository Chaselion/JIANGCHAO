package com.zy.dmop.resource.app.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.model.Organization;
import com.zy.dmop.resource.app.dao.PieGraphDao;
import com.zy.dmop.resource.app.service.PieGraphService;
@Component("pieGraphService")
public class PieGraphServiceImpl implements PieGraphService {
	@Autowired
	private OrganizationDao organizationDao;
	@Autowired
	private PieGraphDao pieGraphDao;
	@Override
	public HashSet<Map<String,Object>> getAlarmLogs(Integer organizationId,String terminalId
			,Date startTime,Date endTime) {
		int o=organizationId;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organizationId);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();
		List<AlarmLog> AlarmLog=pieGraphDao.getAlarmLogs(aorgIds,terminalId,startTime,endTime);
		aorgIds.clear();
		//将事件作为键，多少作为值
		HashSet<Map<String,Object>> pieList = new HashSet<Map<String,Object>>();
		for (int i = 0; i < AlarmLog.size(); i++) {
			Map<String,Object> pieValue=pieGraphDao.getPieValue(AlarmLog.get(i).getConditionName()
					,terminalId,startTime,endTime);
			pieList.add(pieValue);
		}
		return pieList;
	}
}
