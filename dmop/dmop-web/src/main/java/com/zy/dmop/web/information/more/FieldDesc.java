package com.zy.dmop.web.information.more;

public class FieldDesc {
	private String key;
	private FieldParser fieldParser;
	
	public FieldDesc(String key, FieldParser fieldParser) {
		super();
		this.key = key;
		this.fieldParser = fieldParser;
	}
	
	public String getKey() {
		return key;
	}
	public FieldParser getFieldParser() {
		return fieldParser;
	}
}
