package com.zy.dmop.resource.alarm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmConditionDao;
import com.zy.dmop.api.alarm.service.AlarmConditionService;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.model.vo.ConditionProperityVo;
@Component("alarmConditionService")
public class AlarmConditionServiceImpl implements AlarmConditionService {
	@Autowired
	private AlarmConditionDao alarmConditionDao;
	@Override
	public PageResult<ConditionDeviceVo> pageQueryAlarm(Page page) throws ErrorMessageException {
		PageResult<ConditionDeviceVo> pageResult;
		pageResult = alarmConditionDao.pageQueryAlarm(page);
		return pageResult;
	}

	@Override
	public AlarmCondition createCondition(AlarmCondition alarmCondition) {
		return alarmConditionDao.createCondition(alarmCondition);
	}

	@Override
	public void deleteCondition(int conditionId) {
		alarmConditionDao.deleteCondition(conditionId);
	}

/*	@Override
	public AlarmCondition getConditionById(int conditionId) {
		return alarmConditionDao.getAlarmConditionById(conditionId);
	}*/

	@Override
	public void updateCondition(AlarmCondition alarmCondition) {
		alarmConditionDao.updateCondition(alarmCondition);
	}

	@Override
	public AlarmCondition getAlarmConditionById(int conditionId) {
	    return alarmConditionDao.getAlarmConditionById(conditionId);
	}

	@Override
	public List<AlarmCondition> getLevel() {
		return alarmConditionDao.getCondition();
	}

	@Override
	public List<AlarmCondition> getConditionNameByIfActive(int strategyId) {
		// TODO Auto-generated method stub
		return alarmConditionDao.getConditionNameByIfActive(strategyId);
	}

	@Override
	public List<AlarmCondition> getALLByIds(List<ConditionStrategy> conditionIds) {
		List<AlarmCondition> alarmCondition=new ArrayList<AlarmCondition>();
		for (int i = 0; i < conditionIds.size(); i++) {
			int conditionId=conditionIds.get(i).getAlarmConditioId();
			alarmCondition=alarmConditionDao.getAllByIds(conditionId);
		}
		return alarmCondition;
	}

	@Override
	public List<Integer> getDeviceProIds(List<ConditionStrategy> conditionIds) {
		
		return 	alarmConditionDao.getDeviceProIds(conditionIds);

	}

	@Override
	public List<AlarmCondition> getALLByProIds(String engName) {
		int properityId=alarmConditionDao.getProPerityIdByName(engName);
		return alarmConditionDao.getAllByProId(properityId);
	}

	@Override
	public List<ConditionProperityVo> getConDeviceVo(Integer conditionId) {
		return alarmConditionDao.getConDeviceVo(conditionId);
	}

}
