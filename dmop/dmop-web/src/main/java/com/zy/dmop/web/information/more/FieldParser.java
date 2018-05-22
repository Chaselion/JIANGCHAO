package com.zy.dmop.web.information.more;

import java.util.Map;

public interface FieldParser {
	void putFieldValue(Map<String, Object> fieldValues, String key, String value);
}
