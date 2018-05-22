package com.zy.dmop.technology.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.dao.TerminalDao;
import com.zy.dmop.model.MapMarker;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;
import com.zy.dmop.technology.service.TechnologyService;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.web.information.more.realtime.GetDataFromRedis;

@Controller
@RequestMapping("/technology")
public class TechnologyController {
	@Autowired
	private TechnologyService technologyService;
	@Autowired
	private GetDataFromRedis getDataFromRedis;
	@Autowired
	private OrganizationDao organizationDao;
	@Autowired
	private TerminalDao terminalDao;
	@RequestMapping(value = "/throughput", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getThroughput() throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		//获取登陆着的组织id
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();
		HashSet<Map<String, Object>> throughput = technologyService.getDailyNumToday(organizationId);
		commonMsg.setSuccess(true);
		returnMap.put("throughput", throughput);
		return returnMap;
	}
	
	@RequestMapping(value="/mapMarkers",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryList(@RequestParam("id") int id) throws Exception {
		//查询所有得组织id
		int o=id;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, id);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		//根据id查询终端号
		List<Terminal> terminals=new ArrayList<Terminal>();
		terminals.clear();
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
		}
		//查询组织id的所有终端
		terminals=terminalDao.listAll(aorgIds);
		orgs.clear();
		//根据终端号去匹配缓存中得数据
		List<Map<String,Object>> realtimeData=getDataFromRedis.catchTerminal(terminals);
		
		//获取状态计数
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("realtimeData", realtimeData);
		return returnMap;
	}
}
