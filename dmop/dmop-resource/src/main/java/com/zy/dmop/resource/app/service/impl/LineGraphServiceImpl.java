package com.zy.dmop.resource.app.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.model.Organization;
import com.zy.dmop.resource.app.dao.LineGraphDao;
import com.zy.dmop.resource.app.dao.PieGraphDao;
import com.zy.dmop.resource.app.service.LineGraphService;
@Component("lineGraphService")
public class LineGraphServiceImpl implements LineGraphService {
	@Autowired
	private OrganizationDao organizationDao;
	@Autowired
	private LineGraphDao lineGraphDao;
	@Override
	public HashSet<Map<String, Object>> getAlarmLogs(Integer organizationId, String terminalId, Date startTime,
			Date endTime) {
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
		List<AlarmLog> AlarmLog=lineGraphDao.getAlarmLogs(aorgIds,terminalId,startTime,endTime);
		aorgIds.clear();
		//将事件作为键，多少作为值
		HashSet<Map<String,Object>> lineList = new HashSet<Map<String,Object>>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < AlarmLog.size(); i++) {
			Map<String,Object> lineValue=lineGraphDao.getPieValue(AlarmLog.get(i).getCreateDateTime()
					,terminalId,startTime,endTime);
			list.add(lineValue);
		}
		TreeMap<String,Object> mapValue=new TreeMap<String, Object>();
		List<String> timeKey=new ArrayList<String>();
		HashSet<String> key1=new HashSet<String>();
		for (Map<String, Object> map : list) {
			Set<String> time=map.keySet();
			for (String str : time) {  
				timeKey.add(str); 
			}
			Collections.sort(timeKey);
		}
		for (String str:timeKey) {
			for (int i = 0; i < list.size(); i++) {
				Object obj=list.get(i).get(str);
				if(null!=obj) {
					mapValue.put(str, obj);
				}
			}
		}
		lineList.add(mapValue);
		return lineList;
	}
}
