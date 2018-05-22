package com.zy.dmop.resource.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.dao.TerminalDao;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.UpsInfo;
import com.zy.dmop.model.vo.OrganizationView;
import com.zy.dmop.model.vo.TerOrzCusVo;
import com.zy.dmop.model.vo.TerminalStrategyVo;
import com.zy.dmop.util.DatatablePage;

@Component("terminalService")
@Transactional(propagation=Propagation.REQUIRED)
public class TerminalServiceImpl implements TerminalService {
	//private static final List<Terminal> list=new ArrayList<Terminal>();
	@Autowired
	private TerminalDao terminalDao;
	
	@Autowired
	private OrganizationDao organizationDao;
	
	@Override
	public PageResult<TerminalStrategyVo> findByPageAndId(String terminalNum,Page page,Integer organizationId) {
		int o=organizationId;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organizationId);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();
		PageResult<TerminalStrategyVo> pageResult;
			
			pageResult = terminalDao.pageQueryAlarm(terminalNum,page,aorgIds);
			aorgIds.clear();
		return pageResult;
	}
	//修改弹框查询数据库的回显
	@Override
	public Terminal findById(Integer id) {
		Terminal terminal = terminalDao.selectById(id);
		return terminal;
	}
	//修改弹框确认更新数据库
	@Override
	public boolean modifyById(Terminal terminal) {
		int affected = terminalDao.updateById(terminal);
		return affected==1?true:false;
	}
	@Override
	public boolean removeUpsById(Terminal terminal) {
		int affected = terminalDao.deleteUpsById(terminal);
		return affected==1?true:false;
	}
	
	@Override
	public boolean add(Terminal terminal) {
		int affected = terminalDao.insert(terminal);
		return affected==1?true:false;
	}
	
	//遍历终端编号的字符串数组，传入字符串进行查询策略id
	@Override
	public int getStrategyId(String terminalId) {
		Integer terId= terminalDao.getStrategyId(terminalId);
		if(0==terId) {
			return terId;
		}
		return terId;
	}
	@Override
	public String getTerminalNum(int terminalId) {
		return terminalDao.getTerminalNum(terminalId);
	}
	@Override
	public Integer findByTerminalId(String terminalNum) {
		Integer id =terminalDao.selectIdByTerminalId(terminalNum);
		return id;
	}
	
	@Override
	public List<Terminal> getTerminalExcel() {
		// TODO Auto-generated method stub
		return terminalDao.getTerminalExcel();
	}
	@Override
	public PageResult<Terminal> getTerminalPage(String terminalNum, Integer terminalModelId, Page page,Integer organizationId) {
		// TODO Auto-generated method stub
		int o=organizationId;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organizationId);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();
		PageResult<Terminal> pageResult;
		pageResult=terminalDao.getTerminalPage(terminalNum, terminalModelId, page,aorgIds);
		aorgIds.clear();
		return pageResult;
	}
	@Override
	public List<Terminal> findAll(long organization_id) {
		int a=(int) organization_id;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organization_id);
		Organization aorg=organizationDao.findOrganizationById(a);
		orgs.add(aorg);
		List<Integer> orgIds =new ArrayList<Integer>();
		//List<Terminal> list=new ArrayList<Terminal>();
		for(Organization org : orgs){
		Integer orgId =org.getOrganizationId();
				orgIds.add(orgId);
		}
		orgs.clear();
		List<Terminal> list=terminalDao.listAll(orgIds);
		return list;
	}
	@Override
	public List<HistoryData> getUpsInfo(String terminalId) {
		List<HistoryData> list = terminalDao.getUpsInfo(terminalId);
		return list;
	}
	@Override
	public void updateStrategy(int id, int strategyId){
		terminalDao.updateStrategy(id, strategyId);
	}
	@Override
	public List<TerminalStrategyVo> getExcelData(Integer organizationId) {
		int o=organizationId;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organizationId);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();
		List<TerminalStrategyVo> list = terminalDao.getExcelData(aorgIds);
		aorgIds.clear();
		return list;
	}
	@Override
	public List<TerOrzCusVo> getInfo(String terminalId) {
		List<TerOrzCusVo> list=terminalDao.getInfo(terminalId);
		return list;
	}
	@Override
	public List<DeviceClass> getDeviceClass() {
		List<DeviceClass> deviceClass=terminalDao.getDeviceClass();
		return deviceClass;
	}
	@Override
	public void updateState(String id, Integer state) {
		terminalDao.updateState(id, state);
		
	}
	@Override
	public void addInfo(UpsInfo upsInfo) {
		terminalDao.addInfo(upsInfo);
		
	}
	@Override
	public void updateInfo(UpsInfo upsInfo) {
		terminalDao.updateInfo(upsInfo);
		
	}
	@Override
	public void deleteTerminalByOrg(int organizationId) {
		// TODO Auto-generated method stub
		terminalDao.deleteTerminalByOrg(organizationId);
	}
	@Override
	public Boolean isTerminalTrue(String terminalId) {
		Boolean istrue=terminalDao.isTerminalTrue(terminalId);
		return istrue;
	}
	@Override
	public String getNamefromId(String terminalId) {
		String terminalName=terminalDao.getNamefromId(terminalId);
		return terminalName;
	}
	@Override
	public List<TerminalStrategyVo> findTerminalMobile(String terminalNum,
			Integer organizationId) {
		int o=organizationId;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organizationId);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();
		List<TerminalStrategyVo> result;
			
			result = terminalDao.getTerminalMobile(terminalNum, aorgIds);
			aorgIds.clear();
		return result;
	}

}
