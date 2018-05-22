package com.zy.dmop.resource.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.model.SimCardOperator;
import com.zy.dmop.resource.dao.SimCardOperatorDao;
import com.zy.dmop.util.DatatablePage;

@Component("simCardOperatorService")
@Transactional(propagation=Propagation.REQUIRED)
public class SimCardOperatorService {
	@Autowired
	private SimCardOperatorDao simCardOperatorDao;

	public void insertSimCardOperator( SimCardOperator simCardOperator) {
		Date date=new Date();
    	simCardOperator.setCreateDateTime(date);
    	simCardOperator.setModifyDateTime(date);
		this.simCardOperatorDao.insertSimCardOperator(simCardOperator);
	} 
	
	public void updateSimCardOperator( SimCardOperator simCardOperator){
		Date date=new Date();
    	simCardOperator.setModifyDateTime(date);
		this.simCardOperatorDao.updateSimCardOperator(simCardOperator);
	}
	
	public SimCardOperator getSimCardOperatorById(long id, Integer tenantId){
		return this.simCardOperatorDao.getSimCardOperatorById(id, tenantId);
	}
	public DatatablePage<SimCardOperator> getSimCardOperatorPage(final String operatorName, final Integer tenantId, final Integer start, final Integer countPerPage){
		return this.simCardOperatorDao.getSimCardOperatorPage(operatorName, tenantId, start, countPerPage);
	}
	public List<SimCardOperator> getSimCardOperatorList(Integer tenantId){
		return this.simCardOperatorDao.getSimCardOperatorList(tenantId);
	}

	public void delSimCardOperatorsById(List<Long> ids, Integer tenantId){
		this.simCardOperatorDao.delSimCardOperatorsById(ids, tenantId);
	}
	
	public void delSimCardOperatorById(Long id, Integer tenantId){
		this.simCardOperatorDao.delSimCardOperatorById(id, tenantId);
	}
	
	public boolean getSimCardOperatorRelativeById(Long id, Integer tenantId){
		int count=this.simCardOperatorDao.getSimCardOperatorRelativeById(id, tenantId);
		if(count > 0)
			return true;
		return false;
	}
}
