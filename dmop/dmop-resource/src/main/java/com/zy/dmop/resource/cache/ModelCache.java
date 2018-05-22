package com.zy.dmop.resource.cache;

import java.util.LinkedHashMap;
import java.util.Map;


public class ModelCache {
	
	private ModelCache(){}
	
	private static Map<String, Map<Integer, Object>> map = new LinkedHashMap<>();
	
	protected static Map<String, Map<Integer, Object>> getCache(){
		return map;
	}
	
	protected static void setMap(Map<String, Map<Integer, Object>> m){
		map = m;
	}
}
