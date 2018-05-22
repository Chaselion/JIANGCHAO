package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class AlarmMeasure   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8342161222600645462L;
	//主键id
	private Integer alarmMeasureId ;
	//是否发送邮件
	private Integer email ;
	//是否发送短信
	private Integer message ;
	//是否语音提醒
	private Integer voice ;
	//解除时通知
	private Integer whenRelieve ;
	//触发时通知
	private Integer whenTrigger ;
	//报警方式名字
	private String name ;
	//备注
	private String note ;
	//报警配置
	private String format ;
	private Date createDateTime ;
	private Date modifyDateTime ;
	private Integer ifActive;
	
	private Integer typeID;
	private String typeName;
	
	public Integer getTypeID() {
		return typeID;
	}

	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public AlarmMeasure() {
	}
	
	public AlarmMeasure(Integer alarmMeasureId, Integer email, Integer message, Integer voice, Integer whenRelieve,
			Integer whenTrigger, String name, String note, String format, Date createDateTime, Date modifyDateTime,Integer ifActive, Integer typeID, String typeName) {
		super();
		this.alarmMeasureId = alarmMeasureId;
		this.email = email;
		this.message = message;
		this.voice = voice;
		this.whenRelieve = whenRelieve;
		this.whenTrigger = whenTrigger;
		this.name = name;
		this.note = note;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
		this.ifActive = ifActive;
		this.format = format;
		this.typeID = typeID;
		this.typeName = typeName;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public Integer getAlarmMeasureId(){
		return  alarmMeasureId;
	}
	public void setAlarmMeasureId(Integer alarmMeasureId ){
		this.alarmMeasureId = alarmMeasureId;
	}
	
	public Integer getEmail(){
		return  email;
	}
	public void setEmail(Integer email ){
		this.email = email;
	}
	
	public Integer getMessage(){
		return  message;
	}
	public void setMessage(Integer message ){
		this.message = message;
	}
	
	public Integer getVoice(){
		return  voice;
	}
	public void setVoice(Integer voice ){
		this.voice = voice;
	}
	
	public Integer getWhenRelieve(){
		return  whenRelieve;
	}
	public void setWhenRelieve(Integer whenRelieve ){
		this.whenRelieve = whenRelieve;
	}
	
	public Integer getWhenTrigger(){
		return  whenTrigger;
	}
	public void setWhenTrigger(Integer whenTrigger ){
		this.whenTrigger = whenTrigger;
	}
	
	public String getName(){
		return  name;
	}
	public void setName(String name ){
		this.name = name;
	}
	
	public String getNote(){
		return  note;
	}
	public void setNote(String note ){
		this.note = note;
	}
	
	public Date getCreateDateTime(){
		return  createDateTime;
	}
	public void setCreateDateTime(Date createDateTime ){
		this.createDateTime = createDateTime;
	}
	
	public Date getModifyDateTime(){
		return  modifyDateTime;
	}
	public void setModifyDateTime(Date modifyDateTime ){
		this.modifyDateTime = modifyDateTime;
	}

	
	public Integer getIfActive() {
		return ifActive;
	}

	public void setIfActive(Integer ifActive) {
		this.ifActive = ifActive;
	}

	@Override
	public String toString() {
		return "AlarmMeasure [alarmMeasureId=" + alarmMeasureId + ", email=" + email + ", message=" + message
				+ ", voice=" + voice + ", whenRelieve=" + whenRelieve + ", whenTrigger=" + whenTrigger + ", name="
				+ name + ", note=" + note + ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime
				+ ", ifActive=" + ifActive + ",format=" + format + ",typeid=" + typeID + ",typeName=" + typeName + "]";
	}

	
	
	

}
