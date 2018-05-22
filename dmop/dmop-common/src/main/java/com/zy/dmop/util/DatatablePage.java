package com.zy.dmop.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DatatablePage<T> {
	private int draw;
	private int start;
	private int length;
	private String searchValue;

	private int recordsTotal;
	private int recordsFiltered;
	private List<T> data;

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public Map<String, Object> getJSONMap() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("draw", draw);
		result.put("recordsTotal", recordsTotal);
		result.put("recordsFiltered", recordsFiltered);
		result.put("totalPage", getTotalPage());
		result.put("currentPage", getCurrentPage());
		result.put("data", data);
		return result;
	}
	
	public int getTotalPage() {
		return length == 0 ? 0 : (recordsFiltered - 1) / length + 1;
	}
	
	//从0开始
//	public int currentPage() {
//		return length == 0 ? 0 : start / length;
//	}
	
	public int getCurrentPage() {
		return length == 0 ? 0 : start / length;
	}
	
	public static void main(String[] args) {
		int length = 10;
		int start = 9;
		int recordsFiltered = 11;
		
		int totalPage = (recordsFiltered - 1) / length + 1;
		int currPage = start / length;
		
	}
}
