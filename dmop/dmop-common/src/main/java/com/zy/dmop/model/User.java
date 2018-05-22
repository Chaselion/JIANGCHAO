package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dmop.api.web.service.PermissionGroupService;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class User   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1900325331242845454L;
	//主键id
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
	//密码
	private String password ;
	//真实姓名
	private String realname ;
	//加密盐
	private String salt ;
	//用户名
	private String username ;
	//修改时间
	private Date modifyDateTime ;
	//注册时间
	private Date registerDateTime ;
	
	private Integer customId;

	public User() {
		super();
	}

	public User(Integer userId, Integer alarmLevelId, Integer organizationId, Integer permissionGroupId, Integer state,
			String email, String mobilePhone, String note, String password, String realname, String salt,
			String username, Date modifyDateTime, Date registerDateTime, Integer customId) {
		super();
		this.userId = userId;
		this.alarmLevelId = alarmLevelId;
		this.organizationId = organizationId;
		this.permissionGroupId = permissionGroupId;
		this.state = state;
		this.email = email;
		this.mobilePhone = mobilePhone;
		this.note = note;
		this.password = password;
		this.realname = realname;
		this.salt = salt;
		this.username = username;
		this.modifyDateTime = modifyDateTime;
		this.registerDateTime = registerDateTime;
		this.customId = customId;
	}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getModifyDateTime() {
		return modifyDateTime;
	}

	public void setModifyDateTime(Date modifyDateTime) {
		this.modifyDateTime = modifyDateTime;
	}

	public Date getRegisterDateTime() {
		return registerDateTime;
	}

	public void setRegisterDateTime(Date registerDateTime) {
		this.registerDateTime = registerDateTime;
	}

	public Integer getCustomId() {
		return customId;
	}

	public void setCustomId(Integer customId) {
		this.customId = customId;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", alarmLevelId=" + alarmLevelId + ", organizationId=" + organizationId
				+ ", permissionGroupId=" + permissionGroupId + ", state=" + state + ", email=" + email
				+ ", mobilePhone=" + mobilePhone + ", note=" + note + ", password=" + password + ", realname="
				+ realname + ", salt=" + salt + ", username=" + username + ", modifyDateTime=" + modifyDateTime
				+ ", registerDateTime=" + registerDateTime + ", customId=" + customId + "]";
	}
	
	public String toStrings() {
		String alarmLevel="";
		if(alarmLevelId==1){
			alarmLevel="初级";
		} else if (alarmLevelId == 2) {
			alarmLevel = "中级";
		}else if (alarmLevelId == 3) {
			alarmLevel = "高级";
		}else if (alarmLevelId == '4') {
			alarmLevel = "紧急";
		}
		String stat="";
		if(state==1){
			stat="可用";
		} else if (state == 2) {
			stat = "禁用";
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return username  + ","
				+ realname + ", " + mobilePhone + "," + email + "," + "organization"
				+ "," + stat + ","+alarmLevel+","+"permissionGroupId"+"," + sdf.format(registerDateTime)+","+sdf.format(modifyDateTime);
	}
	
	

}
