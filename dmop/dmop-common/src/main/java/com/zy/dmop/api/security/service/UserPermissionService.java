package com.zy.dmop.api.security.service;

import java.util.List;

import com.zy.dmop.model.Permission;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.PermissionVo;

public interface UserPermissionService {

	List<Permission> findFunctionsAndFunctionPackagesByPermissionGroupId(Integer permissionGroupId);
	List<PermissionVo> getModuleTree();
	List<PermissionVo> getPermissionTreeByUser(User user);
	void print(List<PermissionVo> rootlist, String tab);
}
