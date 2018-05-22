package com.zy.dmop.model.vo;

import java.io.Serializable;
import java.util.Date;

public class UserDownloadvo implements Serializable{
	
	private Integer userId ;
	//可以收到报警推送的等级id
	private Integer alarmLevelId ;
	//组织id
	private Integer organizationId ;
	//权限组id
	private Integer permissionGroupId ;
	//状态
	private Integer state ;
	//邮件
	private String email ;
	//手机
	private String mobilePhone ;
	//备注
	private String note ;

	//真实姓名
	private String realname ;
	//用户名
	private String username ;

	//注册时间
	private Date registerDateTime ;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getAlarmLevelId() {
		return alarmLevelId;
	}

	public void setAlarmLevelId(Integer alarmLevelId) {
		this.alarmLevelId = alarmLevelId;
	}

	public Integer getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}

	public Integer getPermissionGroupId() {
		return permissionGroupId;
	}

	public void setPermissionGroupId(Integer permissionGroupId) {
		this.permissionGroupId = permissionGroupId;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getRegisterDateTime() {
		return registerDateTime;
	}

	public void setRegisterDateTime(Date registerDateTime) {
		this.registerDateTime = registerDateTime;
	}

	public UserDownloadvo(Integer userId, Integer alarmLevelId, Integer organizationId, Integer permissionGroupId,
			Integer state, String email, String mobilePhone, String note, String realname, String username,
			Date registerDateTime) {
		super();
		this.userId = userId;
		this.alarmLevelId = alarmLevelId;
		this.organizationId = organizationId;
		this.permissionGroupId = permissionGroupId;
		this.state = state;
		this.email = email;
		this.mobilePhone = mobilePhone;
		this.note = note;
		this.realname = realname;
		this.username = username;
		this.registerDateTime = registerDateTime;
	}

	public UserDownloadvo() {
		super();
	}

	@Override
	public String toString() {
		return userId + "," + alarmLevelId + ","
				+ organizationId + ", " + permissionGroupId + "," + state + "," + email
				+ "," + mobilePhone + "," + note + "," + realname + ","
				+ username + "," + registerDateTime ;
	}

}
