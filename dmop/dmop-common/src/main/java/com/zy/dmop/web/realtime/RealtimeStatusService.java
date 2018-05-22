package com.zy.dmop.web.realtime;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.zy.dmop.model.StatusCounter;
import com.zy.dmop.model.User;



@Component("realtimeStatusService")
public class RealtimeStatusService {
	private Map<String, RealtimeStatusProvider> type2Provider;
	
	public void setType2Provider(Map<String, RealtimeStatusProvider> type2Provider) {
		this.type2Provider = type2Provider;
	}
	
	public Map<String, List<StatusCounter>> fetchCurrentStatus(User loginUser, Map<String, Set<Integer>> type2StatusCodes) {
		Map<String, List<StatusCounter>> result = new HashMap<String, List<StatusCounter>>();
		
		for (String type : type2StatusCodes.keySet()) {
			RealtimeStatusProvider provider = type2Provider.get(type);
			if (provider != null) {
				//[0, 100001, 1, 2, 100003]
				//[0, 1, 2]
				List<StatusCounter> statusCounters = provider.fetchCurrent(loginUser, type2StatusCodes.get(type));
				result.put(type, statusCounters);
			}
		}
		
		return result;
	}
}
