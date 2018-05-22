package com.zy.dmop.resource.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.service.OrganizationService;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.vo.OrganizationView;

@Component("organizationService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrganizationServiceImpl implements OrganizationService{
private static final Logger log = Logger.getLogger(OrganizationServiceImpl.class);
	
	@Autowired
	private OrganizationDao organizationDao;

	@Override
	public List<OrganizationView> getOrgsTreeByUser(Integer customid) {
		
			List<Organization> sysOrgs = organizationDao.getSystemOrganizations(customid);
			
			return makeTree(sysOrgs);
		
		//return new ArrayList<OrganizationView>();
	}
	
	@Override
	public List<OrganizationView> findChildOrgsByParentId(long parentId) {
		int a=(int) parentId;
		List<Organization> omenu=organizationDao.getOrganizations();
		List<Organization> oorgs=organizationDao.findChildOrgsByParentId(omenu, parentId);
		Organization oorg=organizationDao.findOrganizationById(a);
		oorgs.add(oorg);
		omenu.clear();
		List<OrganizationView> orgview=makecTree(oorgs,oorg.getParentId());
		oorgs.clear();
		return orgview;
	}
	private List<OrganizationView> makeTree(List<Organization> orgsList) {
		if (orgsList.isEmpty()) {
			return new ArrayList<OrganizationView>();
		}
		
		List<OrganizationView> children = new ArrayList<OrganizationView>();
		List<OrganizationView> parentsList = new ArrayList<OrganizationView>();
		Map<Integer, OrganizationView> parents = new HashMap<Integer, OrganizationView>();
		
		for (Organization org : orgsList) {
			OrganizationView orgView = convertEntityToView(org);
			
			if (orgView.getParentId() != 0) {
				children.add(orgView);
			} else {
				parentsList.add(orgView);
				parents.put(orgView.getOrganizationId(), orgView);
			}
		}
		orgsList.clear();
		makeChildren(parents, children);
		
		return parentsList;
	}
	
	private void makeChildren(Map<Integer, OrganizationView> parents, List<OrganizationView> children) {
		if (children.isEmpty()) {
			return;
		}
		
		List<OrganizationView> parentFound = new ArrayList<OrganizationView>();
		
		for (OrganizationView child : children) {
			if (child.getParentId() != 0) {
				OrganizationView parent = parents.get(child.getParentId());
				if (parent != null) {
					parent.addChild(child);
					
					child.setParent(parent);
					
					parentFound.add(child);
					parents.put(child.getOrganizationId(), child);
				}
			}
		}
		
		children.removeAll(parentFound);
		
		makeChildren(parents, children);
		
		return;
	}
	private List<OrganizationView> makecTree(List<Organization> orgsList,long parentId) {
		if (orgsList.isEmpty()) {
			return new ArrayList<OrganizationView>();
		}
		
		List<OrganizationView> children = new ArrayList<OrganizationView>();
		List<OrganizationView> parentsList = new ArrayList<OrganizationView>();
		Map<Integer, OrganizationView> parents = new HashMap<Integer, OrganizationView>();
		
		for (Organization org : orgsList) {
			OrganizationView orgView = convertEntityToView(org);
			
			if (orgView.getParentId() != parentId) {
				children.add(orgView);
			} else {
				parentsList.add(orgView);
				parents.put(orgView.getOrganizationId(), orgView);
			}
		}
		orgsList.clear();
		makecChildren(parents, children,parentId);
		
		return parentsList;
	}
	
	private void makecChildren(Map<Integer, OrganizationView> parents, List<OrganizationView> children,long parentId) {
		if (children.isEmpty()) {
			return;
		}
		
		List<OrganizationView> parentFound = new ArrayList<OrganizationView>();
		
		for (OrganizationView child : children) {
			if (child.getParentId() != parentId) {
				OrganizationView parent = parents.get(child.getParentId());
				if (parent != null) {
					parent.addChild(child);
					
					child.setParent(parent);
					
					parentFound.add(child);
					parents.put(child.getOrganizationId(), child);
				}
			}
		}
		
		children.removeAll(parentFound);
		
		makecChildren(parents, children,parentId);
		
		return;
	}
	
	private OrganizationView convertEntityToView(Organization org) {
		OrganizationView orgView = new OrganizationView();
		orgView.setOrganizationId(org.getOrganizationId());
		orgView.setName(org.getName());
		orgView.setType(org.getType());
		orgView.setParentId(org.getParentId());
		orgView.setDescription(org.getDescription());
		orgView.setCreateDateTime(org.getCreateDateTime());
		orgView.setAlarmStrategyId(org.getAlarmStrategyId());
		orgView.setModifyDateTime(org.getModifyDateTime());
		orgView.setNote(org.getNote());
		orgView.setCustomId(org.getCustomId());
		return orgView;
	}


	@Override
	public Organization createOrganization(Organization org) {
		organizationDao.create(org);
		return org;
	}


	@Override
	public int getChildOrganizationCount(int id) {
		// TODO Auto-generated method stub
		return organizationDao.getChildOrganizationCount(id);
	}


	@Override
	public void deleteOrganization(int id) {
		// TODO Auto-generated method stub
		organizationDao.delete(id);
	}


	@Override
	public Organization getOrganizationById(int id) {
		return organizationDao.findOrganizationById(id);
	}


	@Override
	public void updateOrganization(Organization org) {
		// TODO Auto-generated method stub
		organizationDao.update(org);
	}


	@Override
	public List<Organization> getOrganizations() {
		// TODO Auto-generated method stub
		return organizationDao.getOrganizations();
	}


	@Override
	public Integer getcustomId(Integer orgId) {
		// TODO Auto-generated method stub
		return organizationDao.getcustomId(orgId);
	}


	
	
}
