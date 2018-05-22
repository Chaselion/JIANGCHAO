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

public class MeterStateDataEcuParser {
	public static final String KEY_IntelligentElectricNum = "intelligentElectricNum";//智能电表编号
	public static final String KEY_InputActivePower = "inputActivePower";//输入有功电度
	public static final String KEY_OutputActivePower = "outputActivePower";//输出有功电度
	public static final String KEY_TotalActivePower="totalActivePower";//总有功电度
	public static final String KEY_InputReactivePower = "inputReactivePower";//输入无功电度
	
	public static final String KEY_OutputReactivePower = "outputReactivePower";//输出无功电度
	public static final String KEY_TotalReactivePower1 = "totalReactivePower";//总无功电度
	public static final String KEY_VoltageOfR = "voltageOfR";//电压(R)
	public static final String KEY_VoltageOfS = "voltageOfS";//电压(S)	
	public static final String KEY_VoltageOfT = "voltageOfT";//电压(T)	
	
	public static final String KEY_ElectricityOfR = "electricityOfR";//电流(R)
	public static final String KEY_ElectricityOfS = "electricityOfS";//电流(S)
	public static final String KEY_ElectricityOfT="electricityOfT" ; //电流(T)
	public static final String KEY_AverageElectricity = "averageElectricity";//平均电流
	public static final String KEY_LineVoltageOfST = "lineVoltageOfST";//线电压(ST)
	
	public static final String KEY_LineVoltageOfRT = "lineVoltageOfRT";//线电压(RT)
	public static final String KEY_ActivePowerOfR = "activePowerOfR"; //有功功率(R)
	public static final String KEY_ActivePowerOfS = "activePowerOfS";//有功功率(S)
	public static final String KEY_ActivePowerOfT= "activePowerOfT";//有功功率(T)
	public static final String KEY_TotalPower= "totalPower";//总有功功率
	
	public static final String KEY_ReactivePowerOfR= "reactivePowerOfR"; //无功功率(R)
	public static final String KEY_ReactivePowerOfS= "reactivePowerOfS";//无功功率(S)
	public static final String KEY_ReactivePowerOfT = "reactivePowerOfT";//无功功率(T)
	public static final String KEY_TotalReactivePower2= "totalReactivePower";//总无功功率
	public static final String KEY_ApparentPowerOfR = "apparentPowerOfR";//视在功率(R)
	
	public static final String KEY_ApparentPowerOfS= "apparentPowerOfS";//视在功率(S)
	public static final String KEY_ApparentPowerOfT= "apparentPowerOfT";//视在功率(T)
	public static final String KEY_TotalApparentPower= "totalApparentPower";//总视在功率
	public static final String KEY_PowerFactorOfR= "powerFactorOfR";//功率因素(R)
	public static final String KEY_PowerFactorOfS= "powerFactorOfS";//功率因素(S)
	
	public static final String KEY_PowerFactorOfT= "powerFactorOfT";//功率因素(T)
	public static final String KEY_TotalPowerFactor= "totalPowerFactor";//总功率因素
	public static final String KEY_LogTimeLong = "LogTimeLong";//时间
	public static final String KEY_Longitude = "Longitude";//经度
	public static final String KEY_Latitude = "Latitude";//纬度
	
	private static FieldDesc[] fieldDesc = {	
			new FieldDesc(KEY_IntelligentElectricNum, StringParser),	
			new FieldDesc(KEY_InputActivePower, DoubleParser),
			new FieldDesc(KEY_OutputActivePower, DoubleParser),
			new FieldDesc(KEY_TotalActivePower, DoubleParser),
			new FieldDesc(KEY_InputReactivePower,DoubleParser),
			
			new FieldDesc(KEY_OutputReactivePower, DoubleParser),
			new FieldDesc(KEY_TotalReactivePower1, DoubleParser), 
			new FieldDesc(KEY_VoltageOfR, DoubleParser), 
			new FieldDesc(KEY_VoltageOfS, DoubleParser), 
			new FieldDesc(KEY_VoltageOfT, DoubleParser), 
			
			new FieldDesc(KEY_ElectricityOfR, DoubleParser),
			new FieldDesc(KEY_ElectricityOfS, DoubleParser),
			new FieldDesc(KEY_ElectricityOfT, DoubleParser),
			new FieldDesc(KEY_AverageElectricity, DoubleParser),
			new FieldDesc(KEY_LineVoltageOfST, DoubleParser),
			
			new FieldDesc(KEY_LineVoltageOfRT, DoubleParser),
			new FieldDesc(KEY_ActivePowerOfR, DoubleParser),
			new FieldDesc(KEY_ActivePowerOfS, DoubleParser),
			new FieldDesc(KEY_ActivePowerOfT, DoubleParser),
			new FieldDesc(KEY_TotalPower, DoubleParser), 
			
			new FieldDesc(KEY_ReactivePowerOfR, DoubleParser),
			new FieldDesc(KEY_ReactivePowerOfS, DoubleParser),
			new FieldDesc(KEY_ReactivePowerOfT, DoubleParser),
			new FieldDesc(KEY_TotalReactivePower2, DoubleParser),
			new FieldDesc(KEY_ApparentPowerOfR, DoubleParser),
			
			new FieldDesc(KEY_ApparentPowerOfS, DoubleParser),
			new FieldDesc(KEY_ApparentPowerOfT, DoubleParser),
			new FieldDesc(KEY_TotalApparentPower, DoubleParser),
			new FieldDesc(KEY_PowerFactorOfR, DoubleParser),
			new FieldDesc(KEY_PowerFactorOfS, DoubleParser),
			
			new FieldDesc(KEY_PowerFactorOfT, DoubleParser),
			new FieldDesc(KEY_TotalPowerFactor, DoubleParser),
			new FieldDesc(KEY_LogTimeLong, LongParser),
			new FieldDesc(KEY_Longitude, DoubleParser),
			new FieldDesc(KEY_Latitude, DoubleParser),

		};
		
		public static Map<String, Object> toMap(String fields) {
			return ProtoUtil.parseToMap(fieldDesc, fields);
	    }
}

