package com.zy.dmop.util;

/**
 * GPS坐标工具类
 * @author xionghui
 *
 */
public class GPSUtil {
	public static final double PI_MINUS_QUARTER = -Math.PI / 4;
	public static final double PI_MINUS_3_QUARTER = PI_MINUS_QUARTER * 3;
	public static final double PI_MINUS = -Math.PI;
	public static final double PI_QUARTER = Math.PI / 4;
	public static final double PI_3_QUARTER = PI_QUARTER * 3;
	public static final double PI = Math.PI;
	
	private static double EARTH_RADIUS = 6371 * 1000;	// 地球半径,单位米
	
	/**
	 * 使用Haversine公式简单计算两个GPS坐标间的距离。计算时将地球简化为球体计算，
	 * 这样和真实值之间有一些误差，最大约0.3%
	 */
	public static double calculateDistance(double lat1, double long1, double lat2, double long2) {
		double deltaLat = toRadians(lat2 - lat1);
		double deltaLong = toRadians(long2 - long1);
		
		double sinDeltaLat = Math.sin(deltaLat / 2);
		double sinDeltaLong = Math.sin(deltaLong / 2);
		
		double a = sinDeltaLat * sinDeltaLat + 
				Math.cos(toRadians(lat1)) * Math.cos(toRadians(lat2)) * sinDeltaLong * sinDeltaLong;
		double distance = 2 * EARTH_RADIUS * Math.asin(Math.sqrt(a));
		return Math.abs(distance);
	}
	
	
	private static double toRadians(double degree) {
		return degree * Math.PI / 180;
	}
	
	public static double gps2d(double lng_a, double lat_a, double lng_b, double lat_b) {
//		double d = 0;
//		lat_a = lat_a * Math.PI / 180;
//		lng_a = lng_a * Math.PI / 180;
//		lat_b = lat_b * Math.PI / 180;
//		lng_b = lng_b * Math.PI / 180;
//
//		d = Math.sin(lat_a) * Math.sin(lat_b) + Math.cos(lat_a) * Math.cos(lat_b) * Math.cos(lng_b - lng_a);
//		d = Math.sqrt(1 - d * d);
//		d = Math.cos(lat_b) * Math.sin(lng_b - lng_a) / d;
//		d = Math.asin(d) * 180 / Math.PI;
//		return d;
		
//		return Math.atan2((lat_b - lat_a) / 90, (lng_b - lng_a) / 180);
		
//		double d = 0;
//		double phi1 = lat_a * Math.PI / 180;
//		double lam1 = lng_a * Math.PI / 180;
//		double phi2 = lat_b * Math.PI / 180;
//		double lam2 = lng_b * Math.PI / 180;
//		
//		return Math.atan2(Math.sin(lam2 - lam1) * Math.cos(phi2), Math.cos(phi1) * Math.sin(phi2) - Math.sin(phi1) * Math.cos(phi2) * Math.cos(lam2 - lam1));
		
		double phi1 = lat_a * Math.PI / 180;
		double lam1 = lng_a * Math.PI / 180;
		double phi2 = lat_b * Math.PI / 180;
		double lam2 = lng_b * Math.PI / 180;
		
		double y = Math.sin(lam2 - lam1) * Math.cos(phi2);
		double x = Math.cos(phi1) * Math.sin(phi2) - Math.sin(phi1) * Math.cos(phi2) * Math.cos(lam2 - lam1);
		
		return Math.atan2(y, x);
	}
	

	
}
