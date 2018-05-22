package com.zy.dmop.model;

public class StatusCounter {
	private int statusCode;
	private int count;
	
	public StatusCounter(int statusCode) {
		this.statusCode = statusCode;
		this.count = 0;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void increaseCount() {
		count++;
	}
	@Override
	public String toString() {
		return "StatusCounter [statusCode=" + statusCode + ", count=" + count + ", getStatusCode()=" + getStatusCode()
				+ ", getCount()=" + getCount() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
