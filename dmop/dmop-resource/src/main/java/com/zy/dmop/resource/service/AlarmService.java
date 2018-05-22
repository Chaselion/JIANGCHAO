package com.zy.dmop.resource.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.IAlarmDao;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.dao.TerminalDao;
import com.zy.dmop.model.DailyCount;
import com.zy.dmop.model.DataNum;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;


@Component("alarmServices")
public class AlarmService {
	private static Logger log = Logger.getLogger(AlarmService.class);
	//private static List<Terminal> terminals=new ArrayList<Terminal>();
	@Autowired
	private TerminalDao terminalDao;
	@Autowired
	private IAlarmDao iAlarmDao;
	@Autowired
	private OrganizationDao organizationDao;
	public DailyCount getDailyCountToday(String time){
		DailyCount dailyCount = iAlarmDao.selectDailyCountToday(time);
		DailyCount ifNull = new DailyCount();
		ifNull.setAlarm_count(0);
		ifNull.setOffline_count(0);
		ifNull.setOnline_count(0);
		return dailyCount==null?ifNull:dailyCount;
	}
	
	public DailyCount getDailyNumToday(String time,long organization_id){
		/**
		 * 根据用户所在组织查出用户拥有的组织权限，再查出组织权限内的终端信息
		 */
		int o=(int) organization_id;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organization_id);
		List<Organization> orgnews=new ArrayList<Organization>();
		orgnews.clear();
		orgnews.addAll(orgs);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgnews.add(aorg);

		List<Terminal> terminals=new ArrayList<Terminal>();
		terminals.clear();
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgnews){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		 terminals=terminalDao.listAll(aorgIds);
		orgs.clear();
		List<String> list=new ArrayList<String>();
		for(Terminal terminal : terminals){
		list.add(terminal.getTerminalNum());
		}
		int all=terminals.size();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowtime = sdf.format(date);// 当天时间
		//DailyCount dailyCount = iAlarmDao.selectDailyCountToday(time);
		//List<Terminal> terminals=iAlarmDao.getTerminals();
		List<DataNum> dataNums=iAlarmDao.selectDataNumToday(time,list);
		List<Terminal> onlineterminals=iAlarmDao.getonlineTerminals(list);
		int online=0;
		/**
		 * 判断所传时间是否是当天时间，是则在线数以terminal表实时数据为准，不是则以dataNun表历史数据为准
		 */
		if(nowtime.equals(time)){
			online=onlineterminals.size();
			}else{
				online=dataNums.size();
			}
		int offline=all-online;
		if(offline<0){
			offline=0;
		}
		int alarmcount=0;
		int throughput=0;
		for(int a=0;a<dataNums.size();a++){
			alarmcount+=dataNums.get(a).getAlarmVolume();
			throughput+=dataNums.get(a).getThroughput();
		}
		
		DailyCount ifNull = new DailyCount();
		ifNull.setAlarm_count(alarmcount);
		ifNull.setOffline_count(offline);
		ifNull.setOnline_count(online);
		ifNull.setThroughput(throughput);
		return ifNull;
	}
	
}
