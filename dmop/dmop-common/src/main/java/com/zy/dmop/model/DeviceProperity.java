package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class DeviceProperity   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8087844576585194320L;
	//主键id
	private Integer deviceProperityId ;
	//设备类别id
	private Integer deviceClassId ;
	//排序
	private Integer sequence ;
	//设备属性名字
	private String name ;
	//设备英文名字
	private String englishName;
	//备注
	private String note ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public DeviceProperity() {
	}
	
	

	public DeviceProperity(Integer deviceProperityId, Integer deviceClassId, Integer sequence, String name,
			String englishName, String note, Date createDateTime, Date modifyDateTime) {
		super();
		this.deviceProperityId = deviceProperityId;
		this.deviceClassId = deviceClassId;
		this.sequence = sequence;
		this.name = name;
		this.englishName = englishName;
		this.note = note;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}


	
	public String getEnglishName() {
		return englishName;
	}



	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}



	public Integer getDeviceProperityId(){
		return  deviceProperityId;
	}
	public void setDeviceProperityId(Integer deviceProperityId ){
		this.deviceProperityId = deviceProperityId;
	}
	
	public Integer getDeviceClassId(){
		return  deviceClassId;
	}
	public void setDeviceClassId(Integer deviceClassId ){
		this.deviceClassId = deviceClassId;
	}
	
	public Integer getSequence(){
		return  sequence;
	}
	public void setSequence(Integer sequence ){
		this.sequence = sequence;
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
		return "DeviceProperity [deviceProperityId=" + deviceProperityId + ", deviceClassId=" + deviceClassId
				+ ", sequence=" + sequence + ", name=" + name + ", englishName=" + englishName + ", note=" + note
				+ ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime + "]";
	}

	
	
	
	

}
