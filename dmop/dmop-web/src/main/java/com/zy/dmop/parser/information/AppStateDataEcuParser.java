package com.zy.dmop.parser.information;

import static com.zy.dmop.web.information.more.ProtoUtil.DoubleParser;
import static com.zy.dmop.web.information.more.ProtoUtil.IntegerParser;
import static com.zy.dmop.web.information.more.ProtoUtil.LongParser;
import static com.zy.dmop.web.information.more.ProtoUtil.StringParser;
import static com.zy.dmop.web.information.more.ProtoUtil.FloatParser;
import java.util.Map;
import com.zy.dmop.web.information.more.FieldDesc;
import com.zy.dmop.web.information.more.ProtoUtil;

public class AppStateDataEcuParser {
	public static final String KEY_OrganizationId = "organizationId";//组织id
	public static final String KEY_TerminalId = "terminalId";//终端id
	public static final String KEY_Property = "property";//对应属性
	public static final String KEY_Value = "value";//对应属性值
	public static final String KEY_Remind = "remind";//稍后提醒
	public static final String KEY_Confirm = "confirm";//确认
	
	private static FieldDesc[] fieldDesc = {	
			new FieldDesc(KEY_OrganizationId, IntegerParser),	
			new FieldDesc(KEY_TerminalId, StringParser),
			new FieldDesc(KEY_Property, StringParser),
			new FieldDesc(KEY_Value, IntegerParser),
			new FieldDesc(KEY_Remind, IntegerParser),
			new FieldDesc(KEY_Confirm, IntegerParser),

		};
		
		public static Map<String, Object> toMap(String fields) {
			return ProtoUtil.parseToMap(fieldDesc, fields);
	    }
}

