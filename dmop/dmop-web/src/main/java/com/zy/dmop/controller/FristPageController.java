package com.zy.dmop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.security.service.UserPermissionService;
import com.zy.dmop.model.vo.PermissionVo;



@Controller
@RequestMapping("/firstPage")
public class FristPageController {

	@Autowired
	private UserPermissionService userPermissionService;
	
	@RequestMapping(value="/getData", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> firstPage(){
		Map<String, Object> map = new HashMap<String, Object>();
	    List<PermissionVo> list = userPermissionService.getModuleTree();
	    Subject subject = SecurityUtils.getSubject();
	    List<PermissionVo> checked = filterNotPermitted(list,subject);
	    userPermissionService.print(checked, "");
	    map.put("menuModule", checked);
		   return map;
	} 
	
	@RequestMapping(value="/getModuleData", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> SecondPage(){
		Map<String, Object> map = new HashMap<String, Object>();
	       List<PermissionVo> rootModules = userPermissionService.getModuleTree();
	       Subject subject = SecurityUtils.getSubject();
	       List<PermissionVo> checked = filterNotPermitted(rootModules,subject);
	       userPermissionService.print(checked, "");
	       map.put("menuModule", checked);
		   return map;
	}
	
	private List<PermissionVo> filterNotPermitted(List<PermissionVo> rootModules, Subject subject) {
		List<PermissionVo> permitted = new ArrayList<PermissionVo>();
		if(!SecurityUtils.getSubject().isAuthenticated()){
			return rootModules;
		}

		for (PermissionVo vo : rootModules) {
			// 只加入拥有show权限的Module
			if (subject.isPermitted(vo.generatePermission("show"))) {
				List<PermissionVo> permittedChildren = filterNotPermitted(vo.getChildren(), subject);

				vo.setChildren(permittedChildren);

				permitted.add(vo);
			}
		}

		return permitted;
	}
}
