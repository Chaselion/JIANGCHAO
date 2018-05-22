package com.zy.dmop.resource.service;

public class IncorrectPasswordException extends RuntimeException {

	private static final long serialVersionUID = -6657337418551792161L;

	public IncorrectPasswordException() {
		super();
	}

	public IncorrectPasswordException(String message) {
		super(message);
	}

	public IncorrectPasswordException(Throwable cause) {
		super(cause);
	}

	public IncorrectPasswordException(String message, Throwable cause) {
		super(message, cause);
	}
}
