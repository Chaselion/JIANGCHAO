package com.zy.dmop.web.information.more;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;


public class ProtoUtil {
	private static Logger log = Logger.getLogger(ProtoUtil.class);
	public static final FieldParser ShortParser = new ShortFieldParser();
	public static final FieldParser IntegerParser = new IntegerFieldParser();
	public static final FieldParser FloatParser = new FloatFieldParser();
	public static final FieldParser LongParser = new LongFieldParser();
	public static final FieldParser DoubleParser = new DoubleFieldParser();
	public static final FieldParser StringParser = new StringFieldParser();
	
	public static Map<String, Object> parseToMap(FieldDesc[] fieldDescs, String fields) {
		if (fields == null) {
			return null;
		}
		
		Map<String, Object> fieldValues = new HashMap<String, Object>();
    	String[] fieldArr = fields.split(",");
    	for (int i = 0; i < fieldArr.length; i++) {
    		fieldDescs[i].getFieldParser().putFieldValue(fieldValues, fieldDescs[i].getKey(), fieldArr[i]);
		}
    	return fieldValues;
	}
}
