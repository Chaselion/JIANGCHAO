package com.zy.dmop.model;

public class AppDataCache {
	private Integer organizationId;
	private String terminalId;
	private String property;
	private Double value;
	private Integer remind;
	private Integer confirm;
	public Integer getOrganizationId() {
		return organizationId;
	}
	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}
	public String getTerminalId() {
		return terminalId;
	}
	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	public Integer getRemind() {
		return remind;
	}
	public void setRemind(Integer remind) {
		this.remind = remind;
	}
	public Integer getConfirm() {
		return confirm;
	}
	public void setConfirm(Integer confirm) {
		this.confirm = confirm;
	}
	public AppDataCache() {
		super();
	}
	public AppDataCache(Integer organizationId, String terminalId, String property, Double value, Integer remind,
			Integer confirm) {
		super();
		this.organizationId = organizationId;
		this.terminalId = terminalId;
		this.property = property;
		this.value = value;
		this.remind = remind;
		this.confirm = confirm;
	}
}
