package com.zy.dmop.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.app.controller.AppRealtimeDataService;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.web.information.more.realtime.GetDataFromRedis;

@Controller
@RequestMapping("/terminala")
public class AppRealtimeDataController {
	@Autowired
	private AppRealtimeDataService appRealtimeDataService;
	/**
	 * 根据返回的id去查终端表信息，然后根据终端号去redis的for-web里面匹配进行解析，然后返回
	 * @return List<Map<key,value>>
	 * @throws Exception
	 */
	@RequestMapping(value="/query",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryRedis(
			@RequestParam(value="id", required=false) Integer id) throws Exception {
		String terminalId=appRealtimeDataService.queryById(id);
		//System.out.println("terminalId=="+terminalId);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap=appRealtimeDataService.getCurrentCarData(terminalId);
		//System.out.println("returnMap=="+returnMap);
		List<Map<String, Object>> queryData=new ArrayList<Map<String,Object>>();
		queryData.add(returnMap);
		Map<String, Object> data = new HashMap<String, Object>();
	//	data.put("commonMessage", commonMsg);
		//data.put("users", paramList);
		return returnMap;
		
	}
}
