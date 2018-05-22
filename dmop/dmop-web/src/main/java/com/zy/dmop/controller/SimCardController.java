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
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.model.SimCard;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.SimTerminalVo;
import com.zy.dmop.resource.service.SimCardCarRelativeService;
import com.zy.dmop.resource.service.SimCardService;
import com.zy.dmop.resource.service.SimPackageService;
import com.zy.dmop.util.CommonMessage;



@Controller
@RequestMapping("/simCard")
public class SimCardController {
	private static Logger log = Logger.getLogger(SimCardController.class);
	//定义一个操作日志的所属界面字符串
		public static final String PAGE = "SIM卡";
		@Autowired
		private OperateLogService operateLogService;
	@Autowired
	private SimCardService simCardService;
	@Autowired
	private SimCardCarRelativeService simCardCarRelativeService;
	@Autowired
	private SimPackageService simPackageService;
	@Autowired
	private TerminalService terminalService;

	@RequestMapping(value = "/insertSimCard", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertSimCard
		(@RequestParam(value = "cardId", required = true) Long id,
		@RequestParam(value = "packageType", required = true) Long simPackageId,
		@RequestParam(value = "terminalNum", required = true) String terminalNum){
		Map<String, Object> returnedData = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		
		try{
			SimCard existsSim=this.simCardService.getSimCardById(id);//getSimCardById(id, loginUser.getCustomId());
			if(existsSim!=null){
				commonMsg.setSuccess( false );
				commonMsg.setErrorMessage( "新增sim卡信息失败,卡号已存在!" );
				return returnedData;
			}
			log.info("插入到关联表");
			//插入到关联表
			this.simCardService.addSimTer(id,terminalNum);
			this.terminalService.updateState(terminalNum, 1);
			SimCard simCard=new SimCard();
			simCard.setCustomId(loginUser.getCustomId());
			simCard.setSimCardId(id);
			//simCard.setBalance(balance);
			simCard.setSimPackageId(simPackageId);
			
			this.simCardService.insertSimCard( simCard );
			commonMsg.setSuccess( true );
			commonMsg.setErrorMessage( "" );
		} catch (Exception e) {
			commonMsg.setSuccess( false );
			commonMsg.setErrorMessage( "新增sim卡信息失败!" );
			
			log.error( e.getMessage() , e );
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=id +" "+PAGE;
		operateLogService.addInsert(loguser, content);
		return returnedData;
	}
		
	
	@RequestMapping(value = "/updateSimCard", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateSimCard(
			@RequestParam(value = "cardId", required = true) Long id,
			@RequestParam(value = "packageType", required = true) Integer simPackageId,
			@RequestParam(value = "terminalNum", required = true) String terminalNum,
			@RequestParam(value = "balance", required = true) Float balance){
		Map<String,Object> returnedData = new HashMap<String, Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put( "commonMsg" , commonMsg );
		User loginUser = SessionUtil.getCommonUserFromSession();
		SimTerminalVo sim=this.simCardService.getSimCardById(id, loginUser.getCustomId());
		this.terminalService.updateState(sim.getTerminalNum(), 0);
		this.terminalService.updateState(terminalNum, 1);
		try {
			simCardService.updateSimCardInfo( id , simPackageId);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			simCardCarRelativeService.updateSimCardCarRelativeWhenCardIdChange(id,terminalNum);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try{

			commonMsg.setSuccess( true );
			commonMsg.setErrorMessage( "" );
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("修改sim卡信息失败!");
			
			log.error(e.getMessage(), e);
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=id+" "+PAGE;
		operateLogService.addUpdate(loguser, content);
		return returnedData;
	}
	
	
	
	@RequestMapping(value = "/getSimCardById", method = RequestMethod.POST)
	@ResponseBody
	public SimTerminalVo getSimCardById(@RequestParam(value = "id", required = true) Long id){
		//User loginUser = SessionUtil.getCommonUserFromSession();
		//loginUser.setCustomId(2);
		return this.simCardService.getSimCardById(id, 2);
	}
	

	//sim卡分页查询
		@RequestMapping(value="/getSimCardPage",method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> queryAlarm(
				
				@RequestParam(value="start", required=false) Integer start , 
				@RequestParam(value="countPerPage", required=false) Integer countPerPage,
				@RequestParam(value="simCardId", required=false) Long simCardId ) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			CommonMessage commonMsg = new CommonMessage();
			returnMap.put("commonMessage", commonMsg);
			
			start = start == null ? 0 : start;
			countPerPage = countPerPage == null ? 10 : countPerPage;
			
			Page page = new Page();
			page.setLimit(countPerPage);
			page.setStart(start);
			try {
				PageResult<SimTerminalVo> pageResult = simCardService.pageQueryAlarm(simCardId, page);
				commonMsg.setSuccess(true);
				returnMap.put("simCards", pageResult.getData());
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
	
	
	
	@RequestMapping(value = "/delSimCardsByIds", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delSimCardsById(@RequestParam("deleteIds") List<Long> ids){
		Map<String,Object> returnedData = new HashMap<String,Object>();
		CommonMessage commonMsg = new CommonMessage();
		returnedData.put("commonMsg", commonMsg);
		User loginUser = SessionUtil.getCommonUserFromSession();
		/*if (loginUser.getUserType() != UserType.TENANT) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage(com.gd.ivt.service.common.MessageConst.ERRORMSG_UNAUTHORIZED);
			return returnedData;
		}*/
		try {
			this.simCardService.delSimCardsById(ids, loginUser.getCustomId());
			if(this.simCardCarRelativeService.getSimCardCarRelativeByIds(ids)){
				this.simCardCarRelativeService.delSimCardCarRelativeBySimCardIds(ids);
			}
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("从列表中删除sim卡失败!");
			
			log.error(e.getMessage(), e);
		}
		return returnedData;
	}
	
	@RequestMapping(value = "/delSimCardById", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delSimCardById(@RequestParam("id") Long id){
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
			SimTerminalVo sim=simCardService.getSimCardById(id, 2);
			this.simCardService.delSimCardById(id);
			this.terminalService.updateState(sim.getTerminalNum(), 0);
			if(this.simCardCarRelativeService.getSimCardCarRelativeByCardId(id) != null){
				this.simCardCarRelativeService.delSimCardCarRelativeBySimCardId(id);
			}
			commonMsg.setSuccess(true);
			commonMsg.setErrorMessage("");
		} catch (Exception e) {
			commonMsg.setSuccess(false);
			commonMsg.setErrorMessage("从列表中删除sim卡失败!");
			
			log.error(e.getMessage(), e);
		}
		User loguser=new User();
		loguser.setUserId(loginUser.getUserId());
		loguser.setOrganizationId(loginUser.getOrganizationId());
		String content=id+" "+PAGE;
		operateLogService.addDelete(loguser, content);
		return returnedData;
	}
	
	@RequestMapping(value = "/checkCardUsed", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkCardUsed(@RequestParam("id") Long id){		
		return this.simCardCarRelativeService.getSimCardCarRelativeByCardId(id) != null;
	}
	
	@RequestMapping(value = "/checkCardsUsed", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkCardUsed(@RequestParam("ids") List<Long> ids){		
		return this.simCardCarRelativeService.getSimCardCarRelativeByIds(ids);
	}
	
	@RequestMapping(value = "/getRelativeCarNameByCarId", method = RequestMethod.POST)
	@ResponseBody
	public String getRelativeCarNameByCarId(@RequestParam("id") Long id){	
		
		return this.simCardCarRelativeService.getRelativeCarNameByCarId(id);
	}
}
