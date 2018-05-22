package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class SimPackage   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2060963240416152776L;
	private Long simPackageId ;
	private Integer customId ;
	private String description ;
	private Float flow ;
	private String operatorName;
	private String packageName ;
	private Float price ;
	private Long simCardOperatorId ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public SimPackage() {
	}
	
	

	public SimPackage(Long simPackageId, Integer customId, String description, Float flow, String operatorName,
			String packageName, Float price, Long simCardOperatorId, Date createDateTime, Date modifyDateTime) {
		super();
		this.simPackageId = simPackageId;
		this.customId = customId;
		this.description = description;
		this.flow = flow;
		this.operatorName = operatorName;
		this.packageName = packageName;
		this.price = price;
		this.simCardOperatorId = simCardOperatorId;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}



	public String getOperatorName() {
		return operatorName;
	}



	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}



	public Long getSimPackageId(){
		return  simPackageId;
	}
	public void setSimPackageId(Long simPackageId ){
		this.simPackageId = simPackageId;
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
	
	public Float getFlow(){
		return  flow;
	}
	public void setFlow(Float flow ){
		this.flow = flow;
	}
	
	public String getPackageName(){
		return  packageName;
	}
	public void setPackageName(String packageName ){
		this.packageName = packageName;
	}
	
	public Float getPrice(){
		return  price;
	}
	public void setPrice(Float price ){
		this.price = price;
	}
	
	public Long getSimCardOperatorId(){
		return  simCardOperatorId;
	}
	public void setSimCardOperatorId(Long simCardOperatorId ){
		this.simCardOperatorId = simCardOperatorId;
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
		return "SimPackage [simPackageId=" + simPackageId + ", customId=" + customId + ", description=" + description
				+ ", flow=" + flow + ", operatorName=" + operatorName + ", packageName=" + packageName + ", price="
				+ price + ", simCardOperatorId=" + simCardOperatorId + ", createDateTime=" + createDateTime
				+ ", modifyDateTime=" + modifyDateTime + "]";
	}
	
	
	

}
