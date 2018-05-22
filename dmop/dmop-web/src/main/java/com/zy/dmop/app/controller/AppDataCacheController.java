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

import com.zy.dmop.api.alarm.service.AlarmLogService;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.controller.DelayChangeRemind;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.User;
import com.zy.dmop.web.alarm.core.AppDataCacheService;
import com.zy.dmop.web.information.more.CarDataCache;

@Controller
@RequestMapping("/appData")
public class AppDataCacheController {
	@Autowired
	private AppDataCacheService appDataCacheService;
	@Autowired
	private OrganizationDao organizationDao;
	@Autowired
	private CarDataCache carDataCache;
	@Autowired
	private DelayChangeRemind delayChangeRemind;
	@Autowired
	private AlarmLogService alarmService;
	
	private static final String PREFIX= "ZHYAN_DMOPDATA_";
	private static final String CACHE_KEY__PREFIX_App2Data=PREFIX+ "app2data_FORALARM";
	/**
	 * 根据返回的id去查终端表信息，然后根据终端号去redis的for-web里面匹配进行解析，然后返回
	 * @return List<Map<key,value>>
	 * @throws Exception
	 */
	@RequestMapping(value="/query",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryRedis(@RequestParam(value = "id", required = true) Integer id) throws Exception {
		int o=id;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, id);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, Object>> getAppData=appDataCacheService.getFirstData();
		List<Map<String, Object>> getAppData2=new ArrayList<Map<String,Object>>();
		getAppData2.clear();
		for(int i=0;i<getAppData.size();i++){
			Object organizationId= getAppData.get(i).get("organizationId");
			String ss=(String) organizationId;
			Integer orgg=Integer.parseInt(ss);
			if(aorgIds.contains(orgg)){

				getAppData2.add(getAppData.get(i));

			};
		}
		aorgIds.clear();
		returnMap.put("appData", getAppData2);
		System.out.println("returnMap=="+getAppData2.size());
		return returnMap;
	}
	
	@RequestMapping(value="/remind",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> changeRemind(
			@RequestParam(value = "terminalId", required = false)String terminalId,
			@RequestParam(value = "organizationId", required = false)String organizationId,
			@RequestParam(value = "property", required = false)String property,
			@RequestParam(value = "value", required = false)String value
			)throws Exception{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<String> list=new ArrayList<String>();
		//以字符串数组形势返回key中所有的数据
		List<String> forData= appDataCacheService.getAllAppCache();
		//以map数组形势返回key中所有的解析后的数据
		List<Map<String, Object>> getAppData=appDataCacheService.getFirstData();
		//遍历缓存中符合条件的那条数据
		for (int i = 0; i < forData.size(); i++) {
			String redisTerminalId=(String) getAppData.get(i).get("terminalId");
			String redisOrgId=(String) getAppData.get(i).get("organizationId");
			String redisProperty=(String) getAppData.get(i).get("property");
			String redisValue=(String) getAppData.get(i).get("value");
			if(terminalId.equals(redisTerminalId)&&organizationId.equals(redisOrgId)
					&&property.equals(redisProperty)&&value.equals(redisValue)) {
				list.add(forData.get(i));
			}
		}
		carDataCache.delete(CACHE_KEY__PREFIX_App2Data, list);
		//appDataCacheService.addChangeRimindCache(CACHE_KEY__PREFIX_App2Data,
				//organizationId,terminalId,property,value,"1");
		List<Map<String, Object>> appData=appDataCacheService.getFirstData();
		returnMap.put("appData", appData);
		//如果报警已经解决的话就不加如新的，如果为解决则要加入新的
		Double valueSS=Double.parseDouble(value);
		try {
			boolean relieve=alarmService.judgeRelieveByterminalId(terminalId,valueSS);
			if(relieve==false){
				delayChangeRemind.changeRemind(CACHE_KEY__PREFIX_App2Data,
						organizationId,terminalId,property,value,"0");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return returnMap;
	}

	@RequestMapping(value="/confirm",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> changeConfirm(
			@RequestParam(value = "terminalId", required = false)String terminalId,
			@RequestParam(value = "organizationId", required = false)String organizationId,
			@RequestParam(value = "property", required = false)String property,
			@RequestParam(value = "value", required = false)String value
			)throws Exception{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<String> list=new ArrayList<String>();
		//以字符串数组形势返回key中所有的数据
		List<String> forData= appDataCacheService.getAllAppCache();
		//以map数组形势返回key中所有的解析后的数据
		List<Map<String, Object>> getAppData=appDataCacheService.getFirstData();
		//遍历缓存中符合条件的那条数据
		for (int i = 0; i < forData.size(); i++) {
			String redisTerminalId=(String) getAppData.get(i).get("terminalId");
			String redisOrgId=(String) getAppData.get(i).get("organizationId");
			String redisProperty=(String) getAppData.get(i).get("property");
			String redisValue=(String) getAppData.get(i).get("value");
			if(terminalId.equals(redisTerminalId)&&organizationId.equals(redisOrgId)
					&&property.equals(redisProperty)&&value.equals(redisValue)) {
				list.add(forData.get(i));
			}
		}
		carDataCache.delete(CACHE_KEY__PREFIX_App2Data, list);
		List<Map<String, Object>> appData=appDataCacheService.getFirstData();
		returnMap.put("appData", appData);
		User loginUser = SessionUtil.getCommonUserFromSession();
		Double valueSS=Double.parseDouble(value);
		try {
			alarmService.updateConfirm(terminalId, valueSS, loginUser.getUsername());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnMap;
	}

}
