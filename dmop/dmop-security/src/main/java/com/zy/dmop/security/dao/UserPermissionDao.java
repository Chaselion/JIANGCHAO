package com.zy.dmop.security.dao;

import java.util.List;

import com.zy.dmop.model.Permission;
import com.zy.dmop.model.vo.PermissionVo;

public interface UserPermissionDao {
	List<PermissionVo> list();

	List<PermissionVo> findByPermissionGroupId(Integer permissionGroupId);
	
	List<Permission> findPermissionFromPoolByPermissionGroupId(Integer permissiongroupId);
}
