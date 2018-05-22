package com.zy.dmop.web.realtime;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.zy.dmop.model.MapMarker;
import com.zy.dmop.model.StatusCounter;
import com.zy.dmop.model.User;
import com.zy.dmop.util.NumberUtil;

public class RealtimeFacade {
	private RealtimeDataService realtimeDataService;
	private RealtimeStatusService realtimeStatusService;
	
	private Map<String, Set<Integer>> type2StatusCodes;
	
	public Map<String, List<MapMarker>> fetchCurrentDatas(Map<String, List<String>> type2Ids) {
		return this.realtimeDataService.fetchCurrentDatas(type2Ids, type2StatusCodes);
	}
	
	public Map<String, List<StatusCounter>> fetchCurrentStatus(User loginUser) {
		return this.realtimeStatusService.fetchCurrentStatus(loginUser, type2StatusCodes);
	}
	
	public void setRealtimeDataService(RealtimeDataService realtimeDataService) {
		this.realtimeDataService = realtimeDataService;
	}
	
	public void setRealtimeStatusService(RealtimeStatusService realtimeStatusService) {
		this.realtimeStatusService = realtimeStatusService;
	}
	
	public void setType2StatusCodes(Map<String, String> type2StatusCodeString) {
		this.type2StatusCodes = new HashMap<String, Set<Integer>>();
		
		for (String type : type2StatusCodeString.keySet()) {
			String statusCodeString = type2StatusCodeString.get(type);
			type2StatusCodes.put(type, NumberUtil.toIntegers(statusCodeString));
		}
	}
}
