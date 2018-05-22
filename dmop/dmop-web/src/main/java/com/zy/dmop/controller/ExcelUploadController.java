package com.zy.dmop.controller;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.zy.dmop.api.filestore.service.IFileStoreService;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.ImportExcelService;
import com.zy.dmop.api.web.service.OperateLogService;
import com.zy.dmop.model.User;
import com.zy.dmop.util.CommonMessage;




	@Controller
	@RequestMapping("/excel")
	
	public class ExcelUploadController {
		private static Logger log = Logger.getLogger(ExcelUploadController.class);
		@Autowired
		private OperateLogService operateLogService;
		@Autowired
		private IFileStoreService fileStoreService;
		
		@Resource(name="importExcel")
		private ImportExcelService importExcelService;

		private CommonsMultipartResolver multipartResolver;

		public void setMultipartResolver(CommonsMultipartResolver multipartResolver) {
			this.multipartResolver = multipartResolver;
		}

		@RequiresPermissions(value="System.TenantMgmt.Tenant.import")
		@RequestMapping(value = "/add",method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> add(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			CommonMessage commonMsg = new CommonMessage();
			//returnMap.put("commonMessage", commonMsg);
			User loginUser = SessionUtil.getCommonUserFromSession();
			/*if (loginUser.getUserType() != UserType.TENANT) {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage(MessageConst.ERRORMSG_UNAUTHORIZED);
				return returnMap;
			}*/
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			/*
			 * 给传过来的照片起个统一的名字，spring自动封装参数的照片名字是客户的文件名。
			 */
			String filePath = "excel" + File.separator +  "info";
			fileStoreService.mkdir(filePath);
			String filename = filePath+File.separator +"excelTest.xls";
			try {
				if(this.multipartResolver!=null&&this.multipartResolver.isMultipart(request)){
					if(request instanceof MultipartHttpServletRequest){
						MultipartHttpServletRequest multipartRequest =	(MultipartHttpServletRequest)request;
						MultipartFile excelfile = multipartRequest.getFile("fileToUpload");
						String s=multipartRequest.getParameter("table");
						response.setHeader("ContentType", "json");
						try {
							saveExcel(filename, excelfile.getInputStream());
							CommonMessage commonMsga=importExcelService.saveToDb();
							returnMap.put("commonMessage", commonMsga);
						} catch (IOException e) {
							commonMsg.setSuccess(false);
							commonMsg.setErrorMessage("上传表格失败，请检查网络");
							returnMap.put("commonMessage", commonMsg);
							e.printStackTrace();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			User loguser=new User();
			loguser.setUserId(loginUser.getUserId());
			loguser.setCustomId(loginUser.getCustomId());
			String content="终端";
			operateLogService.addImport(loguser, content);
			return returnMap;
		}
		@RequiresPermissions(value="System.SecurityMgmt.User.import")
		@RequestMapping(value = "/adduser",method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> adduser(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			CommonMessage commonMsg = new CommonMessage();
			//returnMap.put("commonMessage", commonMsg);
			User loginUser = SessionUtil.getCommonUserFromSession();
			
			/*if (loginUser.getUserType() != UserType.TENANT) {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage(MessageConst.ERRORMSG_UNAUTHORIZED);
				return returnMap;
			}*/
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			/*
			 * 给传过来的照片起个统一的名字，spring自动封装参数的照片名字是客户的文件名。
			 */
			String filePath = "excel" + File.separator +  "info";
			fileStoreService.mkdir(filePath);
			String filename = filePath+File.separator +"excelTest.xls";
			try {
				if(this.multipartResolver!=null&&this.multipartResolver.isMultipart(request)){
					if(request instanceof MultipartHttpServletRequest){
						MultipartHttpServletRequest multipartRequest =	(MultipartHttpServletRequest)request;
						MultipartFile excelfile = multipartRequest.getFile("fileToUpload");
						String s=multipartRequest.getParameter("table");
						response.setHeader("ContentType", "json");
						try {
							saveExcel(filename, excelfile.getInputStream());		
							CommonMessage commonMsga=importExcelService.saveUserToDb();
							returnMap.put("commonMessage", commonMsga);
						} catch (IOException e) {
							commonMsg.setSuccess(false);
							commonMsg.setErrorMessage("上传表格失败，请检查网络");
							returnMap.put("commonMessage", commonMsg);
							e.printStackTrace();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			User loguser=new User();
			loguser.setUserId(loginUser.getUserId());
			loguser.setCustomId(loginUser.getCustomId());
			String content="用户";
			operateLogService.addImport(loguser, content);
			return returnMap;
		}
		
		@RequiresPermissions(value="System.SecurityMgmt.Role.import")
		@RequestMapping(value = "/addcustom",method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> addcustom(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			CommonMessage commonMsg = new CommonMessage();
			//returnMap.put("commonMessage", commonMsg);
			User loginUser = SessionUtil.getCommonUserFromSession();
			
			/*if (loginUser.getUserType() != UserType.TENANT) {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage(MessageConst.ERRORMSG_UNAUTHORIZED);
				return returnMap;
			}*/
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			/*
			 * 给传过来的照片起个统一的名字，spring自动封装参数的照片名字是客户的文件名。
			 */
			String filePath = "excel" + File.separator +  "info";
			fileStoreService.mkdir(filePath);
			String filename = filePath+File.separator +"excelTest.xls";
			try {
				if(this.multipartResolver!=null&&this.multipartResolver.isMultipart(request)){
					if(request instanceof MultipartHttpServletRequest){
						MultipartHttpServletRequest multipartRequest =	(MultipartHttpServletRequest)request;
						MultipartFile excelfile = multipartRequest.getFile("fileToUpload");
						String s=multipartRequest.getParameter("table");
						response.setHeader("ContentType", "json");
						try {
							saveExcel(filename, excelfile.getInputStream());
							CommonMessage commonMsga=importExcelService.saveCustomToDb();
							returnMap.put("commonMessage", commonMsga);		
	
						} catch (IOException e) {
							commonMsg.setSuccess(false);
							commonMsg.setErrorMessage("上传表格失败，请检查网络");
							returnMap.put("commonMessage", commonMsg);
							e.printStackTrace();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			User loguser=new User();
			loguser.setUserId(loginUser.getUserId());
			loguser.setCustomId(loginUser.getCustomId());
			String content="客户";
			operateLogService.addImport(loguser, content);
			return returnMap;
		}
		@RequiresPermissions(value="System.SecurityMgmt.Ani.import")
		@RequestMapping(value = "/addorganization",method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> addorganization(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			CommonMessage commonMsg = new CommonMessage();
			//returnMap.put("commonMessage", commonMsg);
			User loginUser = SessionUtil.getCommonUserFromSession();
			
			/*if (loginUser.getUserType() != UserType.TENANT) {
				commonMsg.setSuccess(false);
				commonMsg.setErrorMessage(MessageConst.ERRORMSG_UNAUTHORIZED);
				return returnMap;
			}*/
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			/*
			 * 给传过来的照片起个统一的名字，spring自动封装参数的照片名字是客户的文件名。
			 */
			String filePath = "excel" + File.separator +  "info";
			fileStoreService.mkdir(filePath);
			String filename = filePath+File.separator +"excelTest.xls";
			try {
				if(this.multipartResolver!=null&&this.multipartResolver.isMultipart(request)){
					if(request instanceof MultipartHttpServletRequest){
						MultipartHttpServletRequest multipartRequest =	(MultipartHttpServletRequest)request;
						MultipartFile excelfile = multipartRequest.getFile("fileToUpload");
						String s=multipartRequest.getParameter("table");
						response.setHeader("ContentType", "json");
						try {
							saveExcel(filename, excelfile.getInputStream());
							CommonMessage commonMsga=importExcelService.saveOrgToDb();
							returnMap.put("commonMessage", commonMsga);
									
	
						} catch (IOException e) {
							commonMsg.setSuccess(false);
							commonMsg.setErrorMessage("上传表格失败，请检查网络");
							returnMap.put("commonMessage", commonMsg);
							e.printStackTrace();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			User loguser=new User();
			loguser.setUserId(loginUser.getUserId());
			loguser.setCustomId(loginUser.getCustomId());
			String content="组织";
			operateLogService.addImport(loguser, content);
			return returnMap;
		}

		private void saveExcel(String path, InputStream in) throws IOException {
			try {
				fileStoreService.writeFile(path, in);
			} finally {
				in.close();
			}
		}
		
		
		
	

}
