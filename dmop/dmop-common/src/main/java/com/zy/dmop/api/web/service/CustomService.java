package com.zy.dmop.api.web.service;

import java.util.Date;
import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.Custom;
public interface CustomService {
	public PageResult<Custom> pageQueryCustom(String name,Page page);
	
	Custom createCustom(Custom custom);
	
	void deleteCustom(int id);
	
    Custom getCustomById(int customId);
    
    void updateCustom(Custom custom);

	public int getCustomStateById(int customId);
	
	public List<Custom> getCustoms();
	
	public String getCustomLocation(Integer customId);

	public List<Custom> getExpireTime();

	public void updateState(String time);

}
