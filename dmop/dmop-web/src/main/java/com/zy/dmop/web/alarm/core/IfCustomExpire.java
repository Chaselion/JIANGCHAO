package com.zy.dmop.web.alarm.core;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dmop.api.web.service.CustomService;
import com.zy.dmop.api.web.service.UserService;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.vo.UserCustomVo;


public class IfCustomExpire extends Thread {
	@Autowired
	private CustomService customService;
	@Autowired
	private UserService userService;
	public void init() {
		Runnable runnable = new Runnable() {

			@Override
			public void run() {
				//获取客户表中得到期时间集合
				List<Custom> expireTime=customService.getExpireTime();
				//获取当天时间
				Date date=new Date();
				//规范转化时间的格式
				DateFormat format=new SimpleDateFormat("yyyy-MM-dd"); 
				String time=format.format(date);
				
				for (int i = 0; i < expireTime.size(); i++) {
					Calendar t1=Calendar.getInstance();
					Calendar t2=Calendar.getInstance();
					try {
						t1.setTime(expireTime.get(i).getExpireDateTime());
						t2.setTime(format.parse(time));
						
					} catch (ParseException e) {
						e.printStackTrace();
					}
					int result=t1.compareTo(t2);
					if(result<0) {
						String t=format.format(expireTime.get(i).getExpireDateTime());
						customService.updateState(t);
					}
				}
				List<UserCustomVo> usercustom=userService.getUserCustom();
				for (int i = 0; i < usercustom.size(); i++) {
					if(usercustom.get(i).getUserId()!=1){
					Integer a=usercustom.get(i).getCustomstate();
					if(2==a){
						userService.updateUserStatus(usercustom.get(i).getUserId(), 2);
					}
					}
					
				}
				
			} 
		};
		 ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
		// 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  
		long first=60*60*24;
		long again=60*60*24;
		
	    service.scheduleAtFixedRate(runnable, first, again, TimeUnit.SECONDS);  
	}
}
