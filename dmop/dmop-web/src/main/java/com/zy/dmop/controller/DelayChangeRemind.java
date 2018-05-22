package com.zy.dmop.controller;

import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.web.alarm.core.AppDataCacheService;
@Component("delayChangeRemind")
public class DelayChangeRemind {
	@Autowired
	private AppDataCacheService appDataCacheService;
	public  void changeRemind(String key,String organizationId,
			String terminalId,String property,String value,String remind) {  
        Timer timer = new Timer();// 实例化Timer类  
        timer.schedule(new TimerTask() {  
            public void run() {  
            	appDataCacheService.addChangeRimindCache(key,
        				organizationId,terminalId,property,value,remind);
                  
            }  
        }, 5000*60);// 这里百毫秒  
        System.out.println("本程序存在5分钟后自动退出");  
    }  

}
