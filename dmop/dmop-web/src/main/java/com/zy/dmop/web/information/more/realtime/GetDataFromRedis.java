package com.zy.dmop.web.information.more.realtime;

import java.util.List;
import java.util.Map;

import com.zy.dmop.model.MapMarker;
import com.zy.dmop.model.Terminal;

public interface GetDataFromRedis {
	public Map<String, Object> getCurrentCarData(long terminalId);

	public Map<String, List<MapMarker>> fetchCurrentDatas(Map<String, List<String>> typeToIds);

	public List<Map<String,Object>> catchTerminal(List<Terminal> terminals);
}
