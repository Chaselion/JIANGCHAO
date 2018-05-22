package com.zy.dmop.web.alarm.core;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.stereotype.Component;

import com.zy.dmop.parser.information.AppStateDataEcuParser;
import com.zy.dmop.web.information.more.CarStateDataEcuParser;


@Component("alarmDataCache")
public class AlarmDataCache {
	private static Logger log = Logger.getLogger(AlarmDataCache.class);
	

	@Resource(name="cacheRedisTemplate")
    private  ListOperations<String, String> listOpsTid2UpsData;
		

    
	
    public  void addCarData(String terminalId, String param) {
    	listOpsTid2UpsData.leftPush(terminalId, param);
    	
    }
    //取第一条数据
    public  String getFirstData(String key){
    	String fields =null;
    	if(listOpsTid2UpsData!=null) {
    		
    		fields = listOpsTid2UpsData.index(key, 0);
    	}
    	return fields;
    }
    //取最后一条数据
    public String getLastData(String key){
    	String fields =null;
    	if(listOpsTid2UpsData!=null) {
    		
    		fields = listOpsTid2UpsData.index(key,-1);
    	}
    	return fields;
    }
    public List<Map<String, Object>> getAppData(String key) {
		List<Map<String, Object>> maDatas = new ArrayList<Map<String, Object>>();
		
		List<String> fields = null;
		try {
			fields = listOpsTid2UpsData.range(key, 0, -1);
		} catch (Exception e) {
			log.error("缓存中不存在该终端实时数据"+e);
		}
		if(null==fields) {
    		return maDatas;
    	}

		for (int i = 0; i < fields.size(); i++) {
			Map<String, Object> tmp =AppStateDataEcuParser.toMap(fields.get(i));
			maDatas.add(tmp);
		}
		
		return maDatas;
	}
    /**
     * 删除全部数据
     */
    public void deleteAll(String key){
    	long size = listOpsTid2UpsData.size(key);
    	for(int i = 0;i<size;i++){
    		listOpsTid2UpsData.rightPop(key);
    	}
    }
	public List<String> getAllAppCache(String key) {
		List<String> datas=listOpsTid2UpsData.range(key, 0, -1);
		return datas;
	}
}
