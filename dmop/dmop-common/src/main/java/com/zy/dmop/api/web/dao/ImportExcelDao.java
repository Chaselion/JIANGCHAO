package com.zy.dmop.api.web.dao;

import com.zy.dmop.model.Custom;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;

public interface ImportExcelDao {
	//插入表格数据
	public int excelToDb(Terminal terminal);
	
	public int excelUserToDb(User user);
	
	public int excelCustomToDb(Custom custom);
	
	public int excelOrgToDb(Organization organization);
}
