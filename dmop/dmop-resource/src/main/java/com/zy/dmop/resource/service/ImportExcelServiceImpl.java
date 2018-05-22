package com.zy.dmop.resource.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zy.dmop.api.web.dao.ImportExcelDao;
import com.zy.dmop.api.web.service.ImportExcelService;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;
import com.zy.dmop.spring.web.util.ReadTerminalExcel;
import com.zy.dmop.util.CommonMessage;

@Component("importExcel")
@Transactional(propagation=Propagation.REQUIRED)
public class ImportExcelServiceImpl implements ImportExcelService {

	@Autowired
	private ImportExcelDao importExcelDao;

	@Override
	public CommonMessage saveToDb() throws IOException {
		CommonMessage commonMsg = new CommonMessage();
		ReadTerminalExcel xlsMain = new ReadTerminalExcel();
		Terminal terminal = null;
		List<Terminal> list = xlsMain.readXls();
		for (int i = 0; i < list.size(); i++) {
			terminal = list.get(i);
			importExcelDao.excelToDb(terminal);
		}
		commonMsg.setSuccess(true);
		commonMsg.setErrorMessage("上传成功");
		return commonMsg;	
	}

	@Override
	public CommonMessage saveUserToDb() throws IOException{
		CommonMessage commonMsg = new CommonMessage();
		ReadTerminalExcel xlsMain = new ReadTerminalExcel();
		User user = null;
		List<User> list = xlsMain.readUserXls();
		for(int i = 0; i < list.size(); i++){
			user = list.get(i);
			 String regex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
			 Pattern p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$");  
		     Matcher m = p.matcher(user.getMobilePhone());;  
		     boolean mobile = m.matches();  
			 boolean email=Pattern.matches(regex, user.getEmail());

		      if(email!=true){
		    	    int a=i+2;
		    	    commonMsg.setSuccess(false);
					commonMsg.setErrorMessage("第"+a+"行数据邮箱格式有误，上传失败！");
					return commonMsg;
		      }
		      if(mobile!=true){
		    	    int a=i+2;
		    	    commonMsg.setSuccess(false);
					commonMsg.setErrorMessage("第"+a+"行数据电话格式有误，上传失败！");
					return commonMsg;
		      }
		}
		for (int i = 0; i < list.size(); i++) {
			user = list.get(i);
			importExcelDao.excelUserToDb(user);
		}
		commonMsg.setSuccess(true);
		commonMsg.setErrorMessage("上传成功");
		return commonMsg;
	}

	@Override
	public CommonMessage saveCustomToDb() throws IOException, SQLException {
		CommonMessage commonMsg = new CommonMessage();
		ReadTerminalExcel xlsMain = new ReadTerminalExcel();
		Custom custom = null;
		List<Custom> list = xlsMain.readCustomXls();
		for (int i = 0; i < list.size(); i++) {
			custom = list.get(i);
			 Pattern p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$");  
		     Matcher m = p.matcher(custom.getLinkManPhone()); 
		     boolean mobile = m.matches();
		      if(mobile!=true){
		    	    int a=i+2;
		    	    commonMsg.setSuccess(false);
					commonMsg.setErrorMessage("第"+a+"行数据电话格式有误，上传失败！");
					return commonMsg;
		      }
		}
		for (int i = 0; i < list.size(); i++) {
			custom = list.get(i);
			importExcelDao.excelCustomToDb(custom);
		}
		commonMsg.setSuccess(true);
		commonMsg.setErrorMessage("上传成功");
		return commonMsg;
	}

	@Override
	public CommonMessage saveOrgToDb() throws IOException, SQLException {
		CommonMessage commonMsg = new CommonMessage();
		ReadTerminalExcel xlsMain = new ReadTerminalExcel();
		Organization organization = null;
		List<Organization> list = xlsMain.readOrgXls();
		for (int i = 0; i < list.size(); i++) {
			organization = list.get(i);
			importExcelDao.excelOrgToDb(organization);
		}
		commonMsg.setSuccess(true);
		commonMsg.setErrorMessage("上传成功");
		return commonMsg;
	}

}
