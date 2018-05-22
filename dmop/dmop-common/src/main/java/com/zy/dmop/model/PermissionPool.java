package com.zy.dmop.model;

public class PermissionPool {
	//主键id
	private Integer permissionPoolId;
	//权限id
	private Integer permissionId;
	//权限组id
	private Integer permissionGroupId;
	//权限位
	private Integer permissionBit;
	public PermissionPool() {
	}
	public PermissionPool(Integer permissionPoolId, Integer permissionId, Integer permissionGroupId,
			Integer permissionBit) {
		this.permissionPoolId = permissionPoolId;
		this.permissionId = permissionId;
		this.permissionGroupId = permissionGroupId;
		this.permissionBit = permissionBit;
	}
	public Integer getPermissionPoolId() {
		return permissionPoolId;
	}
	public void setPermissionPoolId(Integer permissionPoolId) {
		this.permissionPoolId = permissionPoolId;
	}
	public Integer getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(Integer permissionId) {
		this.permissionId = permissionId;
	}
	public Integer getPermissionGroupId() {
		return permissionGroupId;
	}
	public void setPermissionGroupId(Integer permissionGroupId) {
		this.permissionGroupId = permissionGroupId;
	}
	public Integer getPermissionBit() {
		return permissionBit;
	}
	public void setPermissionBit(Integer permissionBit) {
		this.permissionBit = permissionBit;
	}
	@Override
	public String toString() {
		return "PermissionPool [permissionPoolId=" + permissionPoolId + ", permissionId=" + permissionId
				+ ", permissionGroupId=" + permissionGroupId + ", permissionBit=" + permissionBit + "]";
	}
	
}
