package com.zy.dmop.web.information.more;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.Terminal;
import com.zy.dmop.web.information.more.realtime.CurrentUpsDataParser;


/**
 * 数据缓存接口。
 * @author 
 *
 */
@Component("carDataCache")
public class CarDataCache {
	private static Logger log = Logger.getLogger(CarDataCache.class);
	
	private static final String PREFIX1 = "ZHYAN_DMOPDATA_";
	
	private static final String CACHE_KEY__PREFIX_TerminalId2CarData = PREFIX1 + "tid2data_";
	
	//定义通用的前缀key名
	private static final String PREFIX2 ="DMOP_ALARMDATA_";
	//定义终端绑定策略的key
	private static final String CACHE_KEY__PREFIX_Bind2Data = PREFIX2 +"BIND";
	
    @Autowired
    private ILorryCarService iLorryCarService;
	

	@Resource(name="cacheRedisTemplate")
    private ListOperations<String, String> listOpsTid2CarData;
	
	public Set<Integer> getAllId(){
		Set<Integer> allIds=new HashSet<Integer>();
		Long size=listOpsTid2CarData.size(CACHE_KEY__PREFIX_Bind2Data);
			List<String> ids=listOpsTid2CarData.range(CACHE_KEY__PREFIX_Bind2Data, 0, -1);
			for (int i = 0; i < ids.size(); i++) {
				int id=Integer.parseInt(ids.get(i));
				allIds.add(id);
			}
		
		
		return allIds;
	}
	
	public void addBindData(Terminal terminal) {
		Set<Integer> terminalIds=new HashSet<Integer>();
		terminalIds.add(terminal.getTerminalId());
		for(Integer id:terminalIds) {
			listOpsTid2CarData.leftPush(CACHE_KEY__PREFIX_Bind2Data, String.valueOf(id));
		}
	}
	
    public void addCarData(String terminalId, String carData) {
    	
    	listOpsTid2CarData.leftPush(CACHE_KEY__PREFIX_TerminalId2CarData + terminalId, carData);
    	
    	// 只保留600条数据，理想情况下是最近10分钟的数据
    	listOpsTid2CarData.trim(CACHE_KEY__PREFIX_TerminalId2CarData + terminalId, 0, 599);
    }
    
    /**
     * chao
     * 获取redis中对应终端号的第一条数据并解析
     */
    public List<Map<String, Object>> getFirstData(String terminalName) {
    	List<Map<String, Object>> maDatas = new ArrayList<Map<String, Object>>();
    	String fields = listOpsTid2CarData.
    			index(CACHE_KEY__PREFIX_TerminalId2CarData + terminalName, 0);
    	Map<String, Object> tmp = CarStateDataEcuParser.toMap(fields);
    	maDatas.add(tmp);
    	return maDatas;
    	
    }
    
    
    
    public List<Map<String, Object>> getAllCarData(long entityId) {
    	long begin = System.currentTimeMillis();
    	String str=iLorryCarService.findTerminalIdById(entityId);
    	List<String> datas = listOpsTid2CarData.range(CACHE_KEY__PREFIX_TerminalId2CarData + str, 0, 599);
    	
    	List<Map<String, Object>> mapDatas = new ArrayList<Map<String, Object>>();
    	for (int i = 0; i < datas.size(); i++) {
    		String fields = datas.get(i);
    		Map<String, Object> tmp = CarStateDataEcuParser.toMap(fields);
    		mapDatas.add(tmp);
		}
    	long end = System.currentTimeMillis();
    	
    	return mapDatas;
    }
  
    //获取所有得forweb里面得数据
    public List<Map<String, Object>> getAllForWebData() {
    	List<String> datas = getPerKey();
    	
    	List<Map<String, Object>> mapDatas = new ArrayList<Map<String, Object>>();
    	for (int i = 0; i < datas.size(); i++) {
    		String fields = datas.get(i);
    		Map<String, Object> tmp = CurrentUpsDataParser.toMap(fields);
    		mapDatas.add(tmp);
    	}
    	return mapDatas;
    }
    //取实时数据的key
    public List<String> getPerKey(){
    	List<String> datas=listOpsTid2CarData.range("ZHYAN_DMOPDATA_tid2data_FORWEB", 0, -1);
     return datas;
    }
    //删除对应得直
    public void delValue(String keyRedis, String terData) {
    	listOpsTid2CarData.remove(keyRedis, 1, terData);
    }
	public void addTerData(String keyRedis, String terData,String terminalId) {
		List<String> list=new ArrayList<String>();
		List<String> forData= getPerKey();
		List<Map<String,Object>> data=getAllForWebData();
		for (int i = 0; i < forData.size(); i++) {
			String forTerId=(String) data.get(i).get("terminalId");
			if(terminalId.equals(forTerId)){
				list.add(forData.get(i));
			}
		}
		delete(keyRedis, list);
		listOpsTid2CarData.leftPush(keyRedis, terData);
	}


    public void delete(String key,List<String>datas ){
    
    	for(int i=0;i<datas.size();i++){
    
    		listOpsTid2CarData.remove(key, 1,datas.get(i));
    	}
    }
    

	
}
