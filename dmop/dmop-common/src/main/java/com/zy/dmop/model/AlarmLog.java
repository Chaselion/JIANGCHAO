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
public class AlarmLog   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3811101774464519710L;
	//主键id
	private Long alarmLogId ;
	//设备类型
	private String deviceClass ;
	//事件名称
	private String conditionName ;
	//告警值
	private Double currentAlarmValue ;
	//报警等级
	private String currentAlarmLevel ;
	//设备名称
	private String deviceName ;
	//组织架构
	private String organizationName ;
	//客户名称
	private String customName ;
	//报警或解除
	private Integer isRelieve ;
	//是否升级报警
	private Integer isPromote ;
	//是否送达
	private Integer isSend ;
	//报警方式
	private String measureName ;
	//报警信息
	private String message ;
	//发生时间
	private Date createDateTime ;
	private Date modifyDateTime ;
	private Integer organizationId;
	//是否确认
	private Integer isConfirm;
	//确认人
	private String confirmPerson;
	//确认时间
	private Date confirmTime;
	public AlarmLog() {
	}

	public AlarmLog(Long alarmLogId, String deviceClass, String conditionName,
			Double currentAlarmValue, String currentAlarmLevel,
			String deviceName, String organizationName, String customName,
			Integer isRelieve, Integer isPromote, Integer isSend,
			String measureName, String message, Date createDateTime,
			Date modifyDateTime, Integer organizationId, Integer isConfirm,
			String confirmPerson, Date confirmTime) {
		super();
		this.alarmLogId = alarmLogId;
		this.deviceClass = deviceClass;
		this.conditionName = conditionName;
		this.currentAlarmValue = currentAlarmValue;
		this.currentAlarmLevel = currentAlarmLevel;
		this.deviceName = deviceName;
		this.organizationName = organizationName;
		this.customName = customName;
		this.isRelieve = isRelieve;
		this.isPromote = isPromote;
		this.isSend = isSend;
		this.measureName = measureName;
		this.message = message;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
		this.organizationId = organizationId;
		this.isConfirm = isConfirm;
		this.confirmPerson = confirmPerson;
		this.confirmTime = confirmTime;
	}

	public Integer getIsConfirm() {
		return isConfirm;
	}

	public void setIsConfirm(Integer isConfirm) {
		this.isConfirm = isConfirm;
	}

	public String getConfirmPerson() {
		return confirmPerson;
	}

	public void setConfirmPerson(String confirmPerson) {
		this.confirmPerson = confirmPerson;
	}

	public Date getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(Date confirmTime) {
		this.confirmTime = confirmTime;
	}

	public Integer getOrganizationId() {
		return organizationId;
	}









	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}









	public String getMessage() {
		return message;
	}







	public void setMessage(String message) {
		this.message = message;
	}







	public Long getAlarmLogId() {
		return alarmLogId;
	}



	public void setAlarmLogId(Long alarmLogId) {
		this.alarmLogId = alarmLogId;
	}



	public String getDeviceClass() {
		return deviceClass;
	}



	public void setDeviceClass(String deviceClass) {
		this.deviceClass = deviceClass;
	}



	public String getConditionName() {
		return conditionName;
	}



	public void setConditionName(String conditionName) {
		this.conditionName = conditionName;
	}



	public Double getCurrentAlarmValue() {
		return currentAlarmValue;
	}



	public void setCurrentAlarmValue(Double currentAlarmValue) {
		this.currentAlarmValue = currentAlarmValue;
	}



	public String getCurrentAlarmLevel() {
		return currentAlarmLevel;
	}



	public void setCurrentAlarmLevel(String currentAlarmLevel) {
		this.currentAlarmLevel = currentAlarmLevel;
	}



	public String getDeviceName() {
		return deviceName;
	}



	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}



	public String getOrganizationName() {
		return organizationName;
	}



	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}



	public String getCustomName() {
		return customName;
	}



	public void setCustomName(String customName) {
		this.customName = customName;
	}



	public Integer getIsRelieve() {
		return isRelieve;
	}



	public void setIsRelieve(Integer isRelieve) {
		this.isRelieve = isRelieve;
	}



	public Integer getIsPromote() {
		return isPromote;
	}



	public void setIsPromote(Integer isPromote) {
		this.isPromote = isPromote;
	}



	public Integer getIsSend() {
		return isSend;
	}



	public void setIsSend(Integer isSend) {
		this.isSend = isSend;
	}



	public String getMeasureName() {
		return measureName;
	}



	public void setMeasureName(String measureName) {
		this.measureName = measureName;
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

	

	@Override
	public String toString() {
		return "AlarmLog [alarmLogId=" + alarmLogId + ", deviceClass="
				+ deviceClass + ", conditionName=" + conditionName
				+ ", currentAlarmValue=" + currentAlarmValue
				+ ", currentAlarmLevel=" + currentAlarmLevel + ", deviceName="
				+ deviceName + ", organizationName=" + organizationName
				+ ", customName=" + customName + ", isRelieve=" + isRelieve
				+ ", isPromote=" + isPromote + ", isSend=" + isSend
				+ ", measureName=" + measureName + ", message=" + message
				+ ", createDateTime=" + createDateTime + ", modifyDateTime="
				+ modifyDateTime + ", organizationId=" + organizationId + "]";
	}

	public String toStrings() {
		String relieve="";
		if(isRelieve==1){
			relieve="报警";
		} else if (isRelieve == 0) {
			relieve = "解除";
		}
		String stat="";
		if(isPromote==1){
			stat="是";
		} else if (isPromote == 0) {
			stat = "否";
		}
		String successSend="";
		if(isSend==1){
			successSend="是";
		} else if (isSend == 0) {
			successSend = "否";
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(createDateTime)+","+deviceClass + "," + conditionName
				+ "," + currentAlarmValue + "," + currentAlarmLevel + ","
				+ deviceName + "," + organizationName + "," + customName + "," + relieve
				+ "," + stat + "," + successSend + ","
				+ measureName + "," + message;
	}
	

}
