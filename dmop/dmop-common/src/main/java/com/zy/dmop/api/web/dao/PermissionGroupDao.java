package com.zy.dmop.api.web.dao;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.User;

public interface PermissionGroupDao {
	public PermissionGroup createPermissionGroup(PermissionGroup permissiongroup);

	public PermissionGroup getPermissionGroup();

	public void deletePermissionGroup(int id);

	public void updatePermissionGroup(PermissionGroup PermissionGroup);
	
	public PageResult<PermissionGroup> pageQueryPermissionGroup(Page page);
	
	public PermissionGroup getPermissionGroupById(int permissiongroupId);
	
	//获取所有权限组缓存
	public List<PermissionGroup> getAllPermissionGroupForCache();

}
