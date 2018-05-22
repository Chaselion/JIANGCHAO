package com.zy.dmop.resource.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.CustomDao;
import com.zy.dmop.api.web.service.CustomService;
import com.zy.dmop.model.Custom;



@Component("customService")
@Transactional(propagation=Propagation.REQUIRED)
public class CustomServiceImpl implements CustomService {
	@Autowired
	private CustomDao customDao;
	@Override
	public PageResult<Custom> pageQueryCustom(String name,Page page) throws ErrorMessageException {

		PageResult<Custom> pageResult;
		// page.setCount(0);
		// return new PageResult<AlarmJoinData>(page, new ArrayList<AlarmJoinData>());

		pageResult = customDao.pageQueryCustom(name,page);

		/*
		 * if (pageResult.getData().isEmpty()) { return pageResult; }
		 * 
		 * patchEntityNameAndTypeName(user.getTenantId(), pageResult.getData());
		 */

		return pageResult;
	}

	@Override
	public Custom createCustom(Custom custom) {
		// TODO Auto-generated method stub
		return customDao.createCustom(custom);
	}

	@Override
	public void deleteCustom(int id) {
		// TODO Auto-generated method stub
		 customDao.deleteCustom(id);
	}

	@Override
	public Custom getCustomById(int customId) {
		// TODO Auto-generated method stub
		return customDao.getCustomById(customId);
	}

	@Override
	public void updateCustom(Custom custom) {
		// TODO Auto-generated method stub
		 customDao.updateCustom(custom);
		
	}

	@Override
	public int getCustomStateById(int customId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Custom> getCustoms() {
		// TODO Auto-generated method stub
		return customDao.getCustoms();
	}

	@Override
	public String getCustomLocation(Integer customId) {
		// TODO Auto-generated method stub
		return customDao.getCustomLocation(customId);
	}

	@Override
	public List<Custom> getExpireTime() {
		// TODO Auto-generated method stub
		return customDao.getExpireTime();
	}

	@Override
	public void updateState(String time) {
		customDao.updateState(time);
		
	}

}
