package com.zy.dmop.web.alarm.core;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.DeviceProperityDao;
import com.zy.dmop.api.web.dao.DevicepropertyDao;
import com.zy.dmop.model.AppDataCache;

@Component("appDataCacheService")
public class AppDataCacheService {
	@Autowired
	private AlarmDataCache alarmDataCache;
	@Autowired
	private DevicepropertyDao devicepropertyDao;
	private static final String PREFIX= "ZHYAN_DMOPDATA_";
	private static final String CACHE_KEY__PREFIX_App2Data=PREFIX+ "app2data_FORALARM";
	
	public void addOriginalAppCache(AppDataCache appDataCache) {
		String param1=String.valueOf(appDataCache.getOrganizationId());
		String param2=appDataCache.getTerminalId();
		String param3=devicepropertyDao.getEnglishName(appDataCache.getProperty());;
		
		String param4=String.valueOf(appDataCache.getValue());
		String param5=String.valueOf(appDataCache.getRemind());
		String param6=String.valueOf(appDataCache.getConfirm());
		String param=param1+","+param2+","+param3+","+param4+","+param5+","+param6;
		
		alarmDataCache.addCarData(CACHE_KEY__PREFIX_App2Data, param);
		
	}

	public List<Map<String, Object>> getFirstData() {
		List<Map<String, Object>> getAppData=alarmDataCache.getAppData(CACHE_KEY__PREFIX_App2Data);
		return getAppData;
	}

	public List<String> getAllAppCache() {
		return alarmDataCache.getAllAppCache(CACHE_KEY__PREFIX_App2Data);
	}

	public void addChangeRimindCache(String cacheKeyPrefixApp2data, String organizationId, String terminalId,
			String property, String value,String remind) {
		String param=organizationId+","+terminalId+","+property+","+value+","+remind+","+"0";
		
		alarmDataCache.addCarData(CACHE_KEY__PREFIX_App2Data, param);
	}
	
	
	
}
