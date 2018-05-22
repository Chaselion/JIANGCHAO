package com.zy.dmop.model;

import java.util.Map;

public class MapMarker {
	private String id;
	private String name;
	private boolean unknown;
	private double longitude;
	private double latitude;
	private int status;
	private String icon;
	
	private Map<String, Object> data;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean getUnknown() {
		return unknown;
	}

	public void setUnknown(boolean unknown) {
		this.unknown = unknown;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MapMarker [id=" + id + ", name=" + name + ", unknown=" + unknown + ", longitude=" + longitude
				+ ", latitude=" + latitude + ", status=" + status + ", icon=" + icon + ", data=" + data + "]";
	}
	
}
