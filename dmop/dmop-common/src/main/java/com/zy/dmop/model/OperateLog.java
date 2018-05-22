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
public class OperateLog   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6020591736678706810L;
	//主键id
	private Integer operateLogId ;
	//组织id
	private Integer organizationId ;
	//用户id
	private Integer userId ;
	//内容
	private String text ;
	//日志记录时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public OperateLog() {
	}
	
	

	public Integer getOperateLogId() {
		return operateLogId;
	}



	public void setOperateLogId(Integer operateLogId) {
		this.operateLogId = operateLogId;
	}



	public Integer getOrganizationId() {
		return organizationId;
	}



	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}



	public Integer getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
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



	public OperateLog(Integer operateLogId, Integer organizationId,
			Integer userId, String text, Date createDateTime,
			Date modifyDateTime) {
		super();
		this.operateLogId = operateLogId;
		this.organizationId = organizationId;
		this.userId = userId;
		this.text = text;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}



	@Override
	public String toString() {
		return "OperateLog [operateLogId=" + operateLogId + ", organizationId="
				+ organizationId + ", userId=" + userId + ", text=" + text
				+ ", createDateTime=" + createDateTime + ", modifyDateTime="
				+ modifyDateTime + "]";
	}



	public String toStrings() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return operateLogId + "," + organizationId + "," + userId + "," + text + "," + sdf.format(createDateTime) + ","+ sdf.format(modifyDateTime);
	}

}
