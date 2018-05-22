package com.zy.dmop.api.web.dao;

import java.util.Date;
import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.User;

public interface CustomDao {
	public Custom createCustom(Custom custom);

	public Custom getCustom();

	public void deleteCustom(int id);

	public void updateCustom(Custom custom);
	
	public PageResult<Custom> pageQueryCustom(String name,Page page);
	
	//获取所有客户缓存
	public List<Custom> getAllUserForCache();
	
	public Custom getCustomById(int customId);
	
	public List<Custom> getCustoms();
	
	public String getCustomLocation(Integer customId);

	public List<Custom> getExpireTime();

	public void updateState(String time);

}
