package com.zy.dmop.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class NumberUtil {
	public static List<Long> toLongs(List<String> sourceDataIds) {
		List<Long> longs = new ArrayList<Long>();
		
		for (String id : sourceDataIds) {
			longs.add(Long.parseLong(id));
		}
		return longs;
	}
	
	public static List<Long> toLongs(String str) {
		List<Long> longs = new ArrayList<Long>();
		if (StringUtil.isNullOrEmpty(str)) {
			return longs;
		}
		
		String[] array = str.split(",");
		for (int i = 0; i < array.length; i++) {
			longs.add(Long.parseLong(array[i]));
		}
		return longs;
	}
	
	public static Set<Integer> toIntegers(String str) {
		Set<Integer> ints = new HashSet<Integer>();
		if (StringUtil.isNullOrEmpty(str)) {
			return ints;
		}
		
		String[] array = str.split(",");
		for (int i = 0; i < array.length; i++) {
			ints.add(Integer.valueOf(array[i]));
		}
		return ints;
	}
	
	public static int parseIntDefault(Object source, int defaultValue) {
		if (source == null) {
			return defaultValue;
		}
		
		try {
			return Integer.parseInt(source.toString());
		} catch (Exception e) {
			return defaultValue;
		}
	}
	
	public static float parseFloatDefault(Object source, float defaultValue) {
		if (source == null) {
			return defaultValue;
		}
		
		try {
			return Float.parseFloat(source.toString());
		} catch (Exception e) {
			return defaultValue;
		}
	}
	
	public static double parseDoubleDefault(Object source, double defaultValue) {
		if (source == null) {
			return defaultValue;
		}
		
		try {
			return Double.parseDouble(source.toString());
		} catch (Exception e) {
			return defaultValue;
		}
	}
	
	public static boolean parseBooleanDefault(Object source, boolean defaultValue) {
		if (source == null) {
			return defaultValue;
		}
		
		try {
			return Boolean.parseBoolean(source.toString());
		} catch (Exception e) {
			return defaultValue;
		}
	}

	
}
