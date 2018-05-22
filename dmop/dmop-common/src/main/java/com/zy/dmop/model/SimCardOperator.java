package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class SimCardOperator   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6725006366530830948L;
	private Long simCardOperatorId ;
	private Integer customId ;
	private String description ;
	private String operatorName ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public SimCardOperator() {
	}
	
	public SimCardOperator(Long simCardOperatorId, Integer customId, String description, String operatorName,
			Date createDateTime, Date modifyDateTime) {
		super();
		this.simCardOperatorId = simCardOperatorId;
		this.customId = customId;
		this.description = description;
		this.operatorName = operatorName;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}

	public Long getSimCardOperatorId(){
		return  simCardOperatorId;
	}
	public void setSimCardOperatorId(Long simCardOperatorId ){
		this.simCardOperatorId = simCardOperatorId;
	}
	
	public Integer getCustomId(){
		return  customId;
	}
	public void setCustomId(Integer customId ){
		this.customId = customId;
	}
	
	public String getDescription(){
		return  description;
	}
	public void setDescription(String description ){
		this.description = description;
	}
	
	public String getOperatorName(){
		return  operatorName;
	}
	public void setOperatorName(String operatorName ){
		this.operatorName = operatorName;
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
		return "SimCardOperator [simCardOperatorId=" + simCardOperatorId + ", customId=" + customId + ", description="
				+ description + ", operatorName=" + operatorName + ", createDateTime=" + createDateTime
				+ ", modifyDateTime=" + modifyDateTime + "]";
	}
	
	
	

}
