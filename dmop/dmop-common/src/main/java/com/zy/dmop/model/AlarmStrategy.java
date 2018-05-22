package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class AlarmStrategy   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8016538227748128375L;
	//主键id
	private Integer alarmStrategyId ;
	//报警方式id
	private Integer alarmMeasureId ;
	//报警策略名字
	private String name ;
	//备注
	private String note ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	private Integer ifActive;
	
	public AlarmStrategy() {
	}
	
	public AlarmStrategy(Integer alarmStrategyId, Integer alarmMeasureId, String name, String note, Date createDateTime,
			Date modifyDateTime,Integer ifActive) {
		super();
		this.alarmStrategyId = alarmStrategyId;
		this.alarmMeasureId = alarmMeasureId;
		this.name = name;
		this.note = note;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
		this.ifActive = ifActive;
	}

	public Integer getAlarmStrategyId(){
		return  alarmStrategyId;
	}
	public void setAlarmStrategyId(Integer alarmStrategyId ){
		this.alarmStrategyId = alarmStrategyId;
	}
	
	public Integer getAlarmMeasureId(){
		return  alarmMeasureId;
	}
	public void setAlarmMeasureId(Integer alarmMeasureId ){
		this.alarmMeasureId = alarmMeasureId;
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
		return "AlarmStrategy [alarmStrategyId=" + alarmStrategyId + ", alarmMeasureId=" + alarmMeasureId + ", name="
				+ name + ", note=" + note + ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime
				+ ", ifActive=" + ifActive + "]";
	}


	
	

}
