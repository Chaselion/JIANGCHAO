package com.zy.dmop.servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.CustomService;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.api.web.service.UserService;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.User;

public class customDownload extends HttpServlet{
	private static Logger log = Logger.getLogger(customDownload.class);

	// 存放excel中文比表头
	private static final String[] CSV_HEADERS = new String[] { "客户名称", "联系人", "联系方式", "客户类别" ,"客户地区","状态","备注","加入时间","到期时间","修改时间"}; //改动一
	
	private OperateLogService operateLogService;
	private CustomService customService;   //改动二

	public void init(ServletConfig servletConfig) throws ServletException {
		ServletContext servletContext = servletConfig.getServletContext();
		WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		this.customService = (CustomService) webApplicationContext.getBean("customService");  //改动三
		this.operateLogService = (OperateLogService) webApplicationContext.getBean("operateLogService");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Subject subject = SecurityUtils.getSubject();
		boolean permitted = subject.isPermitted("System.SecurityMgmt.Role.export");
		if(permitted){
			LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
			for (int i = 0; i < CSV_HEADERS.length; i++) {
				map.put(String.valueOf(i), CSV_HEADERS[i]);
			}
		
			List<Custom> data=customService.getCustoms();  //改动四
			String filePath = request.getSession().getServletContext().getRealPath(request.getRequestURI().split("/")[2]) + File.separator;
			File file = createCSVFile(data, map, filePath, "tempCsv");// 生成CSV文件
			String fileName = file.getName();
			exportFile(response, filePath + fileName, "alarmQuery_" );// 下载生成的CSV文件
			deleteFile(filePath, fileName);
			deleteFiles(filePath);
			User loguser=new User();
			User loginUser = SessionUtil.getCommonUserFromSession();
			loguser.setUserId(loginUser.getUserId());
			loguser.setOrganizationId(loginUser.getOrganizationId());
			String content="客户";
			operateLogService.addExport(loguser, content);
		}else{
			response.sendRedirect("custom/role.jsp");  
		}
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
                                          //改动五
	public static File createCSVFile(List<Custom> exportData, LinkedHashMap<String, String> map, String outPutPath, String fileName) {
		File csvFile = null;
		BufferedWriter csvFileOutputStream = null;
		try {
			File file = new File(outPutPath);
			if (!file.exists()) {
				file.mkdir();
			}
			// 定义文件名格式并创建
			csvFile = File.createTempFile(fileName, ".csv", new File(outPutPath));
			// UTF-8使正确读取分隔符","
			csvFileOutputStream = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(csvFile), "GBK"), 1024);
			// 写入文件头部
			for (Iterator propertyIterator = map.entrySet().iterator(); propertyIterator.hasNext();) {
				java.util.Map.Entry propertyEntry = (java.util.Map.Entry) propertyIterator.next();
				csvFileOutputStream.write("" + (String) propertyEntry.getValue() != null ? (String) propertyEntry.getValue() : "" + "");
				if (propertyIterator.hasNext()) {
					csvFileOutputStream.write(",");
				}
			}
			csvFileOutputStream.newLine();
			// 写入文件内容
			for (int i = 0; i < exportData.size(); i++) {
				String a=exportData.get(i).toStrings();
				if(a.contains("null")){
					String b=a.replace("null", "");
				csvFileOutputStream.write(b + ",");
				csvFileOutputStream.newLine();
				}else{csvFileOutputStream.write(exportData.get(i).toStrings() + ",");
				csvFileOutputStream.newLine();
				}
			}
			csvFileOutputStream.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				csvFileOutputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return csvFile;
	}

	/**
	 * 下载文件
	 * 
	 * @param response
	 * @param csvFilePath
	 *            文件路径
	 * @param fileName
	 *            文件名称
	 * @throws IOException
	 */
	public static void exportFile(HttpServletResponse response, String csvFilePath, String fileName) throws IOException {
		InputStream is = null;
		try {
			File f = new File(csvFilePath);
			int len = (int) f.length();
			if (len <= 0) {
				// responseErrorJson(resp, os, "rundataimage_file_corrupted");
				return;
			}
			response.setContentType("application/octet-stream;charset=UTF-8");

			fileName = "CustomQuery_" + System.currentTimeMillis(); // xh to be
																	// updated
			response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName + ".csv", "UTF-8"));

			response.setContentLength(len);
			is = new FileInputStream(f);

			byte[] buf = new byte[1024];
			response.setCharacterEncoding("UTF-8");
			ServletOutputStream os = response.getOutputStream();
			while ((len = is.read(buf)) > 0) {
				os.write(buf, 0, len);
			}
			os.flush();
		} catch (FileNotFoundException e) {
			log.error(e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
		}
	}

	/**
	 * 删除该目录filePath下的所有文件
	 * 
	 * @param filePath
	 *            文件目录路径
	 */
	public static void deleteFiles(String filePath) {
		File file = new File(filePath);
		if (file.exists()) {
			File[] files = file.listFiles();
			for (int i = 0; i < files.length; i++) {
				if (files[i].isFile()) {
					files[i].delete();
				}
			}
		}
	}

	/**
	 * 删除单个文件
	 * 
	 * @param filePath
	 *            文件目录路径
	 * @param fileName
	 *            文件名称
	 */
	public static void deleteFile(String filePath, String fileName) {
		File file = new File(filePath);
		if (file.exists()) {
			File[] files = file.listFiles();
			for (int i = 0; i < files.length; i++) {
				if (files[i].isFile()) {
					if (files[i].getName().equals(fileName)) {
						files[i].delete();
						return;
					}
				}
			}
		}
	}

}
