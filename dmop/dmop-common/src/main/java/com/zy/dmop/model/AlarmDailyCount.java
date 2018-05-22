package com.zy.dmop.model;

public class AlarmDailyCount {
	private long day;
	private long tenantId;
	private int criticalCount;
	private int majorCount;
	private int minorCount;
	private int warningCount;
	
	public long getDay() {
		return day;
	}
	public void setDay(long day) {
		this.day = day;
	}
	public long getTenantId() {
		return tenantId;
	}
	public void setTenantId(long tenantId) {
		this.tenantId = tenantId;
	}
	public int getCriticalCount() {
		return criticalCount;
	}
	public void setCriticalCount(int criticalCount) {
		this.criticalCount = criticalCount;
	}
	public int getMajorCount() {
		return majorCount;
	}
	public void setMajorCount(int majorCount) {
		this.majorCount = majorCount;
	}
	public int getMinorCount() {
		return minorCount;
	}
	public void setMinorCount(int minorCount) {
		this.minorCount = minorCount;
	}
	public int getWarningCount() {
		return warningCount;
	}
	public void setWarningCount(int warningCount) {
		this.warningCount = warningCount;
	}
}
