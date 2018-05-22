package com.zy.dmop.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.resource.cache.CacheConfigue;

@Controller
@RequestMapping("/system")
public class SystemController {
	
	@Autowired
	CacheConfigue c;
	
	@RequestMapping(value="/reloadCache",method=RequestMethod.GET)
	@ResponseBody
	public String createCondition() throws Exception {
		c.reloadCache();
		return "success";
	}
}
