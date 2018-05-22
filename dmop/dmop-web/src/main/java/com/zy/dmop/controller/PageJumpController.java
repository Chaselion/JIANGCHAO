package com.zy.dmop.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/pageJump")
public class PageJumpController {

	@RequestMapping(value="/toPage",method = RequestMethod.GET)
	public String toPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		return "up-head";	
	}
	
	@RequestMapping(value="/toModulePage",method = RequestMethod.GET)
	public String toModulePage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		return "NewFile";	
	}
	
	@RequestMapping(value="/toLogin",method = RequestMethod.GET)
	public String tologin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		return "login";	
	}

	@RequestMapping(value="/toUser",method = RequestMethod.GET)
	public String toUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		return "security/user/user";	
	}
	@RequestMapping(value="/toPermissionWarn",method = RequestMethod.GET)
	public String toPermissionWarn(HttpServletRequest request,HttpServletResponse response) throws IOException{
		return "security/permissionWarn";	
	}
	@RequestMapping(value="/toFirstPage",method = RequestMethod.GET)
	public String toFirstPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		return "first_page";	
	}
}
