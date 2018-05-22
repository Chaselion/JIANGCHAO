package com.zy.dmop.web.information.more.realtime;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.IAlarmDao;
import com.zy.dmop.web.information.more.CarDataCache;

@Component("newRedisListener")
public class NewRedisListener {
	private static Logger log = Logger.getLogger(NewRedisListener.class);
	@Autowired
	private CarDataCache carDataCache;
	
	public static Set<String> redisSetShip;
	
	public static Set<String> redisSetRay;
	

	public static Set<String> getRedisSetRay() {
		return redisSetRay;
	}

	public static void setRedisSetRay(Set<String> redisSetRay) {
		NewRedisListener.redisSetRay = redisSetRay;
	}

	public  Set<String> getRedisSetShip() {
	
		List<String> datas=carDataCache.getPerKey();
		 redisSetShip = new HashSet<String>(datas);
		
		return redisSetShip;
	}

	public static void setRedisSetShip(Set<String> redisSetShip) {
		NewRedisListener.redisSetShip = redisSetShip;
	}
//	定时方法，五秒执行一次；
//	从redis取出实时key的值存入一个全局set
	public void test(){
		//取redis中最新一条key的所有值
		
		List<String> datas=carDataCache.getPerKey();
		 redisSetShip = new HashSet<String>(datas);
				
	}

	
	
	
}
