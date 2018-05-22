package com.zy.dmop.spring.web.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.zy.dmop.model.Custom;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;

public class ReadTerminalExcel {
	public static final String EXCEL_PATH = "e:\\excelTest.xlsx";

		public List<Terminal> readXls() throws IOException {
			//括号里面配置表格的地址
			InputStream address = new FileInputStream(EXCEL_PATH);
			XSSFWorkbook xssfWorkbook=new XSSFWorkbook(address);
			Terminal terminal = null;
			List<Terminal> list = new ArrayList<Terminal>();
			for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
				XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
				if (xssfSheet == null) {
					continue;
				}
				
				for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
					XSSFRow xssfRow = xssfSheet.getRow(rowNum);
					if (xssfRow != null) {
						terminal = new Terminal();
						XSSFCell terminalNum = xssfRow.getCell(0);
						XSSFCell terminalName = xssfRow.getCell(1);
						XSSFCell firewareVersion = xssfRow.getCell(2);
						
						try {
							terminal.setTerminalNum(String.valueOf(getValue(terminalNum)));
							terminal.setTerminalName(String.valueOf(getValue(terminalName)));
							terminal.setFirewareVersion(String.valueOf(getValue(firewareVersion)));
						} catch (NumberFormatException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						list.add(terminal);
					}
				}
			}
			return list;
		}
		
		
		public List<User> readUserXls() throws IOException {
			//括号里面配置表格的地址
			InputStream address = new FileInputStream(EXCEL_PATH);
			XSSFWorkbook xssfWorkbook=new XSSFWorkbook(address);
			User user = null;
			List<User> list = new ArrayList<User>();
			for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
				XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
				if (xssfSheet == null) {
					continue;
				}
				
				for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
					XSSFRow xssfRow = xssfSheet.getRow(rowNum);
					if (xssfRow != null) {
						user = new User();
						XSSFCell name = xssfRow.getCell(0);
						XSSFCell realname = xssfRow.getCell(1);
						XSSFCell phone = xssfRow.getCell(2);
						XSSFCell email = xssfRow.getCell(3); 

						try {
							user.setUsername(String.valueOf(getValue(name)));
							user.setRealname(String.valueOf(getValue(realname)));
							user.setMobilePhone(String.valueOf(getValue(phone)));
							
							user.setEmail(String.valueOf(getValue(email)));
						} catch (NumberFormatException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						list.add(user);
					}
				}
			}
			return list;
		}
		
		public List<Custom> readCustomXls() throws IOException {
			//括号里面配置表格的地址
			InputStream address = new FileInputStream(EXCEL_PATH);
			XSSFWorkbook xssfWorkbook=new XSSFWorkbook(address);
			Custom custom = null;
			List<Custom> list = new ArrayList<Custom>();
			for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
				XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
				if (xssfSheet == null) {
					continue;
				}
				
				for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
					XSSFRow xssfRow = xssfSheet.getRow(rowNum);
					if (xssfRow != null) {
						custom = new Custom();
						XSSFCell name = xssfRow.getCell(0);
						XSSFCell linkname = xssfRow.getCell(1);
						XSSFCell phone = xssfRow.getCell(2);
						XSSFCell location = xssfRow.getCell(3); 
						//XSSFCell firewareVersion = xssfRow.getCell(4);
						
						try {
							custom.setName(String.valueOf(getValue(name)));
							custom.setLinkManName(String.valueOf(getValue(linkname)));
							custom.setLinkManPhone(String.valueOf(getValue(phone)));
							
							custom.setLocation(String.valueOf(getValue(location)));
						} catch (NumberFormatException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						list.add(custom);
					}
				}
			}
			return list;
		}
		
		public List<Organization> readOrgXls() throws IOException {
			//括号里面配置表格的地址
			InputStream address = new FileInputStream(EXCEL_PATH);
			XSSFWorkbook xssfWorkbook=new XSSFWorkbook(address);
			Organization organization = null;
			List<Organization> list = new ArrayList<Organization>();
			for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
				XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
				if (xssfSheet == null) {
					continue;
				}
				
				for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
					XSSFRow xssfRow = xssfSheet.getRow(rowNum);
					if (xssfRow != null) {
						organization = new Organization();
						XSSFCell name = xssfRow.getCell(0);
						XSSFCell dec = xssfRow.getCell(1);
					
						//XSSFCell firewareVersion = xssfRow.getCell(4);
						
						try {
							organization.setName(String.valueOf(getValue(name)));
							organization.setDescription(String.valueOf(getValue(dec)));
					
						} catch (NumberFormatException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						list.add(organization);
					}
				}
			}
			return list;
		}
		

		@SuppressWarnings("static-access")
		private String getValue(XSSFCell xssfCell) {
		        if (xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN) {
		            // ���ز������͵�ֵ
		            return String.valueOf(xssfCell.getBooleanCellValue());
		        } else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC) {
		        	Object inputValue = null;// 单元格值
		            Long longVal = Math.round(xssfCell.getNumericCellValue());
		            Double doubleVal = xssfCell.getNumericCellValue();
		            if(Double.parseDouble(longVal + ".0") == doubleVal){   //判断是否含有小数位.0
		                inputValue = longVal;
		            }
		            else{
		                inputValue = doubleVal;
		            }
		            DecimalFormat df = new DecimalFormat("#.####");    //格式化为四位小数，按自己需求选择；
		            return String.valueOf(df.format(inputValue));      //返回String类型
		            //return String.valueOf(xssfCell.getNumericCellValue());
		        } else {
		            // �����ַ������͵�ֵ
		            return String.valueOf(xssfCell.getStringCellValue());
		        }
		    }
	

}
