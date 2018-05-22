package com.zy.dmop.resource.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.OperateLogDao;
import com.zy.dmop.api.web.dao.HistoryDataDao;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.service.HistoryDataService;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.vo.HistoryDataVO;

@Component("historyDataService")
@Transactional(propagation=Propagation.REQUIRED)
public class HistoryDataServiceImpl implements HistoryDataService {
	@Autowired
	private OrganizationDao organizationDao;
	@Autowired
	private HistoryDataDao historyDataDao;
	@Override
	public PageResult<HistoryData> pageQueryHistoryData(String upsType,Page page) throws ErrorMessageException {

		PageResult<HistoryData> pageResult;
		pageResult = historyDataDao.pageQueryHistoryData(upsType,page);

		return pageResult;
	}

	@Override
	public void deleteHistoryData(long id) {
		// TODO Auto-generated method stub
		historyDataDao.deleteHistoryData(id);
	}

	@Override
	public List<HistoryData> getHistoryDatas(){
		List<HistoryData> historyDataLogs = historyDataDao.getHistoryDatas();
		return historyDataLogs;
	}

	@Override
	public PageResult<HistoryDataVO> pageQueryHistoryDataVO(String terminalName, Page page,Integer organizationId) {
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
		PageResult<HistoryDataVO> pageResult;
		pageResult = historyDataDao.pageQueryHistoryDataVO(terminalName,page,aorgIds);
		orgs.clear();
		return pageResult;
	}

	@Override
	public List<HistoryDataVO> getHistoryExcelDatas(Integer organizationId,String startDate,String endDate,String terminal) {
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
		List<HistoryDataVO> excelDatas=historyDataDao.getHistoryExcelDatas(aorgIds,startDate,endDate,terminal);
		aorgIds.clear();
		return excelDatas;
	}
}
