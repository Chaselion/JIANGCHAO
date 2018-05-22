package com.zy.dmop.resource.service;

import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.AlarmDailyCount;
import com.zy.dmop.resource.dao.AlarmStatisticDao;


@Component("alarmStatisticService")
public class AlarmStatisticService{
	@Autowired
	private AlarmStatisticDao alarmStatisticDao;


	public List<AlarmDailyCount> getRecentAlarmDailyCounts(long tenantId, int limit) {
		return this.alarmStatisticDao.getRecentAlarmDailyCounts(tenantId, limit);
	}
	
	
}
