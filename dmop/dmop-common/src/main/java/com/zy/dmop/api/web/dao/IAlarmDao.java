package com.zy.dmop.api.web.dao;

import java.util.Date;
import java.util.List;

import com.zy.dmop.model.DailyCount;
import com.zy.dmop.model.DataNum;
import com.zy.dmop.model.Terminal;



public interface IAlarmDao {
	
	
	public DailyCount selectDailyCountToday(String time);
	public List<DataNum> selectDataNumToday(String time,List<String> terminals);
	
	public List<Terminal> getTerminals();
	List<Terminal> getonlineTerminals(List<String> terminals);
	List<DataNum> getAllData(List<String> terminalIds);
}
