package com.zy.dmop.web.information.more.realtime;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.baidumap.ConvertCoord;
import com.zy.dmop.baidumap.GPS2BaiduCoordConvertor;
import com.zy.dmop.model.MapMarker;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.web.information.more.ILorryCarService;
@Component("getDataFromRedis")
public class GetDataFromRedisImpl implements GetDataFromRedis {
	@Autowired
	private ILorryCarService iLorryCarService;
	@Autowired
	private NewRedisListener newRedisListener;
	
	@Resource(name="terminalService")
	private TerminalService terminalService;
	@Autowired
	private GPS2BaiduCoordConvertor gps2BaiduCoordConvertor;
	
	@Override
	public Map<String, Object> getCurrentCarData(long terminalId) {
		
		String str=iLorryCarService.findTerminalIdById(terminalId);
	
		String fields=null;
        //遍历从redis中取出数据存放的set，讲ups号跟集合中的每一条的第一个值作比较
    	for (String str1 : newRedisListener.getRedisSetShip()) { 
    		
			String[] rs=str1.split(",");
			if(rs[0].equals(str)){
				fields = str1;
			}
		}
		return CurrentUpsDataParser.toMap(fields);
	}
	@Override
	public Map<String, List<MapMarker>> fetchCurrentDatas(Map<String, List<String>> type2Ids) {
		Map<String, List<MapMarker>> result = new HashMap<String, List<MapMarker>>();
		for (String type : type2Ids.keySet()) {
				List<MapMarker> markers = fetchCurrent(type2Ids.get(type));
				result.put(type, markers);
		}
		return result;
	}

	private List<MapMarker> fetchCurrent(List<String> entityIds) {
		List<MapMarker> markers = getCurrentMapMarkerFor(entityIds);
		convertGPS2BaiduCoord(markers);
		return markers;
	}
	
	
	private List<MapMarker> getCurrentMapMarkerFor(List<String> entityIds) {
		List<MapMarker> markers = new ArrayList<MapMarker>();
		for (String entityId : entityIds) {
			MapMarker marker = getCurrentMapMarkerFor(entityId);
			Terminal terminal = terminalService.findById(Integer.parseInt(entityId));
			marker.setStatus(Integer.parseInt(terminal.getIcon().toString()));
			markers.add(marker);
		}
		return markers;
	}

	private MapMarker getCurrentMapMarkerFor(String entityIdStr) {
		MapMarker marker = new MapMarker();
		marker.setId(entityIdStr);
		Integer entityId = Integer.parseInt(entityIdStr);
		
		Map<String, Object> carData = getCurrentCarData1(entityId);
		if (carData == null) {
			marker.setUnknown(true);
			return marker;
		}

		setMarkerAttributes(marker,entityId, carData);
		return marker;
	}
	private void setMarkerAttributes(MapMarker marker,long entityId, Map<String, Object> carData) {
		setMarkerName(marker, entityId);
		marker.setLongitude(Double.parseDouble(carData.get("longitude").toString()));
		marker.setLatitude(Double.parseDouble(carData.get("latitude").toString()));
		marker.setData(carData);
		//Terminal terminal = terminalService.findById(id);
		//marker.setStatus(Integer.parseInt(terminal.getIcon().toString()));
	}

	public Map<String, Object> getCurrentCarData1(Integer entityId) {
		//获取ups表中的id，查询ups号码
    	Terminal terminal=terminalService.findById(entityId);
    	//定义一个存放一条redis数据的字符串
    	String fields=null;
        //遍历从redis中取出数据存放的set，讲ups号跟集合中的每一条的第一个值作比较
    	for (String str1 : newRedisListener.getRedisSetShip()) {  
			String[] rs=str1.split(",");
			if(rs[0].equals(terminal.getTerminalNum())){
				fields = str1;
			}
		} 
    	return CurrentUpsDataParser.toMap(fields);
    }
	
	private void setMarkerName(MapMarker marker, Long entityId) {
		if (entityId == null) {
			marker.setName("未知");	
		} else {
			Terminal terminal = terminalService.findById(entityId.intValue());
			marker.setName(terminal.getTerminalName());	
		}
	}
	
	
	private void convertGPS2BaiduCoord(List<MapMarker> markers) {
		// GPS坐标转换为百度坐标
		List<ConvertCoord> coords = new ArrayList<ConvertCoord>();
		
		Map<String, MapMarker> toConvertMarkers = new HashMap<String, MapMarker>();
		for (MapMarker marker : markers) {
			if (marker.getLongitude() > 0 && marker.getLatitude() > 0) {
				toConvertMarkers.put(marker.getId(), marker);
				ConvertCoord cc = new ConvertCoord();
				cc.setKey(marker.getId());
				cc.setSrcLng(marker.getLongitude());
				cc.setSrcLat(marker.getLatitude());
				coords.add(cc);
			}
		}

		gps2BaiduCoordConvertor.convert(coords);

		for (int i = 0; i < coords.size(); i++) {
			ConvertCoord cc = coords.get(i);
			MapMarker marker = toConvertMarkers.get(cc.getKey());
			if (marker != null) {
				marker.setLongitude(cc.getConvertedLng());
				marker.setLatitude(cc.getConvertedLat());
			}
		}
	}
	@Override
	public  List<Map<String,Object>> catchTerminal(List<Terminal> terminal) {
		List<Map<String,Object>> allData=new ArrayList<Map<String,Object>>();
		Map<String,Object> realTimeData=new HashMap<String,Object>();
		String fields=null;
		for (int i = 0; i < terminal.size(); i++) {
			for (String str1 : newRedisListener.getRedisSetShip()) {  
				String[] rs=str1.split(",");
				if(rs[0].equals(terminal.get(i).getTerminalNum())){
					fields = str1;
					realTimeData=CurrentUpsDataParser.toMap(fields);
					allData.add(realTimeData);
				}
			} 
		}
		return allData;
	}
	
	
}
