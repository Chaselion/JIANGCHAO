package com.zy.dmop.security.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dexcoder.dal.JdbcDao;
import com.dexcoder.dal.build.Criteria;
import com.zy.dmop.api.security.service.UserPermissionGroupService;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.User;
@Component("userPermissionGroupService")
public class UserPermissionGroupServiceImpl  implements UserPermissionGroupService {
	@Autowired
	private JdbcDao jdbcDao;
	@Override
	public PermissionGroup findPermissionGroupByUserId(Integer userId) {
		Criteria criteria = Criteria.select(User.class).include("permissionGroupId");
		User user = jdbcDao.get(criteria, userId.longValue());
		PermissionGroup permissionGroup = jdbcDao.get(PermissionGroup.class, user.getPermissionGroupId().longValue());
		return permissionGroup;
	}
	
}
