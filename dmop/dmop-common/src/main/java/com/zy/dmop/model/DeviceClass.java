package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class DeviceClass   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7335108568299040754L;
	//主键id
	private Integer deviceClassId ;
	//设备类别名字
	private String name ;
	//备注
	private String note ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public DeviceClass() {
	}
	
	public DeviceClass(Integer deviceClassId, String name, String note, Date createDateTime, Date modifyDateTime) {
		super();
		this.deviceClassId = deviceClassId;
		this.name = name;
		this.note = note;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}

	public Integer getDeviceClassId(){
		return  deviceClassId;
	}
	public void setDeviceClassId(Integer deviceClassId ){
		this.deviceClassId = deviceClassId;
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

	@Override
	public String toString() {
		return "DeviceClass [deviceClassId=" + deviceClassId + ", name=" + name + ", note=" + note + ", createDateTime="
				+ createDateTime + ", modifyDateTime=" + modifyDateTime + "]";
	}
	
	
	

}
