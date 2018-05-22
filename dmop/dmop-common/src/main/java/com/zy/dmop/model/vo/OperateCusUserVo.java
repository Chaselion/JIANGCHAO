package com.zy.dmop.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;



public class OperateCusUserVo {
	private Integer operateLogId;
	private String text;
	private String name;
	private String userName;
	private Date createDateTime;
	private Date modifyDateTime;
	private int customId;
	private int userId;
	
	public OperateCusUserVo(Integer operateLogId, String text, String name,
			String userName, Date createDateTime, Date modifyDateTime,
			int customId, int userId) {
		super();
		this.operateLogId = operateLogId;
		this.text = text;
		this.name = name;
		this.userName = userName;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
		this.customId = customId;
		this.userId = userId;
	}

	public Integer getOperateLogId() {
		return operateLogId;
	}

	public void setOperateLogId(Integer operateLogId) {
		this.operateLogId = operateLogId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public int getCustomId() {
		return customId;
	}

	public void setCustomId(int customId) {
		this.customId = customId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public OperateCusUserVo() {
		super();
	}
	public String toStrings() {
		/*String custom="";
		if("admin".equals(userName)){
			custom="admin";
		}else{
			custom=name;
		}*/
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String permissiongroupname=permissiongroupService.getPermissionGroupById(permissionGroupId).getName();
		return sdf.format(createDateTime)+ ","+ name + "," + userName + "," + text;
	}
}
