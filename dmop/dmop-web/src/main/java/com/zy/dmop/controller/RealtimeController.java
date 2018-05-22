package com.zy.dmop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.model.MapMarker;
import com.zy.dmop.model.StatusCounter;
import com.zy.dmop.model.User;
import com.zy.dmop.web.information.more.realtime.GetDataFromRedis;
import com.zy.dmop.web.realtime.RealtimeFacade;

@Controller
@RequestMapping("/realtime")
public class RealtimeController {
	

	@Autowired
	private GetDataFromRedis getDataFromRedis;

	@RequestMapping(value="/markers",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryList() throws Exception {
		
		long terminalId=2l;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap=getDataFromRedis.getCurrentCarData(terminalId);
		return returnMap;
	}

	@RequestMapping(value="/refreshMapMarkers",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryList(@RequestBody Map<String, Object> params) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, List<String>> typeToIds = extractType2Ids((Map<String, Object>) params.get("realtime_data"));
		Map<String, List<MapMarker>> typeToRealtimeData = getDataFromRedis.fetchCurrentDatas(typeToIds);
		//获取状态计数
		Map<String, Object> returnMap = new HashMap<String, Object>();
	
		returnMap.put("realtime_data", typeToRealtimeData);
		//returnMap.put("status_count", null);
		return returnMap;
	}
	
	private Map<String, List<String>> extractType2Ids(Map<String, Object> realtimeDataParams) {
		Map<String, List<String>> typeToIds = new HashMap<String, List<String>>();
		for (String type : realtimeDataParams.keySet()) {
			List<Object> idsObj = (List<Object>) realtimeDataParams.get(type);
			List<String> ids = new ArrayList<String>();
			for (Object obj : idsObj) {
				ids.add(obj.toString());
			}
			
			typeToIds.put(type, ids);
		}
		return typeToIds;
	}
	

	
}
