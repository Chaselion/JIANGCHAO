package com.zy.dmop.app.controller;

import java.util.Map;

public interface AppRealtimeDataService {

	String queryById(Integer id);

	Map<String, Object> getCurrentCarData(String terminalId);

}
