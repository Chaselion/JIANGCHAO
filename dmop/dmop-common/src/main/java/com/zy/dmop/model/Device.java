package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class Device   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8309779111247130496L;
	//主键id
	private Integer deviceId ;
	//客户id
	private Integer customId ;
	//设备类型id
	private Integer deviceClassId ;
	//终端id
	private Integer terminalId ;
	//生产厂家
	private String manufacturer ;
	//设备类型
	private String model ;
	//设备名字
	private String name ;
	//备注
	private String note ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public Device() {
	}
	
	public Device(Integer deviceId, Integer customId, Integer deviceClassId, Integer terminalId, String manufacturer,
			String model, String name, String note, Date createDateTime, Date modifyDateTime) {
		super();
		this.deviceId = deviceId;
		this.customId = customId;
		this.deviceClassId = deviceClassId;
		this.terminalId = terminalId;
		this.manufacturer = manufacturer;
		this.model = model;
		this.name = name;
		this.note = note;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}

	public Integer getDeviceId(){
		return  deviceId;
	}
	public void setDeviceId(Integer deviceId ){
		this.deviceId = deviceId;
	}
	
	public Integer getCustomId(){
		return  customId;
	}
	public void setCustomId(Integer customId ){
		this.customId = customId;
	}
	
	public Integer getDeviceClassId(){
		return  deviceClassId;
	}
	public void setDeviceClassId(Integer deviceClassId ){
		this.deviceClassId = deviceClassId;
	}
	
	public Integer getTerminalId(){
		return  terminalId;
	}
	public void setTerminalId(Integer terminalId ){
		this.terminalId = terminalId;
	}
	
	public String getManufacturer(){
		return  manufacturer;
	}
	public void setManufacturer(String manufacturer ){
		this.manufacturer = manufacturer;
	}
	
	public String getModel(){
		return  model;
	}
	public void setModel(String model ){
		this.model = model;
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
		return "Device [deviceId=" + deviceId + ", customId=" + customId + ", deviceClassId=" + deviceClassId
				+ ", terminalId=" + terminalId + ", manufacturer=" + manufacturer + ", model=" + model + ", name="
				+ name + ", note=" + note + ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime
				+ "]";
	}
	
	
	

}
