package com.zy.dmop.model.vo;

public class DeviceVo {
	private Integer device_id;
	private Integer terminal_id;
	private String name;
	private String terminal_num;
	private String ip;
	private Integer port;
	private String terminal_name;
	private float longitude;
	private float latitude;

	
	public DeviceVo(Integer device_id, Integer terminal_id, String name, String terminal_num, String ip, Integer port,
			String terminal_name, float longitude, float latitude) {
		super();
		this.device_id = device_id;
		this.terminal_id = terminal_id;
		this.name = name;
		this.terminal_num = terminal_num;
		this.ip = ip;
		this.port = port;
		this.terminal_name = terminal_name;
		this.longitude = longitude;
		this.latitude = latitude;
	}
	public Integer getDevice_id() {
		return device_id;
	}
	public void setDevice_id(Integer device_id) {
		this.device_id = device_id;
	}
	public Integer getTerminal_id() {
		return terminal_id;
	}
	public void setTerminal_id(Integer terminal_id) {
		this.terminal_id = terminal_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getTerminal_num() {
		return terminal_num;
	}
	public void setTerminal_num(String terminal_num) {
		this.terminal_num = terminal_num;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Integer getPort() {
		return port;
	}
	public void setPort(Integer port) {
		this.port = port;
	}
	public String getTerminal_name() {
		return terminal_name;
	}
	public void setTerminal_name(String terminal_name) {
		this.terminal_name = terminal_name;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	@Override
	public String toString() {
		return "DeviceVo [device_id=" + device_id + ", terminal_id=" + terminal_id + ", name=" + name
				+ ", terminal_num=" + terminal_num + ", ip=" + ip + ", port=" + port + ", terminal_name="
				+ terminal_name + ", longitude=" + longitude + ", latitude=" + latitude + "]";
	}

	
	
}
