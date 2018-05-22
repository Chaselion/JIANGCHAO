package com.zy.dmop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.service.CustomService;
import com.zy.dmop.api.web.service.HistoryDataService;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.HistoryDataVO;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.StringUtil;


@Controller
@RequestMapping("/historyDataLog")
public class HistoryDataController {
	private static Logger log = Logger.getLogger(HistoryDataController.class);
	
	@Autowired
	private HistoryDataService historyDataService;
	
	@RequestMapping(value = "/pageQueryHistoryDataVO", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> pageQueryHistoryDataVO( 
			@RequestParam(value="terminalName", required=false) String terminalName,
			@RequestParam(value = "start", required = false) Integer start, 
			@RequestParam(value = "countPerPage", required = false)  Integer countPerPage){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnMap.put("commonMessage", commonMsg);
		
		User loginUser = SessionUtil.getCommonUserFromSession();
		Integer organizationId = loginUser.getOrganizationId();	
		terminalName = StringUtil.convertNullToEmpty(terminalName);
		start = start == null ? 0 : start;
		countPerPage = countPerPage == null ? 10 : countPerPage;
		
		Page page = new Page();
		page.setLimit(countPerPage);
		page.setStart(start);
		
		try {
			PageResult<HistoryDataVO> pageResult = historyDataService.pageQueryHistoryDataVO(terminalName,page,organizationId);		
			List<HistoryDataVO> data = pageResult.getData();
			
			commonMsg.setSuccess(true);
			returnMap.put("historyDatas", data);
			returnMap.put("page", pageResult.getPage());
		} catch (ErrorMessageException e) {
			log.error(e.getMessage(), e);
			
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(e.getErrorMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("查询失败!");
		}
		return returnMap;
		
	}
	
	
	@RequestMapping(value = "/delHistoryDataId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delHistoryDataId(@RequestParam("id") Long id){
		log.info("request delHistoryDataId=" + id);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
			this.historyDataService.deleteHistoryData(id);
		return returnedData;
	}
	
	@RequestMapping(value = "/getHistoryDatas", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getHistoryDatas(){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
			this.historyDataService.getHistoryDatas();
		return returnedData;
	}

}

