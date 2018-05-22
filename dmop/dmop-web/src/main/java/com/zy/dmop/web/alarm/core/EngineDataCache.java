package com.zy.dmop.web.alarm.core;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.Terminal;
import com.zy.dmop.web.information.more.CarStateDataEcuParser;
import com.zy.dmop.web.information.more.TH1StateDataEcuParser;


/**
 * 数据缓存接口。
 * @author 
 *
 */
@Component("engineDataCache")
public class EngineDataCache {
	private static Logger log = Logger.getLogger(EngineDataCache.class);
	
	private static final String PREFIX1 = "ZHYAN_DMOPDATA_";
	
	private static final String CACHE_KEY__PREFIX_TerminalId2CarData = PREFIX1 + "tid2data_";
	
	//定义通用的前缀key名
	private static final String PREFIX2 ="DMOP_ALARMDATA_";
	//定义终端绑定策略的key
	private static final String CACHE_KEY__PREFIX_Bind2Data = PREFIX2 +"BIND";
	//定义计时缓存的key
	private static final String CACHE_KEY__PREFIX_Timing2Data = PREFIX2 +"JUDGMENT_";
	//定义计入次数缓存的key
	private static final String CACHE_KEY__PREFIX_Frequency2Data = PREFIX2 +"REPEATTIMES_";
	//定义报警缓存的key
	private static final String CACHE_KEY__PREFIX_Alarm2Data = PREFIX2 +"ALARM_";
	//定义接触计时缓存的key
	private static final String CACHE_KEY__PREFIX_Remove2Data = PREFIX2 +"REMOVE_TIME_";
	
    //redis有序集合
    @Resource(name="cacheRedisTemplate")
    private ZSetOperations<String, String> zSetOperations;
    //redis链表
    @Resource(name="cacheRedisTemplate")
    private ListOperations<String, String> listOpsTid2UpsData;
    /**
     * jiangc，12，05
     * 将终端编号插入缓存中,有序结合set
     * 
     */
    public void addBindData(Terminal terminal) {
        //zset内部是按分数来排序的，这里用当前时间做分数  
    	zSetOperations.add(CACHE_KEY__PREFIX_Bind2Data, 
    			terminal.getTerminalNum(), System.currentTimeMillis());  
    }
    /**
     * jiangc，12，05
     * 从缓存中获取终端编号
     * @return
     */
   // @SuppressWarnings("null")
	public List<String> getTerminalIds() {
    	Set<String> terminalIds=zSetOperations.reverseRange(CACHE_KEY__PREFIX_Bind2Data, 0, -1);
    	List<String> terminalId=new ArrayList<>();
    	for (String  id : terminalIds) {  
    		terminalId.add(id);
    	} 
    	return terminalId;
    }
	
	/**
	 * jiangc，12，05
	 * 根据终端编号，获取redis中对应终端号的第一条数据并解析
	 */
	public List<Map<String, Object>> getFirstData(String terminalId) {
		List<Map<String, Object>> maDatas = new ArrayList<Map<String, Object>>();
		
		String fields = null;
		try {
			fields = listOpsTid2UpsData.
					index(CACHE_KEY__PREFIX_TerminalId2CarData + terminalId, 0);
		} catch (Exception e) {
			log.error("缓存中不存在该终端实时数据"+e);
		}
		if(null==fields) {
    		return maDatas;
    	}
		//增加对终端的判断
		String[] terminalType=terminalId.split("-");
		String type=terminalType[0];
		switch (type) {
		case "TH1":
			Map<String, Object> tmp1 = TH1StateDataEcuParser.toMap(fields);
			maDatas.add(tmp1);

		default:
			Map<String, Object> tmp2 = CarStateDataEcuParser.toMap(fields);
			maDatas.add(tmp2);
		}
		
		return maDatas;
	}
	
	/**
	 * jiangc，12，06
	 * 获取四大缓存第一条数据
	 * @param key
	 * @return
	 */
    public  String getFirstCache(String key){
    	String fields =null;
    	if(null!=listOpsTid2UpsData) {
    		fields = listOpsTid2UpsData.index(key, 0);
    	}
    	return fields;
    }
	
    /**
     * jiangc，12，06
     * 获取取最后一条数据
     * @param key
     * @return
     */
    public String getLastCache(String key){
    	String fields =null;
    	if(listOpsTid2UpsData!=null) {
    		
    		fields = listOpsTid2UpsData.index(key,-1);
    	}
    	return fields;
    }
    
    /**
     * jiangc，12，06
     * 删除全部缓存
     */
    public void deleteAll(String key){
    	
    	long size = listOpsTid2UpsData.size(key);
    	for(int i = 0;i<size;i++){
    		listOpsTid2UpsData.rightPop(key);
    	}
    }
    /**
     * jiangc，12，06
     * 插入缓存
     * @param terminalId
     * @param param
     */
    public  void addCarData(String terminalId, String param) {
    	listOpsTid2UpsData.leftPush(terminalId, param);
    }
	public void removeCache(String terminalId) {
		//清除告警缓存
		deleteAll(CACHE_KEY__PREFIX_Alarm2Data+terminalId);
    	//清除计次缓存
    	deleteAll(CACHE_KEY__PREFIX_Frequency2Data+terminalId);
    	//清除计时缓存
    	deleteAll(CACHE_KEY__PREFIX_Timing2Data+terminalId);
    	//清除 解除告警计时缓存
    	deleteAll(CACHE_KEY__PREFIX_Remove2Data+terminalId);
		
	}
	
	
    
}
