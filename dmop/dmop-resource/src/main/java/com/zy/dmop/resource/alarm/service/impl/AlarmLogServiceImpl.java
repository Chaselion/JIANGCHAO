package com.zy.dmop.resource.alarm.service.impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.alarm.dao.AlarmLogDao;
import com.zy.dmop.api.alarm.service.AlarmLogService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.TimeConst;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.vo.AlarmLogVo;
import com.zy.dmop.model.vo.ConditionProperityVo;
import com.zy.dmop.util.DateUtil;
import com.zy.dmop.util.StringUtil;


@Component("alarmService")
@Transactional(propagation=Propagation.REQUIRED)
public class AlarmLogServiceImpl implements AlarmLogService {
	private static final Logger log = Logger.getLogger(AlarmLogServiceImpl.class);
	@Autowired
	private AlarmLogDao alarmDao;
	@Autowired
	private OrganizationDao organizationDao;
	//分页查询
	@Override
	public PageResult<AlarmLog> pageQueryAlarm(Page page,String startCreateDateStr,String endCreateDateStr,Integer organizationId) throws ErrorMessageException {
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
		Date startCreateDateSql = null;
		if (!StringUtil.isNullOrEmpty(startCreateDateStr)) {
			try {
				long startCreateTime = DateUtil.getTimeOfDate(startCreateDateStr, "yyyy-MM-dd");
				startCreateDateSql = new Date(startCreateTime);
			} catch (ParseException e) {
				log.info("illegal startCreateDateStr=[" + startCreateDateStr + "], ignore with errorMessage=" + e.getMessage());
			}
		}

		Date endCreateDateSql = null;
		if (!StringUtil.isNullOrEmpty(endCreateDateStr)) {
			try {
				long endCreateTime = DateUtil.getTimeOfDate(endCreateDateStr, "yyyy-MM-dd");
				endCreateDateSql = new Date(endCreateTime+ TimeConst.MILLISECOND_OF_A_DAY);
			} catch (ParseException e) {
				log.info("illegal endCreateDateStr=[" + endCreateDateStr + "], ignore with errorMessage=" + e.getMessage());
			}
		}
		    PageResult<AlarmLog> pageResult;
			pageResult = alarmDao.pageQueryAlarm(page,startCreateDateSql,endCreateDateSql,aorgIds);
			aorgIds.clear();
		return pageResult;
	}


	@Override
	public List<AlarmLog> getAlarmLogs(Integer organizationId) {
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
		List<AlarmLog> list=alarmDao.getAlarmLogs(aorgIds);
		aorgIds.clear();
		return list;
	}


	@Override

	public AlarmLog createLog(String terminlId,ConditionProperityVo conditionDeviceVo,Double value) {

		AlarmLog alarmLog=alarmDao.getAlarm(terminlId);
		alarmLog.setCreateDateTime(new Timestamp(System.currentTimeMillis()));
		alarmLog.setModifyDateTime(new Timestamp(System.currentTimeMillis()));
		alarmLog.setCurrentAlarmLevel(conditionDeviceVo.getInitialAlarmLevelId()+"");
		alarmLog.setCurrentAlarmValue(value);
		alarmLog.setIsPromote(conditionDeviceVo.getIfAutoPromote());
		alarmLog.setIsRelieve(1);
		alarmLog.setMeasureName("短信");
		alarmLog.setIsSend(conditionDeviceVo.getIfActive());
		alarmLog.setConditionName(conditionDeviceVo.getName());
		String message=alarmLog.getDeviceName()+"设备"+conditionDeviceVo.getName()+"发生异常，异常值为"+value;
		alarmLog.setMessage(message);
		alarmLog.setIsConfirm(0);
		return alarmDao.createLog(alarmLog);
	}

	@Override
	public void updateLog(String terminalId, ConditionProperityVo conditionDeviceVo, Double value,String date) {
		AlarmLog alarmLog=alarmDao.getAlarm(terminalId);
		Integer isRelieve=0;
		String conditionName=conditionDeviceVo.getName();
		String message=alarmLog.getDeviceName()+"设备"+conditionName+"现已恢复正常，值为"+value;
		alarmDao.updateLog(terminalId,conditionName,date,isRelieve,message);
	}

	@Override
	public void deleteLog(int id) {
		
	}


	@Override
	public AlarmLog getLogById(int logId) {
		return null;
	}


	@Override
	public void updateLog(AlarmLog alarmLog) {
		
	}


	@Override
	public int getAlarmLogById(int logId) {
		return 0;
	}


	@Override
	public List<AlarmLog> getLog() {
		return null;
	}


	@Override
	public void updateDataNum(int count,String terminalId) {
		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(date);// 当天时间
		alarmDao.update(count,time,terminalId);
		
	}




	@Override
	public boolean getAlarmLogByInfo(String terminalId, String date, Double value) {
		int logInfo=alarmDao.getInfo(terminalId,date,value);
		return logInfo==0?true:false;
	}


	@Override
	public boolean judgeRelieveByterminalId(String terminalId,Double value) {
		Integer relieve=alarmDao.getRelieve(terminalId,value);
		return relieve==1?true:false;
	}


	@Override
	public void updateConfirm(String terminalId, Double value, String username) {
		// TODO Auto-generated method stub
		alarmDao.updateConfirm(terminalId, value, username);
	}

}
