package com.zy.dmop.resource.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.model.SimCardTerminalRelative;
import com.zy.dmop.resource.dao.SimCardCarRelativeDao;

@Component("simCardCarRelativeService")
@Transactional(propagation=Propagation.REQUIRED)
public class SimCardCarRelativeService {
	@Autowired
	private SimCardCarRelativeDao simCardCarRelativeDao;

	public void insertSimCardCarRelative(final Long carId, final Long cardId) {
		this.simCardCarRelativeDao.insertSimCardCarRelative(carId,cardId);
	} 
	
	public void updateSimCardCarRelative(final Long carId, final Long cardId){
		this.simCardCarRelativeDao.updateSimCardCarRelative(carId,cardId);
	}
	public void updateSimCardCarRelativeWhenCardIdChange(final Long oldCardId, final String terminalNum){
		this.simCardCarRelativeDao.updateSimCardCarRelativeWhenCardIdChange(oldCardId,terminalNum);
	}
	
	public void delSimCardsCarRelativeByCarId(final Long carId){
		this.simCardCarRelativeDao.delSimCardsCarRelativeByCarId(carId);
	}
	
	public void delSimCardCarRelativeBySimCardId(final Long simCardId){
		this.simCardCarRelativeDao.delSimCardCarRelativeBySimCardId(simCardId);
	}
	
	public void delSimCardCarRelativeBySimCardIds(List<Long> simCardId){
		this.simCardCarRelativeDao.delSimCardCarRelativeBySimCardIds(simCardId);
	}
	
	public SimCardTerminalRelative getSimCardCarRelativeByCardId(final long id){
		return this.simCardCarRelativeDao.getSimCardCarRelativeByCardId(id);
	}
		
	public SimCardTerminalRelative getSimCardCarRelativeByCarId(final Long carId){
		return this.simCardCarRelativeDao.getSimCardCarRelativeByCarId(carId);
	}
	
	public boolean getSimCardCarRelativeByIds(final  List<Long> simCardId){
		int count = this.simCardCarRelativeDao.getSimCardCarRelativeByIds(simCardId);
		if(count > 0)
			return true;
		return false;
	}
	
	public String getRelativeCarNameByCarId(Long carId){
		return this.simCardCarRelativeDao.getRelativeCarNameByCarId(carId);
	}
}
