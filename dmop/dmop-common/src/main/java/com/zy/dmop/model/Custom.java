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
public class Custom   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4396158515142832114L;
	//主键id
	private Integer customId ;
	//状态
	private Integer state ;
	//客户类型
	private Integer type ;
	//描述
	private String description ;
	//联系人名字
	private String linkManName ;
	//联系人联系方式
	private String linkManPhone ;
	//大概位置
	private String location ;
	//客户名字
	private String name ;
	//备注
	private String note ;
	//创建时间
	private Date createDateTime ;
	//过期时间
	private Date expireDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	public Custom() {
	}
	
	public Custom(Integer customId, Integer state, Integer type, String description, String linkManName,
			String linkManPhone, String location, String name, String note, Date createDateTime, Date expireDateTime,
			Date modifyDateTime) {
		super();
		this.customId = customId;
		this.state = state;
		this.type = type;
		this.description = description;
		this.linkManName = linkManName;
		this.linkManPhone = linkManPhone;
		this.location = location;
		this.name = name;
		this.note = note;
		this.createDateTime = createDateTime;
		this.expireDateTime = expireDateTime;
		this.modifyDateTime = modifyDateTime;
	}

	public Integer getCustomId(){
		return  customId;
	}
	public void setCustomId(Integer customId ){
		this.customId = customId;
	}
	
	public Integer getState(){
		return  state;
	}
	public void setState(Integer state ){
		this.state = state;
	}
	
	public Integer getType(){
		return  type;
	}
	public void setType(Integer type ){
		this.type = type;
	}
	
	public String getDescription(){
		return  description;
	}
	public void setDescription(String description ){
		this.description = description;
	}
	
	public String getLinkManName(){
		return  linkManName;
	}
	public void setLinkManName(String linkManName ){
		this.linkManName = linkManName;
	}
	
	public String getLinkManPhone(){
		return  linkManPhone;
	}
	public void setLinkManPhone(String linkManPhone ){
		this.linkManPhone = linkManPhone;
	}
	
	public String getLocation(){
		return  location;
	}
	public void setLocation(String location ){
		this.location = location;
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
	
	public Date getExpireDateTime(){
		return  expireDateTime;
	}
	public void setExpireDateTime(Date expireDateTime ){
		this.expireDateTime = expireDateTime;
	}
	
	public Date getModifyDateTime(){
		return  modifyDateTime;
	}
	public void setModifyDateTime(Date modifyDateTime ){
		this.modifyDateTime = modifyDateTime;
	}

	@Override
	public String toString() {
		return "Custom [customId=" + customId + ", state=" + state + ", type=" + type + ", description=" + description
				+ ", linkManName=" + linkManName + ", linkManPhone=" + linkManPhone + ", location=" + location
				+ ", name=" + name + ", note=" + note + ", createDateTime=" + createDateTime + ", expireDateTime="
				+ expireDateTime + ", modifyDateTime=" + modifyDateTime + "]";
	}
	
	public String toStrings() {
		String typecustom="";
		if(type==1){
			typecustom="正式";
		} else if (state == 2) {
			typecustom = "试用";
		}
		String stat="";
		if(state==1){
			stat="可用";
		} else if (state == 2) {
			stat = "禁用";
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return name + "," + linkManName + "," + linkManPhone
				+ "," + typecustom + "," +location+ ","+stat+"," +note+ "," + sdf.format(createDateTime) + ","+sdf.format(expireDateTime)+","+ sdf.format(modifyDateTime);
	}
	
	

}
