package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class SimCard   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3148278388737495792L;
	private Long simCardId ;
	private Integer arrearsState ;
	private Integer customId ;
	private Float balance ;
	private Long simPackageId ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public SimCard() {
	}
	
	public SimCard(Long simCardId, Integer arrearsState, Integer customId, Float balance, Long simPackageId,
			Date createDateTime, Date modifyDateTime) {
		super();
		this.simCardId = simCardId;
		this.arrearsState = arrearsState;
		this.customId = customId;
		this.balance = balance;
		this.simPackageId = simPackageId;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}

	public Long getSimCardId(){
		return  simCardId;
	}
	public void setSimCardId(Long simCardId ){
		this.simCardId = simCardId;
	}
	
	public Integer getArrearsState(){
		return  arrearsState;
	}
	public void setArrearsState(Integer arrearsState ){
		this.arrearsState = arrearsState;
	}
	
	public Integer getCustomId(){
		return  customId;
	}
	public void setCustomId(Integer customId ){
		this.customId = customId;
	}
	
	public Float getBalance(){
		return  balance;
	}
	public void setBalance(Float balance ){
		this.balance = balance;
	}
	
	public Long getSimPackageId(){
		return  simPackageId;
	}
	public void setSimPackageId(Long simPackageId ){
		this.simPackageId = simPackageId;
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
		return "SimCard [simCardId=" + simCardId + ", arrearsState=" + arrearsState + ", customId=" + customId
				+ ", balance=" + balance + ", simPackageId=" + simPackageId + ", createDateTime=" + createDateTime
				+ ", modifyDateTime=" + modifyDateTime + "]";
	}
	
	
	

}
