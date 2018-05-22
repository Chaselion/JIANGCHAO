package com.zy.dmop.web.information.more;

import java.util.Map;

public class DoubleFieldParser implements FieldParser {
	@Override
	public void putFieldValue(Map<String, Object> fieldValues, String key, String value) {
		if (!StringUtil.isNullOrEmpty(value)) {
			fieldValues.put(key, new Double(value));
		}
	}
}
