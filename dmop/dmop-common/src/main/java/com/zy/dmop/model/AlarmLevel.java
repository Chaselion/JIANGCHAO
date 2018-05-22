package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class AlarmLevel   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5520908607810103021L;
	//主键id
	private Integer alarmLevelId ;
	//等级
	private Integer level ;
	//父等级id
	private Integer parentId ;
	//等级名字
	private String levelName ;
	//备注
	private String note ;
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public AlarmLevel() {
	}
	
	public AlarmLevel(Integer alarmLevelId, Integer level, Integer parentId, String levelName, String note,
			Date createDateTime, Date modifyDateTime) {
		super();
		this.alarmLevelId = alarmLevelId;
		this.level = level;
		this.parentId = parentId;
		this.levelName = levelName;
		this.note = note;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}

	public Integer getAlarmLevelId(){
		return  alarmLevelId;
	}
	public void setAlarmLevelId(Integer alarmLevelId ){
		this.alarmLevelId = alarmLevelId;
	}
	
	public Integer getLevel(){
		return  level;
	}
	public void setLevel(Integer level ){
		this.level = level;
	}
	
	public Integer getParentId(){
		return  parentId;
	}
	public void setParentId(Integer parentId ){
		this.parentId = parentId;
	}
	
	public String getLevelName(){
		return  levelName;
	}
	public void setLevelName(String levelName ){
		this.levelName = levelName;
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

	@Override
	public String toString() {
		return "AlarmLevel [alarmLevelId=" + alarmLevelId + ", level=" + level + ", parentId=" + parentId
				+ ", levelName=" + levelName + ", note=" + note + ", createDateTime=" + createDateTime
				+ ", modifyDateTime=" + modifyDateTime + "]";
	}
	
	
	

}
