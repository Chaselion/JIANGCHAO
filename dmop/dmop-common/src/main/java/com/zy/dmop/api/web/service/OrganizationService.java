package com.zy.dmop.api.web.service;

import java.util.List;

import com.zy.dmop.model.Custom;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.vo.OrganizationView;

public interface OrganizationService {
	
	List<OrganizationView> getOrgsTreeByUser(Integer customid);
	List<OrganizationView> findChildOrgsByParentId(long parentId);
	
	Organization createOrganization(Organization org);
	
	int getChildOrganizationCount(int id);
	
	
	void deleteOrganization(int id);
	
	Organization getOrganizationById(int id);
	
	void updateOrganization(Organization org);
	
	public List<Organization> getOrganizations();
	
	public Integer getcustomId(Integer orgId);

}
