package com.zy.dmop.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.model.DailyCount;
import com.zy.dmop.model.StatusCounter;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.service.AlarmService;
import com.zy.dmop.resource.service.AlarmStatisticService;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
	@Autowired
	private AlarmStatisticService alarmStatisticService;
	@Autowired
	private AlarmService alarmServices;
	@Autowired
	private TerminalService terminalService;


	@RequestMapping(value = "/getData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getStatus() throws Exception {
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		// 获取状态计数
		// Map<String, List<StatusCounter>> typeToStatusCodeCount =
		// tenantRealtimeFacade.fetchCurrentStatus(loginUser);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(date);// 当天时间

		DailyCount dailyCount = alarmServices.getDailyNumToday(time,organizationId);
		List<StatusCounter> list = new ArrayList<>();
		// 报警
		StatusCounter c1 = new StatusCounter(2);
		c1.setCount(dailyCount.getAlarm_count());
		// 在线
		StatusCounter c3 = new StatusCounter(1);
		c3.setCount(dailyCount.getOnline_count());
		// 离线
		StatusCounter c4 = new StatusCounter(0);
		c4.setCount(dailyCount.getOffline_count());

		list.add(c1);
		list.add(c3);
		list.add(c4);
		Map<String, List<StatusCounter>> typeToStatusCodeCount = new HashMap<>();
		typeToStatusCodeCount.put("status", list);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("status_count", typeToStatusCodeCount);
		return returnMap;

	}

	@RequestMapping(value = "/getLineData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getStatusLine() throws Exception {
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		//List<Terminal> terminals = terminalService.findAll(organizationId);
		Map<String, Object> typeToStatusCodeCountLine = new HashMap<>();
		ArrayList<Object> resultList = new ArrayList<>();
		// 获取状态计数
		// Map<String, List<StatusCounter>> typeToStatusCodeCount =
		// tenantRealtimeFacade.fetchCurrentStatus(loginUser);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(date);// 当天时间
       /**
        * 查询七天数据
        */
		DailyCount dailyCount = alarmServices.getDailyNumToday(time,organizationId);
		List<StatusCounter> list = new ArrayList<>();
		// 报警
		StatusCounter c1 = new StatusCounter(2);
		c1.setCount(dailyCount.getAlarm_count());
		// 在线
		StatusCounter c3 = new StatusCounter(1);
		c3.setCount(dailyCount.getOnline_count());
		// 离线
		StatusCounter c4 = new StatusCounter(0);
		c4.setCount(dailyCount.getOffline_count());
		
		list.add(c1);
		list.add(c3);
		list.add(c4);
		
		resultList.add(list);
		//typeToStatusCodeCountLine.put(time, list);


		// 前一天时间
		Date before1 = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		before1 = calendar.getTime();
		String time1 = sdf.format(before1);

		DailyCount dailyCount1 = alarmServices.getDailyNumToday(time1,organizationId);
		List<StatusCounter> list1 = new ArrayList<>();
		// 报警
		StatusCounter a1 = new StatusCounter(2);
		a1.setCount(dailyCount1.getAlarm_count());
		// 在线
		StatusCounter a2 = new StatusCounter(1);
		a2.setCount(dailyCount1.getOnline_count());
		// 离线
		StatusCounter a3 = new StatusCounter(0);
		a3.setCount(dailyCount1.getOffline_count());

	
		list1.add(a1);
		list1.add(a2);
		list1.add(a3);
		
		
		resultList.add(list1);
		//typeToStatusCodeCountLine.put(time1, list1);

		// 前两天
		Date before2 = new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -2);
		before2 = calendar.getTime();
		String time2 = sdf.format(before2);

		DailyCount dailyCount2 = alarmServices.getDailyNumToday(time2,organizationId);
		List<StatusCounter> list2 = new ArrayList<>();
		// 报警
		StatusCounter b1 = new StatusCounter(2);
		b1.setCount(dailyCount2.getAlarm_count());
		// 在线
		StatusCounter b2 = new StatusCounter(1);
		b2.setCount(dailyCount2.getOnline_count());
		// 离线
		StatusCounter b3 = new StatusCounter(0);
		b3.setCount(dailyCount2.getOffline_count());

		list2.add(b1);
		list2.add(b2);
		list2.add(b3);
		
		resultList.add(list2);
		//typeToStatusCodeCountLine.put(time2, list2);

		// 前三天
		Date before3 = new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -3);
		before3 = calendar.getTime();
		String time3 = sdf.format(before3);

		DailyCount dailyCount3 = alarmServices.getDailyNumToday(time3,organizationId);
		List<StatusCounter> list3 = new ArrayList<>();
		// 报警
		StatusCounter d1 = new StatusCounter(2);
		d1.setCount(dailyCount3.getAlarm_count());
		// 在线
		StatusCounter d2 = new StatusCounter(1);
		d2.setCount(dailyCount3.getOnline_count());
		// 离线
		StatusCounter d3 = new StatusCounter(0);
		d3.setCount(dailyCount3.getOffline_count());

		list3.add(d1);
		list3.add(d2);
		list3.add(d3);
		
		resultList.add(list3);

		// 前四天
		Date before4 = new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -4);
		before4 = calendar.getTime();
		String time4 = sdf.format(before4);

		DailyCount dailyCount4 = alarmServices.getDailyNumToday(time4,organizationId);
		List<StatusCounter> list4 = new ArrayList<>();
		// 报警
		StatusCounter e1 = new StatusCounter(2);
		e1.setCount(dailyCount4.getAlarm_count());
		// 在线
		StatusCounter e2 = new StatusCounter(1);
		e2.setCount(dailyCount4.getOnline_count());
		// 离线
		StatusCounter e3 = new StatusCounter(0);
		e3.setCount(dailyCount4.getOffline_count());

		list4.add(e1);
		list4.add(e2);
		list4.add(e3);
		
		resultList.add(list4);
		//typeToStatusCodeCountLine.put(time4, list4);

		// 前五天
		Date before5 = new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -5);
		before5 = calendar.getTime();
		String time5 = sdf.format(before5);

		DailyCount dailyCount5 = alarmServices.getDailyNumToday(time5,organizationId);
		List<StatusCounter> list5 = new ArrayList<>();
		// 报警
		StatusCounter f1 = new StatusCounter(2);
		f1.setCount(dailyCount5.getAlarm_count());
		// 在线
		StatusCounter f2 = new StatusCounter(1);
		f2.setCount(dailyCount5.getOnline_count());
		// 离线
		StatusCounter f3 = new StatusCounter(0);
		f3.setCount(dailyCount5.getOffline_count());

		list5.add(f1);
		list5.add(f2);
		list5.add(f3);
		
		resultList.add(list5);
		//typeToStatusCodeCountLine.put(time5, list5);

		// 前六天
		Date before6 = new Date();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -6);
		before6 = calendar.getTime();
		String time6 = sdf.format(before6);

		DailyCount dailyCount6 = alarmServices.getDailyNumToday(time6,organizationId);
		List<StatusCounter> list6 = new ArrayList<>();
		// 报警
		StatusCounter g1 = new StatusCounter(2);
		g1.setCount(dailyCount6.getAlarm_count());
		// 在线
		StatusCounter g2 = new StatusCounter(1);
		g2.setCount(dailyCount6.getOnline_count());
		// 离线
		StatusCounter g3 = new StatusCounter(0);
		g3.setCount(dailyCount6.getOffline_count());

		list6.add(g1);
		list6.add(g2);
		list6.add(g3);
		
		
		resultList.add(list6);
		typeToStatusCodeCountLine.put("statue", resultList);
        return typeToStatusCodeCountLine;
		

	}
}
