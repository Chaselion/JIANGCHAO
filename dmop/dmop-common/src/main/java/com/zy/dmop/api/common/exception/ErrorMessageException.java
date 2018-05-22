package com.zy.dmop.api.common.exception;

public class ErrorMessageException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1502172514260062913L;

	private String errorMessage;
	
	public ErrorMessageException() {
		this("程序错误，请联系管理员");
	}
	
	public ErrorMessageException(String errorMessage) {
		super(errorMessage);
		this.errorMessage = errorMessage;
	}
	
	public ErrorMessageException(String errorMessage, Throwable t) {
		super(t);
		this.errorMessage = errorMessage;
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}
}
