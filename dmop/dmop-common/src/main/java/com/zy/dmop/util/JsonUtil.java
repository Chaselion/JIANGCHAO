package com.zy.dmop.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider;

@SuppressWarnings("unchecked")
public class JsonUtil {
	public static List<Object> parseJsonList(String json) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(json, List.class);
	}
	
	public static Map<String, Object> parseJsonMap(String json) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(json, Map.class);
	}
	
	public static String objectToString(Object obj) throws IOException {
		StringWriter sw = new StringWriter();
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(sw, obj);
		return sw.toString();
	}
	
	@SuppressWarnings("deprecation")
	public static String beanToJson(Object obj, String filterId, Set<String> properties) throws IOException {
		StringWriter sw = new StringWriter();
		
		ObjectMapper mapper = new ObjectMapper();
		FilterProvider filterProvider = new SimpleFilterProvider().addFilter(filterId,  
                SimpleBeanPropertyFilter.serializeAllExcept(properties));  
		mapper.setFilters(filterProvider);  
		mapper.writeValue(sw, obj);
		return sw.toString();
	}
	
	public static <T> T jsonToBean(String json, Class<T> valueType) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(json, valueType);
	}
}
