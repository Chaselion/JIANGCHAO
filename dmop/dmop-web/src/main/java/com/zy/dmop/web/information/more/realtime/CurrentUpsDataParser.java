package com.zy.dmop.web.information.more.realtime;



import java.util.Map;

import org.apache.log4j.Logger;
import static com.zy.dmop.web.information.more.ProtoUtil.DoubleParser;
import static com.zy.dmop.web.information.more.ProtoUtil.IntegerParser;
import static com.zy.dmop.web.information.more.ProtoUtil.LongParser;
import static com.zy.dmop.web.information.more.ProtoUtil.StringParser;
import static com.zy.dmop.web.information.more.ProtoUtil.FloatParser;
import com.zy.dmop.web.information.more.FieldDesc;
import com.zy.dmop.web.information.more.ProtoUtil;



public class CurrentUpsDataParser {
	private static Logger log = Logger.getLogger(CurrentUpsDataParser.class);
	
	public static final String KEY_terminalID = "terminalId";
	public static final String KEY_parameterA = "paramA";
	public static final String KEY_parameterB = "paramB";
	public static final String KEY_parameterC = "paramC";
	public static final String KEY_logtime = "logtime";
	public static final String KEY_longitude = "longitude";//经度
	public static final String KEY_latitude = "latitude";//纬度

	
	private static FieldDesc[] fieldDesc = {
			new FieldDesc(KEY_terminalID, StringParser),
			new FieldDesc(KEY_parameterA, StringParser),
			new FieldDesc(KEY_parameterB, StringParser),
			new FieldDesc(KEY_parameterC, StringParser),
			new FieldDesc(KEY_logtime, LongParser),
			new FieldDesc(KEY_longitude, StringParser),
			new FieldDesc(KEY_latitude,StringParser)
			
		};
	public static Map<String, Object> toMap(String fields) {
		/*进入数据解析*/
		return ProtoUtil.parseToMap(fieldDesc, fields);
	}
}
