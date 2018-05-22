package com.zy.dmop.model.vo;

public class TerminalVO {
	private Integer start;
	private Integer limit;
	private String terminal_id;
	private Integer custom_id;
	public TerminalVO() {
		super();
	}


	



	public TerminalVO(Integer start, Integer limit, String terminal_id, Integer custom_id) {
		super();
		this.start = start;
		this.limit = limit;
		this.terminal_id = terminal_id;
		this.custom_id = custom_id;
	}

	public Integer getCustom_id() {
		return custom_id;
	}

	public void setCustom_id(Integer custom_id) {
		this.custom_id = custom_id;
	}


	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public String getTerminal_id() {
		return terminal_id;
	}






	public void setTerminal_id(String terminal_num) {
		this.terminal_id = terminal_id;
	}






	@Override
	public String toString() {
		return "TerminalVO [start=" + start + ", limit=" + limit + ", terminal_id=" + terminal_id + "]";
	}
	
	
}
