package com.zy.dmop.api.web.service;

import java.io.IOException;
import java.sql.SQLException;

import com.zy.dmop.util.CommonMessage;

public interface ImportExcelService {
	//存储数据到
	public CommonMessage saveToDb() throws IOException,SQLException;
	
	public CommonMessage saveUserToDb() throws IOException,SQLException;
	
	public CommonMessage saveCustomToDb() throws IOException,SQLException;
	
	public CommonMessage saveOrgToDb() throws IOException,SQLException;
	
}
