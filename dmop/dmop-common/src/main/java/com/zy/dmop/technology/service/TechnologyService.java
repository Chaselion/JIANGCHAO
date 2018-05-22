package com.zy.dmop.technology.service;

import java.util.HashSet;
import java.util.Map;

public interface TechnologyService {
	//近七日的吞吐量统计
	HashSet<Map<String,Object>> getDailyNumToday(long organization_id);
	
	//当天终端状态分布（现成）
	
	//近七日报警历史原因分布（现成）
	
	//近七日报警数量统计（现成）
	
	//报警列表（现成）
}
