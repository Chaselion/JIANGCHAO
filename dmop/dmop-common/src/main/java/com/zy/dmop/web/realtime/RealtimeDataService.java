package com.zy.dmop.web.realtime;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.zy.dmop.model.MapMarker;

public class RealtimeDataService {
	private Map<String, RealtimeDataProvider> type2Provider;
	
	public void setType2Provider(Map<String, RealtimeDataProvider> type2Provider) {
		this.type2Provider = type2Provider;
	}
	
	public Map<String, List<MapMarker>> fetchCurrentDatas(Map<String, List<String>> type2Ids, Map<String, Set<Integer>> type2StatusCodes) {
		Map<String, List<MapMarker>> result = new HashMap<String, List<MapMarker>>();
		for (String type : type2Ids.keySet()) {
			RealtimeDataProvider provider = type2Provider.get(type);
			if (provider != null) {
				List<MapMarker> markers = provider.fetchCurrent(type2Ids.get(type), type2StatusCodes.get(type));
				result.put(type, markers);
			}
		}
		return result;
	}
}
