package com.zy.dmop.util;

import java.io.UnsupportedEncodingException;
import java.util.List;

public class StringUtil {
	public static String convertNullToEmpty(String str) {
		return str == null ? "" : str;
	}
	
	public static boolean isNullOrEmpty(String str) {
		return str == null || "".equals(str);
	}
	
	public static String convertCharset(String str, String charset) {  
        try {  
            String dest = new String(str.getBytes("ISO-8859-1"), charset);
            return dest;
        } catch (UnsupportedEncodingException e) {  
            return str;  
        }  
    }

	public static String concat(List<? extends Object> strs, String separator) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < strs.size(); i++) {
			if (i == 0) {
				sb.append(strs.get(i).toString());
			} else {
				sb.append(separator).append(strs.get(i).toString());
			}
		}
		return sb.toString();
	}
}
