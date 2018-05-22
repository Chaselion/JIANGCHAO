package com.zy.dmop.model.vo;

public class UserCustomVo {
	private Integer userId ;
	
	private Integer customId ;
	
	
	private Integer customstate ;
	//状态
	private Integer userstate ;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getCustomId() {
		return customId;
	}
	public void setCustomId(Integer customId) {
		this.customId = customId;
	}
	public Integer getCustomstate() {
		return customstate;
	}
	public void setCustomstate(Integer customstate) {
		this.customstate = customstate;
	}
	public Integer getUserstate() {
		return userstate;
	}
	public void setUserstate(Integer userstate) {
		this.userstate = userstate;
	}
	public UserCustomVo(Integer userId, Integer customId, Integer customstate,
			Integer userstate) {
		super();
		this.userId = userId;
		this.customId = customId;
		this.customstate = customstate;
		this.userstate = userstate;
	}
	public UserCustomVo() {
		super();
	}
	@Override
	public String toString() {
		return "UserCustomVo [userId=" + userId + ", customId=" + customId
				+ ", customstate=" + customstate + ", userstate=" + userstate
				+ "]";
	}
	
}
