package com.zy.dmop.api.common.helper;


public class Page {
//	private static final int LIMIT_ZERO = 0;
//	private static final int LIMIT_MAX = 100;
//	private static final int START_ZERO = 0;
	
	private int start;
	private int limit;
	private int count;
	private int strategyId;
	public int getStrategyId() {
		return strategyId;
	}
	public void setStrategyId(int strategyId) {
		this.strategyId = strategyId;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public int getTotalPage() {
		return limit == 0 ? 0 : (count - 1) / limit + 1;
	}
	
	public int getCurrentPage() {
		return limit == 0 ? 0 : start / limit;
	}
//	
//	public static final Page extractPageFromMap(Map<String, Object> map) {
//		int limit = convertLimit((String) map.get("limit"));
//		int start = convertStart((String) map.get("start"));
//		
//		Page p = new Page();
//		p.setLimit(limit);
//		p.setStart(start);
//		
//		return p;
//	}
//	
//	private static int convertStart(String startStr) {
//		if (StringUtil.isNullOrEmpty(startStr)) {
//			return START_ZERO;
//		}
//		
//		int start = START_ZERO;
//		try {
//			start = Integer.parseInt(startStr);
//		} catch (Exception e) {
//		}
//		
//		if (start < START_ZERO) {
//			start = START_ZERO;
//		}
//		
//		return start;
//	}
//
//	private static int convertLimit(String limitStr) {
//		// TODO Auto-generated method stub
//		if (StringUtil.isNullOrEmpty(limitStr)) {
//			return LIMIT_ZERO ;
//		}
//		
//		int limit = LIMIT_ZERO;
//		
//		try {
//			limit = Integer.parseInt(limitStr);
//		} catch (Exception e) {
//		}
//		
//		if (limit < LIMIT_ZERO || limit > LIMIT_MAX) {
//			limit = LIMIT_MAX;
//		}
//		
//		return limit;
//	}
}
