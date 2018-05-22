package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Date;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class SimCardTerminalRelative   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8843108443618082212L;
	private Integer simCardTerminalRelativeId ;
	private Integer terminal_ ;
	private String terminalNum ;
	private Long cardId ;
	
	public SimCardTerminalRelative() {
	}
	
	public Integer getSimCardTerminalRelativeId(){
		return  simCardTerminalRelativeId;
	}
	public void setSimCardTerminalRelativeId(Integer simCardTerminalRelativeId ){
		this.simCardTerminalRelativeId = simCardTerminalRelativeId;
	}
	
	

	public SimCardTerminalRelative(Integer simCardTerminalRelativeId, String terminalNum, Long cardId) {
		super();
		this.simCardTerminalRelativeId = simCardTerminalRelativeId;
		this.terminalNum = terminalNum;
		this.cardId = cardId;
	}

	
	
	public String getTerminalNum() {
		return terminalNum;
	}

	public void setTerminalNum(String terminalNum) {
		this.terminalNum = terminalNum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Long getCardId(){
		return  cardId;
	}
	public void setCardId(Long cardId ){
		this.cardId = cardId;
	}

	@Override
	public String toString() {
		return "SimCardTerminalRelative [simCardTerminalRelativeId=" + simCardTerminalRelativeId + ", terminalNum="
				+ terminalNum + ", cardId=" + cardId + "]";
	}

	
	
	

}
