package com.zy.dmop.parser.information;

import static com.zy.dmop.web.information.more.ProtoUtil.DoubleParser;
import static com.zy.dmop.web.information.more.ProtoUtil.IntegerParser;
import static com.zy.dmop.web.information.more.ProtoUtil.LongParser;
import static com.zy.dmop.web.information.more.ProtoUtil.StringParser;
import static com.zy.dmop.web.information.more.ProtoUtil.FloatParser;
import java.util.Map;

import org.apache.log4j.Logger;

import com.zy.dmop.web.information.more.FieldDesc;
import com.zy.dmop.web.information.more.ProtoUtil;

public class SmokeStateDataEcuParser {
	public static final String KEY_SmokeDetectorNum = "smokeDetectorNum ";//烟感设备编号
	public static final String KEY_SmokeDetectorValue = "smokeDetectorValue";//烟感设备值
	
	public static final String KEY_LogTimeLong = "LogTimeLong";//时间
	public static final String KEY_Longitude = "Longitude";//经度
	public static final String KEY_Latitude = "Latitude";//纬度
	
	private static FieldDesc[] fieldDesc = {	
			new FieldDesc(KEY_SmokeDetectorNum, StringParser),	
			new FieldDesc(KEY_SmokeDetectorValue, DoubleParser),
			new FieldDesc(KEY_LogTimeLong, LongParser),
			new FieldDesc(KEY_Longitude, DoubleParser),
			new FieldDesc(KEY_Latitude, DoubleParser),

		};
		
		public static Map<String, Object> toMap(String fields) {
			return ProtoUtil.parseToMap(fieldDesc, fields);
	    }
}

