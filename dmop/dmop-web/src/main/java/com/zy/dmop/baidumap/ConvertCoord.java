package com.zy.dmop.baidumap;

public class ConvertCoord {
	private Object key;
	private double srcLng;
	private double srcLat;
	private double convertedLng;
	private double convertedLat;
	public Object getKey() {
		return key;
	}
	public void setKey(Object key) {
		this.key = key;
	}
	public double getSrcLng() {
		return srcLng;
	}
	public void setSrcLng(double srcLng) {
		this.srcLng = srcLng;
	}
	public double getSrcLat() {
		return srcLat;
	}
	public void setSrcLat(double srcLat) {
		this.srcLat = srcLat;
	}
	public double getConvertedLng() {
		return convertedLng;
	}
	public void setConvertedLng(double convertedLng) {
		this.convertedLng = convertedLng;
	}
	public double getConvertedLat() {
		return convertedLat;
	}
	public void setConvertedLat(double convertedLat) {
		this.convertedLat = convertedLat;
	}
	@Override
	public String toString() {
		return "ConvertCoord [key=" + key + ", srcLng=" + srcLng + ", srcLat=" + srcLat + ", convertedLng=" + convertedLng + ", convertedLat=" + convertedLat + "]";
	}
}
