package com.zy.dmop.resource.cache;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

/**
 * @author Administrator
 *
 */
public class ConfigCache {
	
	private ConfigCache(){}
	
	private static Map<String, Map<String, JSONObject>> map = new HashMap<String, Map<String,JSONObject>>();
	
	protected static Map<String, Map<String, JSONObject>> getCache(){
		return map;
	}
	
	protected static void setMap(Map<String, Map<String, JSONObject>> m){
		map = m;
	}
}
