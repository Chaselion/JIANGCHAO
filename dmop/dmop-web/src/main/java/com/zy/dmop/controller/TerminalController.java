package com.zy.dmop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.CustomService;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.api.web.service.OrganizationService;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.OrganizationView;
import com.zy.dmop.model.vo.TerminalStrategyVo;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.web.alarm.core.EngineDataCache;
import com.zy.dmop.web.information.more.CarDataCache;


@Controller
@RequestMapping("/terminal")
public class TerminalController {
	private static Logger log = Logger.getLogger(TerminalController.class);
	//定义通用的前缀key名
	//定义通用的前缀key名
	//public static final String KEY_terminalID = "terminalId";
	public static final String KEY_parameterA = "0";
	public static final String KEY_parameterB = "0";
	public static final String KEY_parameterC = "0";
	//public static final String KEY_logtime = "logtime";
	//public static final String KEY_longitude = "longitude";//经度
	//public static final String KEY_latitude = "latitude";//纬度
	public static final String KEY_REDIS = "ZHYAN_DMOPDATA_tid2data_FORWEB";
	//定义一个操作日志的所属界面字符串
	public static final String PAGE = "终端";
	@Autowired
	private OrganizationService organizationService;
	@Autowired
	private CarDataCache carDataCache;
	@Autowired
	private EngineDataCache engineDataCache;
	@Autowired
	private OperateLogService operateLogService;
	@Autowired
	private CustomService customService;
	@Resource(name="terminalService")
	private TerminalService terminalService;
	
	//sim界面加载终端所需分页查询
	@RequestMapping(value = "/getTerminalPage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTerminalPage( 
			@RequestParam(value = "terminalNum", required = false) String terminalNum, 
			@RequestParam(value = "terminalModelId", required = false) Integer terminalModelId, 
			@RequestParam(value = "start", required = false) Integer start, 
			@RequestParam(value = "countPerPage", required = false) Integer countPerPage){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		PageResult<Terminal> resultPage=terminalService.getTerminalPage(terminalNum, terminalModelId, page,organizationId);
		
		returnedData.put("terminal", resultPage.getData());
		returnedData.put("page", resultPage.getPage());
		return returnedData;
	}
	@RequiresPermissions(value="System.TenantMgmt.Tenant.show")
	@RequestMapping(value = "/query", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> query(
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "countPerPage", required = false) Integer countPerPage,
			@RequestParam(value = "terminalNum", required = false) String terminalNum)
			throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		String location = customService.getCustomLocation(loginUser.getCustomId());
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		PageResult<TerminalStrategyVo> pageResult = terminalService.findByPageAndId(terminalNum,page,organizationId);
		commonMsg.setSuccess(true);
		returnMap.put("terminal", pageResult.getData());
		returnMap.put("page", pageResult.getPage());
		returnMap.put("location", location);
		return returnMap;
	}
	
	@RequiresPermissions(value="System.TenantMgmt.Tenant.add")
	@RequestMapping(value = "/add")
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request,
			HttpServletResponse response,Terminal terminal) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		
		int orgId=loginUser.getOrganizationId();
		//terminal.setOrganizationId(orgId);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		try {
			boolean success = terminalService.add(terminal);
			if(success)
				commonMsg.setSuccess(true);
		} catch (Exception e) {
			commonMsg.setErrorMessage("添加失败");
			e.printStackTrace();	
		}
		String terminalId=terminal.getTerminalNum();
		User user=new User();
		user.setUserId(loginUser.getUserId());
		user.setOrganizationId(loginUser.getOrganizationId());
		String content=terminal.getTerminalNum()+" "+PAGE;
		operateLogService.addInsert(user, content);
		//往forweb里面插入值
		long time=System.currentTimeMillis();
		String logtime=String.valueOf(time);
		String longitude=String.valueOf(terminal.getLongitude());
		String latitude=String.valueOf(terminal.getLatitude());
		String terData=terminalId+","+KEY_parameterA+","+KEY_parameterB
				+","+KEY_parameterC+","+logtime+","+longitude+","+latitude;
		try {
			carDataCache.addTerData(KEY_REDIS, terData,terminalId);
			engineDataCache.addBindData(terminal);
		} catch (Exception e) {
			log.error("redis连接出错"+e);
		}
		return returnMap;
	}

	@RequiresPermissions(value="System.TenantMgmt.Tenant.update")
	@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request,HttpServletResponse response,Terminal terminal) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		User loginUser = SessionUtil.getCommonUserFromSession();
		try {
			boolean success = terminalService.modifyById(terminal);
			if(success)
				commonMsg.setSuccess(true);
		} catch (Exception e) {
			commonMsg.setErrorMessage("修改失败");
			e.printStackTrace();
		}
		User user=new User();
		user.setUserId(loginUser.getUserId());
		user.setOrganizationId(loginUser.getOrganizationId());
		String content=terminal.getTerminalNum()+" "+PAGE;
		operateLogService.addUpdate(user, content);
			String terminalId=terminal.getTerminalNum();
			long time=System.currentTimeMillis();
			String logtime=String.valueOf(time);
			String longitude=String.valueOf(terminal.getLongitude());
			String latitude=String.valueOf(terminal.getLatitude());
		String terData=terminalId+","+KEY_parameterA+","+KEY_parameterB
				+","+KEY_parameterC+","+logtime+","+longitude+","+latitude;
		try {
			carDataCache.addTerData(KEY_REDIS, terData,terminalId);
			engineDataCache.addBindData(terminal);
		} catch (Exception e) {
			log.error("redis连接出错"+e);
		}
		return returnMap;
	}
	
	@RequiresPermissions(value="System.TenantMgmt.Tenant.delete")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public CommonMessage delete(@RequestParam("terminalNum") String terminalNum) throws Exception {
		CommonMessage commonMsg = new CommonMessage();
		User loginUser = SessionUtil.getCommonUserFromSession();
		Terminal terminal = new Terminal();
		terminal.setTerminalNum(terminalNum);
		try {
			boolean flag = terminalService.removeUpsById(terminal);
			//boolean flag = terminalService.removeById(terminal);
			if (flag) {
				commonMsg.setSuccess(true);
			} else {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage("删除失败!");
			}
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("删除操作失败!");
			log.error(e.getMessage(), e);
		}
		User user=new User();
		user.setUserId(loginUser.getUserId());
		user.setOrganizationId(loginUser.getOrganizationId());
		String content=terminal.getTerminalNum()+" "+PAGE;
		operateLogService.addDelete(user, content);
		return commonMsg;
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAllTerminal(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		commonMsg.setSuccess(true);
	
		List<Terminal> list = terminalService.findAll(organizationId);
		returnMap.put("commonMsg", commonMsg);
		returnMap.put("terminal", list);
		return returnMap;
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTerminal(@RequestParam("id") String id)
			throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		Terminal terminal = terminalService.findById(Integer.parseInt(id));
		Organization org = organizationService.getOrganizationById(terminal.getOrganizationId());
		if (null == terminal) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("对象不存在");
		} else {
			commonMsg.setSuccess(true);
			returnMap.put("terminal", terminal);
			returnMap.put("organization", org);
		}
		return returnMap;
	}
	@RequestMapping(value="/queryDeviceClass",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryDeviceClass() throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		List<DeviceClass> list = terminalService.getDeviceClass();
		if (list != null) {
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("成功获取设备类别");
			returnMap.put("deviceClass", list);
		}else {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("获取设备类别失败");
		}
		
		return returnMap;
	}
	
//  通过终端id查询id的方法
	@RequestMapping(value = "/getIfExist", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTerminalId(@RequestParam("terminal_num") String terminalNum,
			@RequestParam("id") Integer id)
			throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		Integer sid = terminalService.findByTerminalId(terminalNum);
		if(null!=id){
			Terminal terminal=terminalService.findById(id);			
			if (1 == sid &&!terminal.getTerminalNum().equals(terminalNum)) {
				commonMsg.setSuccess(true);
				returnMap.put("terminal", id);
			} else {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage("对象不存在");
			}
		}else{
			if (1 == sid) {
				commonMsg.setSuccess(true);
				returnMap.put("terminal", id);
			} else {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage("对象不存在");
		}
	}
		return returnMap;
	}
	
	
	
	@RequestMapping(value = "/getName", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> alarmcompare(
			@RequestParam("terminalId") String terminalId) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		String terminalName;
		try {
			terminalName = terminalService.getNamefromId(terminalId);
			commonMsg.setSuccess(true);
			returnMap.put("terminalName", terminalName);
		} catch (Exception e) {
			commonMsg.setErrorMessage("查询出错");
		}
		returnMap.put("commonMessage", commonMsg);
		return returnMap;

	}
	
	@RequestMapping(value = "/mquery", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mquery(
			@RequestParam(value = "terminalNum", required = false) String terminalNum)
			throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		String location = customService.getCustomLocation(loginUser.getCustomId());

		List<TerminalStrategyVo> result = terminalService.findTerminalMobile(terminalNum, organizationId);
		commonMsg.setSuccess(true);
		returnMap.put("terminal", result);
		returnMap.put("location", location);
		return returnMap;
	}
	
}
