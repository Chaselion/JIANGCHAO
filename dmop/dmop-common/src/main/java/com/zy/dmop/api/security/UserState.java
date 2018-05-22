package com.zy.dmop.api.security;

public enum UserState {
	NULL(0), AVAILABLE(1), DISABLED(2), REMOVED(3);

	private int state;

	private UserState(int state) {
		this.state = state;
	}

	public int getState() {
		return this.state;
	}

	public static UserState valueOf(int status) {
		for (UserState userStatus : UserState.values()) {
			if (userStatus.getState() == status) {
				return userStatus;
			}
		}

		return UserState.NULL;
	}
}
