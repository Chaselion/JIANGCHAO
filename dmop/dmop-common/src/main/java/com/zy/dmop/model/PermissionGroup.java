package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class PermissionGroup   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5651268795229071453L;
	//主键id
	private Integer permissionGroupId ;
	//客户id
	private Integer customId ;
	//权限组描述
	private String description ;
	//权限组名字
	private String name ;
	//备注
	private String note ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
	private Integer organizationId;
	
	public PermissionGroup() {
	}

	public PermissionGroup(Integer permissionGroupId, Integer customId, String description, String name, String note,
			Date createDateTime, Date modifyDateTime, Integer organizationId) {
		super();
		this.permissionGroupId = permissionGroupId;
		this.customId = customId;
		this.description = description;
		this.name = name;
		this.note = note;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
		this.organizationId = organizationId;
	}

	public Integer getPermissionGroupId() {
		return permissionGroupId;
	}

	public void setPermissionGroupId(Integer permissionGroupId) {
		this.permissionGroupId = permissionGroupId;
	}

	public Integer getCustomId() {
		return customId;
	}

	public void setCustomId(Integer customId) {
		this.customId = customId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public Integer getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PermissionGroup [permissionGroupId=" + permissionGroupId + ", customId=" + customId + ", description="
				+ description + ", name=" + name + ", note=" + note + ", createDateTime=" + createDateTime
				+ ", modifyDateTime=" + modifyDateTime + ", organizationId=" + organizationId + "]";
	}
	
	
	
	
	

}
