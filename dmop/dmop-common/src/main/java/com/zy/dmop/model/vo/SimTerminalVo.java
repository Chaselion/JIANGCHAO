package com.zy.dmop.model.vo;

import java.util.Date;

public class SimTerminalVo {
	private Long simCardId;
	private Integer simPackageId;
	private float balance;
	private Integer customId;
	private String terminalNum;
	private String packageName;
	private Date createDateTime;
	private Date modifyDateTime;
	
	public Long getSimCardId() {
		return simCardId;
	}
	public void setSimCardId(Long simCardId) {
		this.simCardId = simCardId;
	}
	public Integer getSimPackageId() {
		return simPackageId;
	}
	public void setSimPackageId(Integer simPackageId) {
		this.simPackageId = simPackageId;
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public Integer getCustomId() {
		return customId;
	}
	public void setCustomId(Integer customId) {
		this.customId = customId;
	}
	public String getTerminalNum() {
		return terminalNum;
	}
	public void setTerminalNum(String terminalNum) {
		this.terminalNum = terminalNum;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
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
	public SimTerminalVo() {
		super();
	}
	@Override
	public String toString() {
		return "SimTerminalVo [simCardId=" + simCardId + ", simPackageId=" + simPackageId + ", balance=" + balance
				+ ", customId=" + customId + ", terminalNum=" + terminalNum + ", packageName=" + packageName
				+ ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime + "]";
	}
	public SimTerminalVo(Long simCardId, Integer simPackageId, float balance, Integer customId, String terminalNum,
			String packageName, Date createDateTime, Date modifyDateTime) {
		super();
		this.simCardId = simCardId;
		this.simPackageId = simPackageId;
		this.balance = balance;
		this.customId = customId;
		this.terminalNum = terminalNum;
		this.packageName = packageName;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}
	
	
}
