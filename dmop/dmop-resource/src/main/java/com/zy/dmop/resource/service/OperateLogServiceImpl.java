package com.zy.dmop.resource.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.OperateLogDao;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.OperateCusUserVo;

@Component("operateLogService")
@Transactional(propagation=Propagation.REQUIRED)
public class OperateLogServiceImpl implements OperateLogService {
	@Autowired
	private OperateLogDao operateLogDao;
	@Autowired
	private OrganizationDao organizationDao;
	
	@Override
	public PageResult<OperateCusUserVo> pageQueryOperateLog(String startCreateDateStr,String endCreateDateStr,Page page,Integer organizationId) throws ErrorMessageException {
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
		PageResult<OperateCusUserVo> pageResult;
		pageResult = operateLogDao.pageQueryOperateLog(startCreateDateStr,endCreateDateStr,page,aorgIds);
		orgs.clear();
		aorgIds.clear();
		return pageResult;
	}

	@Override
	public void deleteOperateLog(long operateLogId) {
		// TODO Auto-generated method stub
		operateLogDao.deleteOperateLog(operateLogId);
	}

	@Override
	public List<OperateLog> getOperateLogs(){
		List<OperateLog> operateLogs = operateLogDao.getOperateLogs();
		return operateLogs;
	}
	
	@Override
	public void insertOperateLog(OperateLog operateLog) {
		operateLogDao.insertOperateLog(operateLog);
	}

	@Override
	public List<OperateCusUserVo> exportOperateLog(Integer organizationId) {
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
		List<OperateCusUserVo> operateLogs = operateLogDao.exportOperateLog(aorgIds);
		aorgIds.clear();
		return operateLogs;
	}

	@Override
	public void addInsert(User user, String content) {
		Date date=new Date();
		OperateLog operateLog=new OperateLog();
		operateLog.setUserId(user.getUserId());
		operateLog.setOrganizationId(user.getOrganizationId());
		operateLog.setCreateDateTime(date);
		operateLog.setModifyDateTime(date);
		operateLog.setText("增加了 "+content);
		operateLogDao.insertOperateLog(operateLog);
	}

	@Override
	public void addDelete(User user, String content) {
		Date date=new Date();
		OperateLog operateLog=new OperateLog();
		operateLog.setUserId(user.getUserId());
		operateLog.setOrganizationId(user.getOrganizationId());
		operateLog.setCreateDateTime(date);
		operateLog.setModifyDateTime(date);
		operateLog.setText("删除了"+content);
		operateLogDao.insertOperateLog(operateLog);
		
	}

	@Override
	public void addQuery(User user, String content) {
		Date date=new Date();
		OperateLog operateLog=new OperateLog();
		operateLog.setUserId(user.getUserId());
		operateLog.setOrganizationId(user.getOrganizationId());
		operateLog.setCreateDateTime(date);
		operateLog.setModifyDateTime(date);
		operateLog.setText("对 "+content+" 进行了精准查询");
		operateLogDao.insertOperateLog(operateLog);
		
	}

	@Override
	public void addUpdate(User user, String content) {
		Date date=new Date();
		OperateLog operateLog=new OperateLog();
		operateLog.setUserId(user.getUserId());
		operateLog.setOrganizationId(user.getOrganizationId());
		operateLog.setCreateDateTime(date);
		operateLog.setModifyDateTime(date);
		operateLog.setText("对"+content+"进行了修改");
		operateLogDao.insertOperateLog(operateLog);
		
	}
	@Override
	public void addExport(User user, String content) {
		Date date=new Date();
		OperateLog operateLog=new OperateLog();
		operateLog.setUserId(user.getUserId());
		operateLog.setOrganizationId(user.getOrganizationId());
		operateLog.setCreateDateTime(date);
		operateLog.setModifyDateTime(date);
		operateLog.setText("导出 "+content);
		operateLogDao.insertOperateLog(operateLog);
	}
	@Override
	public void addImport(User user, String content) {
		Date date=new Date();
		OperateLog operateLog=new OperateLog();
		operateLog.setUserId(user.getUserId());
		operateLog.setOrganizationId(user.getOrganizationId());
		operateLog.setCreateDateTime(date);
		operateLog.setModifyDateTime(date);
		operateLog.setText("导入 "+content);
		operateLogDao.insertOperateLog(operateLog);
	}

}
