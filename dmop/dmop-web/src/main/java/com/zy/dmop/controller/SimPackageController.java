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
import com.zy.dmop.model.SimArreaStatusConst;
import com.zy.dmop.model.SimCard;
import com.zy.dmop.model.SimPackage;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.service.SimCardService;
import com.zy.dmop.resource.service.SimPackageService;
import com.zy.dmop.util.CommonMessage;
import com.zy.dmop.util.DatatablePage;

@Controller
@RequestMapping("/simPackage")
public class SimPackageController {
	private static Logger log = Logger.getLogger(SimPackageController.class);
	
	@Autowired
	private SimPackageService simPackageService;
	
	@Autowired
	private SimCardService simCardService;

	@RequestMapping(value = "/insertSimPackage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertSimPackage(SimPackage simPackage){
		log.info("request insertSimPackage=" + simPackage);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		try{
			simPackage.setCustomId(loginUser.getCustomId());
			this.simPackageService.insertSimPackage(simPackage);
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("新增套餐信息失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;		
	}
	
	@RequestMapping(value = "/updateSimPackage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateSimPackage(SimPackage simPackage){
		log.info("request updateSimPackage=" + simPackage);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		try{
			simPackage.setCustomId(loginUser.getCustomId());
			this.simPackageService.updateSimPackage(simPackage);
			List<SimCard> cards=this.simCardService.getSimCardIdsListByPackage(simPackage.getSimPackageId(), loginUser.getCustomId());
			for(int i = 0 ; i < cards.size() ; i++ ){
				SimCard card = cards.get(i);
				Float balance = card.getBalance();
				Float check = balance - simPackage.getPrice();
				Integer arrearsState = 0;
				if(check >= 0){//余额大于套餐费用
					arrearsState = SimArreaStatusConst.SUFFICENT_BALANCE;
				}
				if(check < 0){//余额小于套餐费用
					arrearsState = SimArreaStatusConst.NOT_SUFFICENT_BALANCE;
				}
				if(balance < 0){//余额小于0
					arrearsState = SimArreaStatusConst.ARREARAGE_BALANCE;
				}
				this.simCardService.changeArrearState(card.getSimCardId(), arrearsState, loginUser.getCustomId());
			}
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("修改套餐信息失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;

	}
	
	@RequestMapping(value = "/getSimPackageId", method = RequestMethod.POST)
	@ResponseBody
	public SimPackage getSimPackageId(@RequestParam(value = "id", required = true) Long id){
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			return null;
		}*/
		return this.simPackageService.getSimPackageById(id,loginUser.getCustomId());
	}
	
	@RequestMapping(value = "/getSimPackagePage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getSimPackagePage( 
			@RequestParam(value = "packageName", required = false) String packageName, 
			@RequestParam(value = "operatorsType", required = false) Long operatorsType, 
			@RequestParam(value = "packageGroupType", required = false) Integer packageGroupType, 
			@RequestParam(value = "start", required = false) Integer start, 
			@RequestParam(value = "countPerPage", required = false) Integer countPerPage){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		User loginUser = new User();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			return new HashMap<String, Object>();
		}*/
		loginUser.setCustomId(2);
		DatatablePage<SimPackage> resultPage=this.simPackageService.getSimPackagePage(packageName, operatorsType, packageGroupType, loginUser.getCustomId(), start, countPerPage);
		returnedData.put("dtPage", resultPage);
		returnedData.put("simPackages", resultPage.getData());
		return returnedData;
	}
	
	@RequestMapping(value = "/delSimPackagesByIds", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delSimPackagesById(@RequestParam("deleteIds") List<Long> ids){
		log.info("request delSimPackagesById=" + ids);
		Map<String, Object> returnedData = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		try {
			this.simPackageService.delSimPackagesById(ids,loginUser.getCustomId().longValue());
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("从列表中删除sim卡失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;
	}
	
	@RequestMapping(value = "/delSimPackageById", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delSimPackageById(@RequestParam("id") Long id){
		log.info("request delSimPackageById=" + id);
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
	/*	if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		try {
			this.simPackageService.delSimPackageById(id, loginUser.getCustomId());
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("从列表中删除sim卡失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;
	}
	
	@RequestMapping(value = "/checkPackageUsed", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkPackageUsed(@RequestParam("id") Long id){
		User loginUser = SessionUtil.getCommonUserFromSession();
		return this.simPackageService.getSimPackageRelativeById(id, loginUser.getCustomId());
	}
	
	@RequestMapping(value = "/getsimCardGroupPackageList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getsimCardGroupPackageList(){
		User loginUser = SessionUtil.getCommonUserFromSession();
	/*	if (loginUser.getUserType() != UserType.TENANT) {
			return new HashMap<String, Object>();
		}*/
		Map<String,Object> returnedData = new HashMap<String,Object>();
		List<SimPackage> simGroupPackages = this.simPackageService.getsimCardGroupPackageList(loginUser.getCustomId());
		returnedData.put("simGroupPackages", simGroupPackages);
		return returnedData;
	}
}
