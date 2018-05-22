package com.zy.dmop.util;

public class Const {
	public static final long INVALID_SYSCARID = -1L;
	public static final int INVALID_HOUR = -1;
	
	public static final long MILLISECOND_OF_A_WEEK = 7 * 24 * 60 * 60 * 1000;
	public static final long MILLISECOND_OF_A_DAY = 24 * 60 * 60 * 1000;
	public static final long MILLISECOND_OF_A_HOUR = 60 * 60 * 1000;
	public static final long MILLISECOND_OF_A_MINUTE = 60 * 1000;
	
	//班表过滤类型
//	public static final int DAILYDELIVERY_FILTER_ALL = 1;
//	public static final int DAILYDELIVERY_FILTER_PLANNED = 2;
//	public static final int DAILYDELIVERY_FILTER_NOT_PLANNED = 3;
	
	//班表过滤类型
	//public static final int DAILYDELIVERY_FILTER_ALL = 1;
	public static final int DAILYDELIVERY_FILTER_BY_COMPANY = 1;
	public static final int DAILYDELIVERY_FILTER_BY_DEPARTMENT = 2;
	public static final int DAILYDELIVERY_FILTER_BY_CARGROUP = 3;
}
