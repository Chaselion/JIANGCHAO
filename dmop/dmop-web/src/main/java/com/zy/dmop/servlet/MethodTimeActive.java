package com.zy.dmop.servlet;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.lang.time.StopWatch;
import org.apache.log4j.Logger;

import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;

public class MethodTimeActive implements MethodInterceptor {
	
	private static Logger log = Logger.getLogger(MethodTimeActive.class);
	
    /**
     * 自定义map集合，key：方法名，value：[0：运行次数，1：总时间]
     */
    public static Map<String,Long[]> methodTest = new HashMap<String, Long[]>();
    /**
     * 拦截要执行的方法
     */
    public Object invoke(MethodInvocation invocation) throws Throwable {
        // 创建一个计时器
        StopWatch watch = new StopWatch();
        // 计时器开始
        watch.start(); 
        // 执行方法
        Object object = invocation.proceed();
        // 计时器停止
        watch.stop();
        // 方法名称
        String methodName = invocation.getMethod().getName();
        // 获取计时器计时时间
        Long time = watch.getTime();
        String value = CacheUtil.getConfigValue(CacheConstant.CONFIG_SYSTEM, "show_dao_test", "value");
        if("true".equals(value)) {
        	log.info(invocation.getMethod().getDeclaringClass()+"_"+methodName+":"+time);
        }
        return object;
    }
    
    public void testMethodActive() {
        Map<String, Long[]> map = MethodTimeActive.methodTest;
        Set<String> set = map.keySet();
        Long[] x = null;
        for(String s : set) {
            x = map.get(s);
            System.out.println(s+":"+x[0]+"次，"+x[1]+"毫秒");
        }
    }
    
}
