package com.zy.dmop.model;

import java.util.Date;

public class DataNum {
	private String terminalId;
	private Date logTime;
	private Integer throughput;
	private Integer id;
	private Integer alarmVolume;
	public String getTerminalId() {
		return terminalId;
	}
	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}
	public Date getLogTime() {
		return logTime;
	}
	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}
	public Integer getThroughput() {
		return throughput;
	}
	public void setThroughput(Integer throughput) {
		this.throughput = throughput;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAlarmVolume() {
		return alarmVolume;
	}
	public void setAlarmVolume(Integer alarmVolume) {
		this.alarmVolume = alarmVolume;
	}
	public DataNum(String terminalId, Date logTime, Integer throughput,
			Integer id, Integer alarmVolume) {
		super();
		this.terminalId = terminalId;
		this.logTime = logTime;
		this.throughput = throughput;
		this.id = id;
		this.alarmVolume = alarmVolume;
	}
	public DataNum() {
		super();
	}
	@Override
	public String toString() {
		return "dataNum [terminalId=" + terminalId + ", logTime=" + logTime
				+ ", throughput=" + throughput + ", id=" + id
				+ ", alarmVolume=" + alarmVolume + "]";
	}

}
