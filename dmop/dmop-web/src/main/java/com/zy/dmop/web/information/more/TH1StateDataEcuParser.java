package com.zy.dmop.web.information.more;

import static com.zy.dmop.web.information.more.ProtoUtil.DoubleParser;
import static com.zy.dmop.web.information.more.ProtoUtil.IntegerParser;
import static com.zy.dmop.web.information.more.ProtoUtil.LongParser;
import static com.zy.dmop.web.information.more.ProtoUtil.StringParser;
import static com.zy.dmop.web.information.more.ProtoUtil.FloatParser;
import java.util.Map;

import org.apache.log4j.Logger;

import com.zy.dmop.web.information.more.FieldDesc;
import com.zy.dmop.web.information.more.ProtoUtil;

public class TH1StateDataEcuParser {
	private static Logger log = Logger.getLogger(TH1StateDataEcuParser.class);
	//因为温湿度沿用ups协议，所以用的ups解析协议进行解析
	public static final String KEY_TerminalId = "terminalID";//终端号
	public static final String KEY_Temperature = "Temperature";//温度
	public static final String KEY_Workload = "Workload";//负载
	public static final String KEY_BatteryVoltage="BatteryVoltage";
	public static final String KEY_Humidity = "Humidity";//湿度
	
	public static final String KEY_EnduranceTime = "EnduranceTime";//续航时间
	public static final String KEY_Workingstate = "Workingstate";//工作状态
	public static final String KEY_BypassVoltage = "BypassVoltage";//负载功率
	public static final String KEY_BypassFrequency = "BypassFrequency";
	public static final String KEY_InputVoltageFault = "InputVoltageFault";//负载工作功率
	
	public static final String KEY_OutputFrequency = "OutputFrequency";//UPS输出频率
	public static final String KEY_SingleCellVoltage = "SingleCellVoltage";//Ups单节电池电压
	public static final String KEY_Citystate="Citystate" ;       //市电状态**********
	public static final String KEY_ChargeAndDischarge = "ChargeAndDischarge";     //工作模式
	public static final String KEY_BypassVoltageofR = "BypassVoltageofR";          //UPS类型
	
	public static final String KEY_BypassVoltageofS = "BypassVoltageofS";    //关机状态
	public static final String KEY_InputVoltageofS = "InputVoltageofS";       //电池状态
	public static final String KEY_LoadofR = "LoadofR";      //是否测试
	public static final String KEY_BypassVoltageofT= "BypassVoltageofT";
	public static final String KEY_InputVoltageofR = "InputVoltageofR";//市电输入电压
	
	
	public static final String KEY_Inputfrequency = "Inputfrequency"; //市电输入频率***
	public static final String KEY_InputVoltageofT = "InputVoltageofT";//UPS在线电压
	public static final String KEY_OutputVoltageofR = "OutputVoltageofR";//UPS输出电压
	public static final String KEY_OutputVoltageofS = "OutputVoltageofS";//UPS最大在线电压
	public static final String KEY_OutputVoltageofT = "OutputVoltageofT";//UPS最小在线电压
	
	public static final String KEY_Buzzer = "Buzzer";//蜂鸣器****
	public static final String KEY_LoadofS = "LoadofS";
	public static final String KEY_LoadofT= "LoadofT";
	public static final String KEY_LogTimeLong = "LogTimeLong";
	public static final String KEY_Longitude = "Longitude";//经度
	public static final String KEY_Latitude = "Latitude";//纬度
	
	
	private static FieldDesc[] fieldDesc = {	
			
			new FieldDesc(KEY_TerminalId, StringParser),	
			new FieldDesc(KEY_Temperature, DoubleParser),
			new FieldDesc(KEY_Workload, DoubleParser),//工作负载功率
			new FieldDesc(KEY_BypassVoltage, DoubleParser),
			new FieldDesc(KEY_Humidity,DoubleParser),
			
			new FieldDesc(KEY_EnduranceTime, DoubleParser),
			new FieldDesc(KEY_Workingstate, IntegerParser),//工作模式
			new FieldDesc(KEY_BatteryVoltage, DoubleParser),
			new FieldDesc(KEY_BypassFrequency, DoubleParser),
			new FieldDesc(KEY_InputVoltageFault, DoubleParser),
			
			new FieldDesc(KEY_OutputFrequency, DoubleParser),
			new FieldDesc(KEY_SingleCellVoltage, DoubleParser),
			new FieldDesc(KEY_Citystate, IntegerParser),   //市电状态
			new FieldDesc(KEY_ChargeAndDischarge, IntegerParser),
			new FieldDesc(KEY_BypassVoltageofR, IntegerParser),//UPS类型
			
			
			new FieldDesc(KEY_BypassVoltageofS, IntegerParser), //关机状态
			new FieldDesc(KEY_InputVoltageofS, IntegerParser), //电池状态
			new FieldDesc(KEY_LoadofR, IntegerParser),  //是否测试
			new FieldDesc(KEY_BypassVoltageofT, DoubleParser),
			new FieldDesc(KEY_InputVoltageofR, DoubleParser),//输入
			
			new FieldDesc(KEY_Inputfrequency, DoubleParser),
			new FieldDesc(KEY_InputVoltageofT, DoubleParser),
			new FieldDesc(KEY_OutputVoltageofR, DoubleParser),//输出
			new FieldDesc(KEY_OutputVoltageofS, DoubleParser),//最大
			new FieldDesc(KEY_OutputVoltageofT, DoubleParser),//最小
			
			new FieldDesc(KEY_Buzzer, IntegerParser),//蜂鸣器
			new FieldDesc(KEY_LoadofS, DoubleParser),
			new FieldDesc(KEY_LoadofT, DoubleParser),
			new FieldDesc(KEY_LogTimeLong, LongParser),
			new FieldDesc(KEY_Longitude, DoubleParser),
			new FieldDesc(KEY_Latitude, DoubleParser),

	
			
		};
		
		public static Map<String, Object> toMap(String fields) {
			return ProtoUtil.parseToMap(fieldDesc, fields);
	    }
}

