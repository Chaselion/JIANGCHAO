package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class HistoryData   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1793704536353285348L;
	//主键id
	private Long id ;
	//蜂鸣器
	private Integer buzzer ;
	//客户id
	private Integer customId ;
	//设备id
	private Integer deviceId ;
	//续航时间
	private Integer enduranceTime ;
	//关机状态
	private Integer shutDownState ;
	//终端id
	private String terminalId ;
	//是否测试
	private Integer testYOrN ;
	//工作状态
	private Integer workingState ;
	//剩余电量
	private Double dumpEnergy ;
	//机内温度
	private Double innerTemperature ;
	//输入频率
	private Double inputFrequency ;
	//
	//UPS厂家信息
	private String upsFactoryInfo ;
	//UPS固件版本
	private String upsHardware ;
	private String upsSerial ;
	//ups类型
	private String upsType ;
	//负载
	private Double workLoad ;
	//日志记录时间
	private Date createDateTime ;
	private Date logTime ;
	//系数
	private Integer coefficient;
	//输入电压
	private String inputVoltage;
	//输出电压
	private String outputVoltage;
	
	public HistoryData() {
	}
	
	


	
	
	public HistoryData(Long id, Integer buzzer, Integer customId, Integer deviceId, Integer enduranceTime,
			Integer shutDownState, String terminalId, Integer testYOrN, Integer workingState, Double dumpEnergy,
			Double innerTemperature, Double inputFrequency, String upsFactoryInfo, String upsHardware, String upsSerial,
			String upsType, Double workLoad, Date createDateTime, Date logTime, Integer coefficient,
			String inputVoltage, String outputVoltage) {
		super();
		this.id = id;
		this.buzzer = buzzer;
		this.customId = customId;
		this.deviceId = deviceId;
		this.enduranceTime = enduranceTime;
		this.shutDownState = shutDownState;
		this.terminalId = terminalId;
		this.testYOrN = testYOrN;
		this.workingState = workingState;
		this.dumpEnergy = dumpEnergy;
		this.innerTemperature = innerTemperature;
		this.inputFrequency = inputFrequency;
		this.upsFactoryInfo = upsFactoryInfo;
		this.upsHardware = upsHardware;
		this.upsSerial = upsSerial;
		this.upsType = upsType;
		this.workLoad = workLoad;
		this.createDateTime = createDateTime;
		this.logTime = logTime;
		this.coefficient = coefficient;
		this.inputVoltage = inputVoltage;
		this.outputVoltage = outputVoltage;
	}






	public Integer getCoefficient() {
		return coefficient;
	}



	public void setCoefficient(Integer coefficient) {
		this.coefficient = coefficient;
	}



	public Long getId(){
		return  id;
	}
	public void setId(Long id ){
		this.id = id;
	}
	
	public Integer getBuzzer(){
		return  buzzer;
	}
	public void setBuzzer(Integer buzzer ){
		this.buzzer = buzzer;
	}
	
	public Integer getCustomId(){
		return  customId;
	}
	public void setCustomId(Integer customId ){
		this.customId = customId;
	}
	
	public Integer getDeviceId(){
		return  deviceId;
	}
	public void setDeviceId(Integer deviceId ){
		this.deviceId = deviceId;
	}
	
	public Integer getEnduranceTime(){
		return  enduranceTime;
	}
	public void setEnduranceTime(Integer enduranceTime ){
		this.enduranceTime = enduranceTime;
	}
	
	public Integer getShutDownState(){
		return  shutDownState;
	}
	public void setShutDownState(Integer shutDownState ){
		this.shutDownState = shutDownState;
	}
	
	public String getTerminalId(){
		return  terminalId;
	}
	public void setTerminalId(String terminalId ){
		this.terminalId = terminalId;
	}
	
	public Integer getTestYOrN(){
		return  testYOrN;
	}
	public void setTestYOrN(Integer testYOrN ){
		this.testYOrN = testYOrN;
	}
	
	public Integer getWorkingState(){
		return  workingState;
	}
	public void setWorkingState(Integer workingState ){
		this.workingState = workingState;
	}
	
	public Double getDumpEnergy(){
		return  dumpEnergy;
	}
	public void setDumpEnergy(Double dumpEnergy ){
		this.dumpEnergy = dumpEnergy;
	}
	
	public Double getInnerTemperature(){
		return  innerTemperature;
	}
	public void setInnerTemperature(Double innerTemperature ){
		this.innerTemperature = innerTemperature;
	}
	
	public Double getInputFrequency(){
		return  inputFrequency;
	}
	public void setInputFrequency(Double inputFrequency ){
		this.inputFrequency = inputFrequency;
	}
	
	public String getUpsFactoryInfo(){
		return  upsFactoryInfo;
	}
	public void setUpsFactoryInfo(String upsFactoryInfo ){
		this.upsFactoryInfo = upsFactoryInfo;
	}
	
	public String getUpsHardware(){
		return  upsHardware;
	}
	public void setUpsHardware(String upsHardware ){
		this.upsHardware = upsHardware;
	}
	
	public String getUpsSerial(){
		return  upsSerial;
	}
	public void setUpsSerial(String upsSerial ){
		this.upsSerial = upsSerial;
	}
	
	public String getUpsType(){
		return  upsType;
	}
	public void setUpsType(String upsType ){
		this.upsType = upsType;
	}
	
	public Double getWorkLoad(){
		return  workLoad;
	}
	public void setWorkLoad(Double workLoad ){
		this.workLoad = workLoad;
	}
	
	public Date getCreateDateTime(){
		return  createDateTime;
	}
	public void setCreateDateTime(Date createDateTime ){
		this.createDateTime = createDateTime;
	}
	
	public Date getLogTime(){
		return  logTime;
	}
	public void setLogTime(Date logTime ){
		this.logTime = logTime;
	}

	
	
	public String getInputVoltage() {
		return inputVoltage;
	}



	public void setInputVoltage(String inputVoltage) {
		this.inputVoltage = inputVoltage;
	}



	public String getOutputVoltage() {
		return outputVoltage;
	}



	public void setOutputVoltage(String outputVoltage) {
		this.outputVoltage = outputVoltage;
	}



	



	@Override
	public String toString() {
		return "HistoryData [id=" + id + ", buzzer=" + buzzer + ", customId=" + customId + ", deviceId=" + deviceId
				+ ", enduranceTime=" + enduranceTime + ", shutDownState=" + shutDownState + ", terminalId=" + terminalId
				+ ", testYOrN=" + testYOrN + ", workingState=" + workingState + ", dumpEnergy=" + dumpEnergy
				+ ", innerTemperature=" + innerTemperature + ", inputFrequency=" + inputFrequency + ", upsFactoryInfo="
				+ upsFactoryInfo + ", upsHardware=" + upsHardware + ", upsSerial=" + upsSerial + ", upsType=" + upsType
				+ ", workLoad=" + workLoad + ", createDateTime=" + createDateTime + ", logTime=" + logTime
				+ ", coefficient=" + coefficient + ", inputVoltage=" + inputVoltage + ", outputVoltage=" + outputVoltage
				+ "]";
	}



	public String toStrings() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return id + "," + buzzer + "," + customId + "," + deviceId + "," + enduranceTime + ","+ shutDownState + "," + terminalId + "," + testYOrN + "," + workingState + "," + dumpEnergy +
				"," + innerTemperature + "," + inputFrequency + "," + upsFactoryInfo + "," + upsHardware + "," + upsSerial + "," + upsType + "," + workLoad + "," + sdf.format(createDateTime) + "," +sdf.format(logTime);
	}

}
