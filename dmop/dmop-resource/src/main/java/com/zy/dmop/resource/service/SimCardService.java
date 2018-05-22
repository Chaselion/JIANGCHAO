package com.zy.dmop.resource.service;




import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.SimCard;
import com.zy.dmop.model.vo.SimTerminalVo;
import com.zy.dmop.resource.dao.SimCardDao;
import com.zy.dmop.util.DatatablePage;

@Component("simCardService")
@Transactional(propagation=Propagation.REQUIRED)
public class SimCardService {
	@Autowired
	private SimCardDao simCardDao;

	public void insertSimCard(SimCard SimCard) {
		Date date=new Date();
		
		SimCard.setCreateDateTime(date);
		SimCard.setModifyDateTime(date);
		
		this.simCardDao.insertSimCard(SimCard);
	} 
	
	public void updateSimCard(SimCard SimCard, Long oldCardId){
		Date date=new Date(0);
		SimCard.setModifyDateTime(date);
		this.simCardDao.updateSimCard(SimCard, oldCardId);
	}
	
	public void updateAllSimCard( Long pakcageId, Integer arrearsState, Float balance, Long tenantId){
		this.simCardDao.updateAllSimCardOperator(pakcageId, arrearsState, balance, tenantId);
	}
	
	public void rechargeSimCard(Long cardId, Float balance, Integer arrearsState, Long tenantId){
		this.simCardDao.rechargeSimCard(cardId,balance, arrearsState, tenantId);
	}
	public SimTerminalVo getSimCardById(long id,Integer customId){
		return this.simCardDao.getSimCardById(id,customId);
	}
	/*public DatatablePage<SimCard> getSimCardPage
	(final Long cardId, final Integer usedStatus, final Long packageType, final Integer arrearsState, final Integer tenantId, final Integer start, final Integer countPerPage){
		return this.simCardDao.getSimCardPage(cardId, usedStatus, packageType, arrearsState, tenantId, start, countPerPage);
	}*/
	public DatatablePage<SimCard> getSimCardPage
	(final Long cardId, final Integer usedStatus, final Long packageType, final Integer arrearsState, final Integer tenantId, final Integer start, final Integer countPerPage){
		return this.simCardDao.getSimCardPage(cardId, usedStatus, packageType, arrearsState, tenantId, start, countPerPage);
	}
	
	public void delSimCardsById(List<Long> ids, Integer tenantId){
		this.simCardDao.delSimCardsById(ids,tenantId);
	}
	
	public void delSimCardById(Long id){
		this.simCardDao.delSimCardById(id);
	}
	
	public void changeArrearState(Long cardId, Integer arrearState, Integer tenantId){
		this.simCardDao.changeArrearState(cardId, arrearState, tenantId);
	}
	
	public List<SimCard> getSimCardIdsListByPackage(Long packageType, Integer tenantId){
		return this.simCardDao.getSimCardIdsListByPackage(packageType, tenantId);
	}

	public SimCard getSimCardById(Long id) {
		return simCardDao.getSimById(id);
	}

	public void addSimTer(Long id, String terminalNum) {
		simCardDao.addSimTer(id,terminalNum);
		
	}

	public PageResult<SimTerminalVo> pageQueryAlarm(Long simCardId, Page page) {
		return simCardDao.getSimCardPage(simCardId, page);
	}

	public void updateSimCardInfo(Long id, int simPackageId) {
		 simCardDao.updateSimInfo(id , simPackageId);
	}
}
