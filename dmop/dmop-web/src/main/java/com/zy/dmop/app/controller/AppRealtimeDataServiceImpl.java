package com.zy.dmop.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.web.information.more.realtime.CurrentUpsDataParser;
import com.zy.dmop.web.information.more.realtime.NewRedisListener;

@Component("appRealtimeDataService")
public class AppRealtimeDataServiceImpl implements AppRealtimeDataService {
	@Autowired
	private AppRealtimeDataDao appRealtimeDataDao;
	@Autowired
	private NewRedisListener newRedisListener;
	@Override
	public String queryById(Integer id) {
		String terminalId=appRealtimeDataDao.queryById(id);
		return terminalId;
	}

	@Override
	public Map<String, Object> getCurrentCarData(String terminalId) {
		String fields=null;
        //遍历从redis中取出数据存放的set，讲ups号跟集合中的每一条的第一个值作比较
    	for (String str1 : newRedisListener.getRedisSetShip()) { 
    		
			String[] rs=str1.split(",");
			if(rs[0].equals(terminalId)){
				fields = str1;
			}
		}
		return CurrentUpsDataParser.toMap(fields);
	}

}
