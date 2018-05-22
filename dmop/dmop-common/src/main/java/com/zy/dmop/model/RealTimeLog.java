package com.zy.dmop.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RealTimeLog {
	private long id;
	private String classType;
	private String method;
	private Date createTime;
	private String logLevel;
	private String msg;
	
	public String toStrings() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return id + "," + classType + "," + method + "," + sdf.format(createTime) + ","+ logLevel + "," + msg;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "RealTimeLog [id=" + id + ", classType=" + classType + ", method=" + method + ", createTime="
				+ createTime + ", logLevel=" + logLevel + ", msg=" + msg + "]";
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getLogLevel() {
		return logLevel;
	}
	public void setLogLevel(String logLevel) {
		this.logLevel = logLevel;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public RealTimeLog(long id, String classType, String method, Date createTime, String logLevel, String msg) {
		super();
		this.id = id;
		this.classType = classType;
		this.method = method;
		this.createTime = createTime;
		this.logLevel = logLevel;
		this.msg = msg;
	}
	public RealTimeLog() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
