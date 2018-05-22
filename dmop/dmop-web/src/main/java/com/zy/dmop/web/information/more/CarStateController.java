package com.zy.dmop.web.information.more;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.UpsInfo;
import com.zy.dmop.model.User;
import com.zy.dmop.util.CommonMessage;


@Controller
@RequestMapping("/carState")
public class CarStateController {
	private static Logger log = Logger.getLogger(CarStateController.class);
	
	@Autowired
	private CarDataCache carDataCache;
	@Autowired
	private TerminalService terminalService;
	
	@RequestMapping(value = "/queryHistoryCarState", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> HistoryCarState(/*@RequestParam("entityId") long entityId, @RequestParam("interval") int interval*/) throws Exception {
//		log.info(entityId);
		long begin = System.currentTimeMillis();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		User loginUser = SessionUtil.getCommonUserFromSession();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		long entityId=2;
		int interval=600;
		
		List<Map<String, Object>> historyCarState = carDataCache.getAllCarData(entityId);
		returnMap.put("historyCarState", historyCarState);
		long end = System.currentTimeMillis();

		return returnMap;
	}
	
	

	//查询厂商等信息,以及系数
	@RequestMapping(value = "/getInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> upsInfo(
			@RequestParam("terminalId") String terminalId) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		User loginUser = SessionUtil.getCommonUserFromSession();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		List<HistoryData> upsInfo = terminalService.getUpsInfo(terminalId);
		returnMap.put("ups", upsInfo);
		return returnMap;
		}
	//插入厂商信息以及系数
	@RequestMapping(value = "/addInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertUpsInfo(
			HttpServletRequest request,
			HttpServletResponse response,UpsInfo upsInfo) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		
		Boolean isHave=terminalService.isTerminalTrue(upsInfo.getTerminalId());
		try {
		if(false==isHave) {
			terminalService.addInfo(upsInfo);
		}else {
			terminalService.updateInfo(upsInfo);
		}
			
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("指定的用户不存在");
		}
		commonMsg.setSuccess(true);
		returnMap.put("commonMessage", commonMsg);
		return null;
	}
	//插入厂商信息以及系数
	@RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateInfo(
			HttpServletRequest request,
			HttpServletResponse response,UpsInfo upsInfo) throws Exception {
		System.out.println("更新ups数据：" + upsInfo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		try {
			terminalService.updateInfo(upsInfo);
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("指定的用户不存在");
		}
		commonMsg.setSuccess(true);
		returnMap.put("commonMessage", commonMsg);
		return null;
	}
	
	
	
	@RequestMapping(value = "/queryAllCurrCarState", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> allCurrCarState(@RequestParam("entityId") long entityId) throws Exception {
		long begin = System.currentTimeMillis();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		User loginUser = SessionUtil.getCommonUserFromSession();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		List<Map<String, Object>> allCurrCarState = carDataCache.getAllCarData(entityId);
		List<Map<String, Object>> allCurrCarStateFiltered = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < allCurrCarState.size(); i++) {
			allCurrCarStateFiltered.add(allCurrCarState.get(i));
		}
		returnMap.put("allCurrCarState", allCurrCarStateFiltered);

		return returnMap;
	}
	
	@RequestMapping(value = "/queryCurrCarStateByLogTime", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> CurrCarState(@RequestParam("entityId") long entityId, @RequestParam("logTime") String logTime) throws Exception {
		long begin = System.currentTimeMillis();

		Map<String, Object> returnMap = new HashMap<String, Object>();

		long reqLogtime = -1L;
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			reqLogtime = format.parse(logTime).getTime();
		} catch (Exception e) {
			log.warn("invalid logtime=" + logTime);
		}

		if (reqLogtime < 0) {
			return returnMap;
		}

		Map<String, Object> carState = new HashMap<String, Object>();
		List<Map<String, Object>> allCurrCarState = carDataCache.getAllCarData(entityId);
		for (int i = 0; i < allCurrCarState.size(); i++) {
			long cacheLogtime = (Long) allCurrCarState.get(i).get("logTimeLong");
			if (cacheLogtime == reqLogtime) {
				carState = allCurrCarState.get(i);
				break;
			}
		}

		returnMap.put("CarState", carState);

		long end = System.currentTimeMillis();

		return returnMap;
	}
	
}
