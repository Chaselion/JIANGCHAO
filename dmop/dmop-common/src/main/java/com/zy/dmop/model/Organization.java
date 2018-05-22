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
public class Organization   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6065130583414800626L;
	//主键id
	private Integer organizationId ;
	//报警策略id
	private Integer alarmStrategyId ;
	//客户id
	private Integer customId ;
	//父组织id
	private Integer parentId ;
	//组织类型
	private Integer type ;
	//组织描述
	private String description ;
	//组织名字
	private String name ;
	//备注
	private String note ;
	//创建时间
	private Date createDateTime ;
	//修改日期
	private Date modifyDateTime ;
	
	public Organization() {
	}
	
	public Organization(Integer organizationId, Integer alarmStrategyId, Integer customId, Integer parentId,
			Integer type, String description, String name, String note, Date createDateTime, Date modifyDateTime) {
		super();
		this.organizationId = organizationId;
		this.alarmStrategyId = alarmStrategyId;
		this.customId = customId;
		this.parentId = parentId;
		this.type = type;
		this.description = description;
		this.name = name;
		this.note = note;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}

	public Integer getOrganizationId(){
		return  organizationId;
	}
	public void setOrganizationId(Integer organizationId ){
		this.organizationId = organizationId;
	}
	
	public Integer getAlarmStrategyId(){
		return  alarmStrategyId;
	}
	public void setAlarmStrategyId(Integer alarmStrategyId ){
		this.alarmStrategyId = alarmStrategyId;
	}
	
	public Integer getCustomId(){
		return  customId;
	}
	public void setCustomId(Integer customId ){
		this.customId = customId;
	}
	
	public Integer getParentId(){
		return  parentId;
	}
	public void setParentId(Integer parentId ){
		this.parentId = parentId;
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
		return "Organization [organizationId=" + organizationId + ", alarmStrategyId=" + alarmStrategyId + ", customId="
				+ customId + ", parentId=" + parentId + ", type=" + type + ", description=" + description + ", name="
				+ name + ", note=" + note + ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime
				+ "]";
	}
	
	public String toStrings() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return name+ "," +description+","+"alarmStrategyId"+"," + sdf.format(createDateTime)+","+sdf.format(modifyDateTime);
	}
	

}
