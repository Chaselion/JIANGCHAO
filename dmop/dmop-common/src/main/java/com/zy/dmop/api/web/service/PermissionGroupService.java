package com.zy.dmop.api.web.service;

import java.util.List;
import java.util.Map;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.TreeDataComponent;

public interface PermissionGroupService {
public PageResult<PermissionGroup> pageQueryPermissionGroup(Page page);
	
	boolean createPermissionGroup(PermissionGroup permissiongroup,List<Map<String,Object>> poolData);
	
	void deletePermissionGroup(int id) throws Exception;
	
    PermissionGroup getPermissionGroupById(int permissiongroupId);
    
    boolean updatePermissionGroup(PermissionGroup permissiongroup,List<Map<String, Object>> poolData) throws Exception;

    List<PermissionGroup> getPermissionGroupByOrganization(Integer organization) throws Exception;

}
