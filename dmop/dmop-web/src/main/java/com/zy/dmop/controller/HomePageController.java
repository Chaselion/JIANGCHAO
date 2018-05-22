package com.zy.dmop.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.zy.dmop.model.DailyCount;
import com.zy.dmop.model.StatusCounter;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.service.AlarmService;

@Controller
@RequestMapping("/homepage")
public class HomePageController {
	@Autowired
	private AlarmService alarmServices;
	
	@RequestMapping(value = "/getData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getStatus() throws Exception {
		// 当天时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(date);
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		DailyCount dailyCount = alarmServices.getDailyNumToday(time,organizationId);
		List<StatusCounter> list = new ArrayList<>();
		// 报警
		StatusCounter c1 = new StatusCounter(2);
		c1.setCount(dailyCount.getAlarm_count());
		// 在线
		StatusCounter c3 = new StatusCounter(1);
		c3.setCount(dailyCount.getOnline_count());
		//吞吐量
		StatusCounter c4 = new StatusCounter(0);
		c4.setCount(dailyCount.getThroughput());
		
		list.add(c1);
		list.add(c3);
		list.add(c4);
		Map<String, List<StatusCounter>> typeToStatusCodeCount = new HashMap<>();
		typeToStatusCodeCount.put("elecve", list);

		// 获取告警每日数量统计
		//List<AlarmDailyCount> alarmDailyCounts = alarmStatisticService.getRecentAlarmDailyCounts(1L, 7);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("status_count", typeToStatusCodeCount);
		//returnMap.put("alarm_daily_count", alarmDailyCounts);
		return returnMap;

	}
}
