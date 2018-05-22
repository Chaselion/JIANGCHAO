package com.zy.dmop.technology.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.IAlarmDao;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.dao.TerminalDao;
import com.zy.dmop.model.DataNum;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
@Component("technologyService")
public class TechnologyServiceImpl implements TechnologyService {
	@Autowired
	private TerminalDao terminalDao;
	@Autowired
	private IAlarmDao iAlarmDao;
	@Autowired
	private OrganizationDao organizationDao;
	public HashSet<Map<String, Object>> getDailyNumToday(long organization_id){
		//根据组织查询
		int o=(int) organization_id;
		//查询组织
		List<Organization> menu=organizationDao.getOrganizations();
		//根据上级组织查询下级组织
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organization_id);
		//查询自己的组织
		Organization aorg=organizationDao.findOrganizationById(o);
		//共同加入到一个组织id的数组中
		orgs.add(aorg);

		List<Terminal> terminals=new ArrayList<Terminal>();
		terminals.clear();
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
		}
		//查询组织id的所有终端
		terminals=terminalDao.listAll(aorgIds);
		orgs.clear();
		List<String> list=new ArrayList<String>();
		//将查询出的终端号加入到list中
		for(Terminal terminal : terminals){
		list.add(terminal.getTerminalNum());
		}
		
		//根据终端号查询表中近七天的数据
		List<DataNum> dataNum=iAlarmDao.getAllData(list);
		int all=dataNum.size();
		//获取当天时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowtime = sdf.format(date);
		
		TreeMap<String,Object> mapValue=new TreeMap<String, Object>();
		//当天比较
		int a=0;
		for (int i = 0; i < all; i++) {
			if(nowtime.equals(sdf.format(dataNum.get(i).getLogTime()))) {
				a+=dataNum.get(i).getThroughput();
			}
		}
		
		//前一天比较
		Date date1 = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		date1=calendar.getTime();
		String time1=sdf.format(date1);
		int a1=0;
		for (int i = 0; i < all; i++) {
			if(time1.equals(sdf.format(dataNum.get(i).getLogTime()))) {
				a1+=dataNum.get(i).getThroughput();
			}
		}
		
		//前两天比较
		Date date2= new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -2);
		date2=calendar.getTime();
		String time2=sdf.format(date2);
		int a2=0;
		for (int i = 0; i < all; i++) {
			if(time2.equals(sdf.format(dataNum.get(i).getLogTime()))) {
				a2+=dataNum.get(i).getThroughput();
			}
		}
		
		//前三天比较
		Date date3= new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -3);
		date3=calendar.getTime();
		String time3=sdf.format(date3);
		int a3=0;
		for (int i = 0; i < all; i++) {
			if(time3.equals(sdf.format(dataNum.get(i).getLogTime()))) {
				a3+=dataNum.get(i).getThroughput();
			}
		}
		
		//前四天比较
		Date date4= new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -4);
		date4=calendar.getTime();
		String time4=sdf.format(date4);
		int a4=0;
		for (int i = 0; i < all; i++) {
			if(time4.equals(sdf.format(dataNum.get(i).getLogTime()))) {
				a4+=dataNum.get(i).getThroughput();
			}
		}
		
		//前五天比较
		Date date5= new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -5);
		date5=calendar.getTime();
		String time5=sdf.format(date5);
		int a5=0;
		for (int i = 0; i < all; i++) {
			if(time5.equals(sdf.format(dataNum.get(i).getLogTime()))) {
				a5+=dataNum.get(i).getThroughput();
			}
		}
		
		//前六天比较
		Date date6= new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -6);
		date6=calendar.getTime();
		String time6=sdf.format(date6);
		int a6=0;
		for (int i = 0; i < all; i++) {
			if(time6.equals(sdf.format(dataNum.get(i).getLogTime()))) {
				a6+=dataNum.get(i).getThroughput();
			}
		}
		mapValue.put(time6, a6);
		mapValue.put(time5, a5);
		mapValue.put(time4, a4);
		mapValue.put(time3, a3);
		mapValue.put(time2, a2);
		mapValue.put(time1, a1);
		mapValue.put(nowtime, a);
		//遍历对象
		HashSet<Map<String,Object>> lineList = new HashSet<Map<String,Object>>();
		lineList.add(mapValue);
		
		return lineList;
	}
}
