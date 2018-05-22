package com.zy.dmop.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {
	public static long getTimeOfDate(String dateSource, String pattern) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = sdf.parse(dateSource);
		return date.getTime();
	}

	public static String format(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}
	
    public static boolean isSameDayOfMillis(final long ms1, final long ms2) {
        final long interval = ms1 - ms2;
        return interval < Const.MILLISECOND_OF_A_DAY
                && interval > -1L * Const.MILLISECOND_OF_A_DAY
                && toDay(ms1) == toDay(ms2);
    }
    
    private static long toDay(long millis) {
        return (millis + TimeZone.getDefault().getOffset(millis)) / Const.MILLISECOND_OF_A_DAY;
    }
    
    public static void main(String[] args) {
		long day = System.currentTimeMillis();
		day = toDay(day);
		
		long day2 = day + Const.MILLISECOND_OF_A_DAY;
		
		
	}
}