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
public class SystemLog   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2348752467104106102L;
	//主键id
	private Long systemLogId ;
	//系统异常等级
	private String level ;
	//异常模块
	private String module ;
	//内容
	private String text ;
	//日志记录时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	
	
	public SystemLog() {
		super();
	}



	public SystemLog(Long systemLogId, String level, String module, String text, Date createDateTime,
			Date modifyDateTime) {
		super();
		this.systemLogId = systemLogId;
		this.level = level;
		this.module = module;
		this.text = text;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}



	@Override
	public String toString() {
		return "SystemLog [systemLogId=" + systemLogId + ", level=" + level + ", module=" + module + ", text=" + text
				+ ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime + "]";
	}



	public Long getSystemLogId() {
		return systemLogId;
	}



	public void setSystemLogId(Long systemLogId) {
		this.systemLogId = systemLogId;
	}



	public String getLevel() {
		return level;
	}



	public void setLevel(String level) {
		this.level = level;
	}



	public String getModule() {
		return module;
	}



	public void setModule(String module) {
		this.module = module;
	}



	public String getText() {
		return text;
	}



	public void setText(String text) {
		this.text = text;
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



	public String toStrings() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(createDateTime) + "," + level + "," + module + "," + text ;
	}
	

}
