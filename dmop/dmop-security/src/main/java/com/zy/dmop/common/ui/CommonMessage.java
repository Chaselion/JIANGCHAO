package com.zy.dmop.common.ui;

import java.util.HashMap;
import java.util.Map;

import com.zy.dmop.util.StringUtil;


public class CommonMessage {
	private boolean success;
	private String message;
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return StringUtil.convertNullToEmpty(message);
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Map<String, Object> toMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", isSuccess());
		map.put("message", getMessage());
		
		return map;
	}
}
