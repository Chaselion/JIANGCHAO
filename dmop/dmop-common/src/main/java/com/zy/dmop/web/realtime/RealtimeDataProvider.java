package com.zy.dmop.web.realtime;

import java.util.List;
import java.util.Set;

import com.zy.dmop.model.MapMarker;

public interface RealtimeDataProvider {
	List<MapMarker> fetchCurrent(List<String> ids, Set<Integer> statusCodes);
}
