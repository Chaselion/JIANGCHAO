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

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.model.SimCardOperator;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.service.SimCardOperatorService;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.DatatablePage;


@Controller
@RequestMapping("/simCardOperator")
public class SimCardOperatorController {
	private static Logger log = Logger.getLogger(SimCardOperatorController.class);
	
	@Autowired
	private SimCardOperatorService simCardOperatorService;

	@RequestMapping(value = "/insertsimCardOperator", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertSimCardOperator(SimCardOperator simCardOperator){
		log.info("request insertsimCardOperator=" + simCardOperator);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		loginUser.setCustomId(2);
		try{
			simCardOperator.setCustomId(loginUser.getCustomId());
			this.simCardOperatorService.insertSimCardOperator(simCardOperator);
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("新增运营商信息失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;
	}
	
	@RequestMapping(value = "/updatesimCardOperator", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateSimCardOperator(SimCardOperator simCardOperator){
		log.info("request updatesimCardOperator=" + simCardOperator);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		loginUser.setCustomId(2);
		try{
			simCardOperator.setCustomId(loginUser.getCustomId());
			this.simCardOperatorService.updateSimCardOperator(simCardOperator);
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("修改运营商信息失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;
	}
	
	@RequestMapping(value = "/getsimCardOperatorById", method = RequestMethod.POST)
	@ResponseBody
	public SimCardOperator getSimCardOperatorById(@RequestParam(value = "id", required = true) Long id){
		User loginUser = SessionUtil.getCommonUserFromSession();
		loginUser.setCustomId(2);
	/*	if (loginUser.getUserType() != UserType.TENANT) {
			return null;
		}*/
		return this.simCardOperatorService.getSimCardOperatorById(id, loginUser.getCustomId());
	}
	
	@RequestMapping(value = "/getsimCardOperatorPage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getsimCardOperatorPage( 
			@RequestParam(value = "operatorName", required = false) String operatorName, 
			@RequestParam(value = "start", required = false) Integer start, 
			@RequestParam(value = "countPerPage", required = false)  Integer countPerPage){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			return new HashMap<String, Object>();
		}*/
		loginUser.setCustomId(2);
		DatatablePage<SimCardOperator> resultPage = this.simCardOperatorService.getSimCardOperatorPage(operatorName, loginUser.getCustomId(), start, countPerPage);
		returnedData.put("dtPage", resultPage);
		returnedData.put("simCardOperators", resultPage.getData());
		return returnedData;
	}
	
	@RequestMapping(value = "/getsimCardOperatorList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getsimCardOperatorList(){
		User loginUser = new User();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			return new HashMap<String, Object>();
		}*/
		loginUser.setCustomId(2);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		List<SimCardOperator> simCardOperators = this.simCardOperatorService.getSimCardOperatorList(loginUser.getCustomId());
		returnedData.put("simCardOperators", simCardOperators);
		return returnedData;
	}
	
	@RequestMapping(value = "/delSimCardOperatorsByIds", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delSimCardOperatorsById(@RequestParam("deleteIds") List<Long> ids){
		log.info("request delsimCardOperatorsByIds=" + ids);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		loginUser.setCustomId(2);
		try {
			this.simCardOperatorService.delSimCardOperatorsById(ids,loginUser.getCustomId());
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("从列表中删除运营商失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;
	}
	
	@RequestMapping(value = "/delSimCardOperatorById", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delSimCardOperatorById(@RequestParam("id") Long id){
		log.info("request delsimCardOperatorById=" + id);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		loginUser.setCustomId(2);
		try {
			this.simCardOperatorService.delSimCardOperatorById(id,loginUser.getCustomId());
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("从列表中删除运营商失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;
	}
	
	@RequestMapping(value = "/checkOperatorUsed", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkOperatorUsed(@RequestParam("id") Long id){	
		User loginUser = SessionUtil.getCommonUserFromSession();
		return this.simCardOperatorService.getSimCardOperatorRelativeById(id, loginUser.getCustomId());
	}
}
