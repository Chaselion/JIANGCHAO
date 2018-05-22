package com.zy.dmop.api.common.helper;

import java.util.List;

public class PageResult<T> {
	private Page page;
	private List<T> data;
	
	public PageResult(Page page, List<T> data) {
		this.page = page;
		this.data = data;
	}
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
}
