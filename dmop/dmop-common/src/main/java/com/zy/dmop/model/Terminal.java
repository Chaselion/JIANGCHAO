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
public class Terminal   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2315235267245635307L;
	//主键id
	private Integer terminalId ;
	
	private String ip;
	private Integer port;
	private float longitude;
	private float latitude;
	//报警策略id
	private Integer alarmStrategyId ;
	//目前状态
	private Integer currentState ;
	//组织id
	private Integer organizationId ;
	//终端型号id
	private Integer terminalModelId ;
	//固件版本
	private String firewareVersion ;
	//图标地址
	private String icon ;
	//备注
	private String note ;
	//终端名字
	private String terminalName ;
	//终端编号
	private String terminalNum ;
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	private Integer deviceClassId;
	private String upsHardware ;
	private String upsSerial ;
	private String factorydate ;
	private String upsFactoryinfo ;
	private String upsSoftwareserial ;
	public String getUpsHardware() {
		return upsHardware;
	}




	public void setUpsHardware(String upsHardware) {
		this.upsHardware = upsHardware;
	}




	public String getUpsSerial() {
		return upsSerial;
	}




	public void setUpsSerial(String upsSerial) {
		this.upsSerial = upsSerial;
	}




	public String getFactorydate() {
		return factorydate;
	}




	public void setFactorydate(String factorydate) {
		this.factorydate = factorydate;
	}




	public String getUpsFactoryinfo() {
		return upsFactoryinfo;
	}




	public void setUpsFactoryinfo(String upsFactoryinfo) {
		this.upsFactoryinfo = upsFactoryinfo;
	}




	public String getUpsSoftwareserial() {
		return upsSoftwareserial;
	}




	public void setUpsSoftwareserial(String upsSoftwareserial) {
		this.upsSoftwareserial = upsSoftwareserial;
	}




	public Terminal() {
	}
	
	
	
	
	public Integer getTerminalId() {
		return terminalId;
	}




	public void setTerminalId(Integer terminalId) {
		this.terminalId = terminalId;
	}




	public String getIp() {
		return ip;
	}




	public void setIp(String ip) {
		this.ip = ip;
	}




	public Integer getPort() {
		return port;
	}




	public void setPort(Integer port) {
		this.port = port;
	}




	public float getLongitude() {
		return longitude;
	}




	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}




	public float getLatitude() {
		return latitude;
	}




	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}




	public Integer getAlarmStrategyId() {
		return alarmStrategyId;
	}




	public void setAlarmStrategyId(Integer alarmStrategyId) {
		this.alarmStrategyId = alarmStrategyId;
	}




	public Integer getCurrentState() {
		return currentState;
	}




	public void setCurrentState(Integer currentState) {
		this.currentState = currentState;
	}




	public Integer getOrganizationId() {
		return organizationId;
	}




	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}




	public Integer getTerminalModelId() {
		return terminalModelId;
	}




	public void setTerminalModelId(Integer terminalModelId) {
		this.terminalModelId = terminalModelId;
	}




	public String getFirewareVersion() {
		return firewareVersion;
	}




	public void setFirewareVersion(String firewareVersion) {
		this.firewareVersion = firewareVersion;
	}




	public String getIcon() {
		return icon;
	}




	public void setIcon(String icon) {
		this.icon = icon;
	}




	public String getNote() {
		return note;
	}




	public void setNote(String note) {
		this.note = note;
	}




	public String getTerminalName() {
		return terminalName;
	}




	public void setTerminalName(String terminalName) {
		this.terminalName = terminalName;
	}




	public String getTerminalNum() {
		return terminalNum;
	}




	public void setTerminalNum(String terminalNum) {
		this.terminalNum = terminalNum;
	}




	public Date getCreateDateTime() {
		return createDateTime;
	}




	public void setCreateDateTime(Date createDateTime) {
		this.createDateTime = createDateTime;
	}




	public Date getModifyDateTime() {
		return modifyDateTime;
	}




	public void setModifyDateTime(Date modifyDateTime) {
		this.modifyDateTime = modifyDateTime;
	}




	public Integer getDeviceClassId() {
		return deviceClassId;
	}




	public void setDeviceClassId(Integer deviceClassId) {
		this.deviceClassId = deviceClassId;
	}


	public Terminal(Integer terminalId, String ip, Integer port,
			float longitude, float latitude, Integer alarmStrategyId,
			Integer currentState, Integer organizationId,
			Integer terminalModelId, String firewareVersion, String icon,
			String note, String terminalName, String terminalNum,
			Date createDateTime, Date modifyDateTime, Integer deviceClassId,
			String upsHardware, String upsSerial, String factorydate,
			String upsFactoryinfo, String upsSoftwareserial) {
		super();
		this.terminalId = terminalId;
		this.ip = ip;
		this.port = port;
		this.longitude = longitude;
		this.latitude = latitude;
		this.alarmStrategyId = alarmStrategyId;
		this.currentState = currentState;
		this.organizationId = organizationId;
		this.terminalModelId = terminalModelId;
		this.firewareVersion = firewareVersion;
		this.icon = icon;
		this.note = note;
		this.terminalName = terminalName;
		this.terminalNum = terminalNum;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
		this.deviceClassId = deviceClassId;
		this.upsHardware = upsHardware;
		this.upsSerial = upsSerial;
		this.factorydate = factorydate;
		this.upsFactoryinfo = upsFactoryinfo;
		this.upsSoftwareserial = upsSoftwareserial;
	}

	@Override
	public String toString() {
		return "Terminal [terminalId=" + terminalId + ", ip=" + ip + ", port="
				+ port + ", longitude=" + longitude + ", latitude=" + latitude
				+ ", alarmStrategyId=" + alarmStrategyId + ", currentState="
				+ currentState + ", organizationId=" + organizationId
				+ ", terminalModelId=" + terminalModelId + ", firewareVersion="
				+ firewareVersion + ", icon=" + icon + ", note=" + note
				+ ", terminalName=" + terminalName + ", terminalNum="
				+ terminalNum + ", createDateTime=" + createDateTime
				+ ", modifyDateTime=" + modifyDateTime + ", deviceClassId="
				+ deviceClassId + ", upsHardware=" + upsHardware
				+ ", upsSerial=" + upsSerial + ", factorydate=" + factorydate
				+ ", upsFactoryinfo=" + upsFactoryinfo + ", upsSoftwareserial="
				+ upsSoftwareserial + "]";
	}




	public String toStrings() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String time="";
		if(createDateTime!=null) {
			time=sdf.format(createDateTime);
		}
		return organizationId + "," + terminalNum  + ","
				+ terminalName + ", " + terminalModelId + "," + firewareVersion + "," + longitude
				+ "," + latitude + ","+ip+ ","+port+","+ time;
	}
	

}
