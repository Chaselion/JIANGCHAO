package com.zy.dmop.model;

public class DailyCount {
	private int id;
	private String Time;
	private int online_count;
	private int offline_count;
	private int alarm_count;
	private int throughput;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	public int getOnline_count() {
		return online_count;
	}
	public void setOnline_count(int online_count) {
		this.online_count = online_count;
	}
	public int getOffline_count() {
		return offline_count;
	}
	public void setOffline_count(int offline_count) {
		this.offline_count = offline_count;
	}
	public int getAlarm_count() {
		return alarm_count;
	}
	public void setAlarm_count(int alarm_count) {
		this.alarm_count = alarm_count;
	}
	public int getThroughput() {
		return throughput;
	}
	public void setThroughput(int throughput) {
		this.throughput = throughput;
	}

	
	
	

}
