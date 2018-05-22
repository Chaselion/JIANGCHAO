package com.zy.dmop.api.security.service;

import com.zy.dmop.model.PermissionGroup;

public interface UserPermissionGroupService {
	PermissionGroup findPermissionGroupByUserId(Integer userId);
}
