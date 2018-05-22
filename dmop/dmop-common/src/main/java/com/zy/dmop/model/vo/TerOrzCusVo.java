package com.zy.dmop.model.vo;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class TerOrzCusVo   implements Serializable{
	//主键id
	private Integer terminalId ;
	//组织id
	private Integer organizationId ;
	//终端编号
	private String terminalNum ;
	//姓名
	private String linkManName ;
	//手机号
	private String linkManPhone ;
	//客户id
	private Integer customId ;
	public Integer getTerminalId() {
		return terminalId;
	}
	public void setTerminalId(Integer terminalId) {
		this.terminalId = terminalId;
	}
	public Integer getOrganizationId() {
		return organizationId;
	}
	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}
	public String getTerminalNum() {
		return terminalNum;
	}
	public void setTerminalNum(String terminalNum) {
		this.terminalNum = terminalNum;
	}
	public String getLinkManPhone() {
		return linkManPhone;
	}
	public void setLinkManPhone(String linkManPhone) {
		this.linkManPhone = linkManPhone;
	}
	public Integer getCustomId() {
		return customId;
	}
	public void setCustomId(Integer customId) {
		this.customId = customId;
	}
	public String getLinkManName() {
		return linkManName;
	}
	public void setLinkManName(String linkManName) {
		this.linkManName = linkManName;
	}
	@Override
	public String toString() {
		return "TerOrzCusVo [terminalId=" + terminalId + ", organizationId=" + organizationId + ", terminalNum="
				+ terminalNum + ", linkManName=" + linkManName + ", linkManPhone=" + linkManPhone + ", customId="
				+ customId + "]";
	}
	public TerOrzCusVo(Integer terminalId, Integer organizationId, String terminalNum, String linkManName,
			String linkManPhone, Integer customId) {
		super();
		this.terminalId = terminalId;
		this.organizationId = organizationId;
		this.terminalNum = terminalNum;
		this.linkManName = linkManName;
		this.linkManPhone = linkManPhone;
		this.customId = customId;
	}
	public TerOrzCusVo() {
		super();
	}
	

}
