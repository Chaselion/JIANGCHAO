package com.zy.dmop.resource.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.model.SimPackage;
import com.zy.dmop.resource.dao.SimPackageDao;
import com.zy.dmop.util.DatatablePage;
@Component("simPackageService")
@Transactional(propagation=Propagation.REQUIRED)
public class SimPackageService {
	@Autowired
	private SimPackageDao simPackageDao;

	public void insertSimPackage(SimPackage SimPackage) {
		Date date=new Date();
		SimPackage.setCreateDateTime(date);
		SimPackage.setModifyDateTime(date);
		this.simPackageDao.insertSimPackage(SimPackage);
	} 
	
	public void updateSimPackage(SimPackage SimPackage){
		Date date=new Date();
		SimPackage.setModifyDateTime(date);
		this.simPackageDao.updateSimPackage(SimPackage);
	}
	public SimPackage getSimPackageById(Long id, Integer tenantId){
		return this.simPackageDao.getSimPackageById(id, tenantId);
	}
	public DatatablePage<SimPackage> getSimPackagePage(final String packageName, final Long operatorsType, final Integer packageGroupType, final Integer tenantId, final Integer start, final Integer countPerPage){
		return this.simPackageDao.getSimPackagePage(packageName, operatorsType, packageGroupType, tenantId,start, countPerPage);
	}
	
	public void delSimPackagesById(List<Long> ids,Long tenantId){
		this.simPackageDao.delSimPackagesById(ids,tenantId);
	}
	
	public void delSimPackageById(Long id,Integer tenantId){
		this.simPackageDao.delSimPackageById(id,tenantId);
	}
	
	public boolean getSimPackageRelativeById(final Long PackageId, Integer tenantId){
		int count = this.simPackageDao.getSimPackageRelativeById(PackageId,tenantId);
		if(count > 0)
			return true;
		return false;
	}
	
	public List<SimPackage> getsimCardGroupPackageList(Integer tenantId){
		return this.simPackageDao.getsimCardGroupPackageList(tenantId);
	}
}
