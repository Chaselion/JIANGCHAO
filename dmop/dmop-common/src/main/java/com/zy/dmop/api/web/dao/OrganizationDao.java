package com.zy.dmop.api.web.dao;

import java.util.List;

import com.zy.dmop.model.Organization;
import com.zy.dmop.model.User;

public interface OrganizationDao {
	public List<Organization> findChildOrgsByParentId(List<Organization> menuList,long parentId);

	public Organization findOrganizationById(int id);
	
	public List<Organization> getSystemOrganizations(int customid);

	public void create(Organization org);

	public void update(Organization org);

	public int getChildOrganizationCount(int id);

	public void delete(int id);
	
	public List<Organization> getOrganizations();
	
	public Integer getcustomId(Integer orgId);
	public List<Organization> getAllOrganizationForCache();

}
