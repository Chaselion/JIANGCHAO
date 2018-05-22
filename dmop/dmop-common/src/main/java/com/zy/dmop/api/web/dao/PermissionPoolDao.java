package com.zy.dmop.api.web.dao;

import java.util.List;

import com.zy.dmop.model.PermissionPool;

public interface PermissionPoolDao {

	int batchInsert(List<PermissionPool> pools);

	void delete(int id);

	int batchUpdate(List<PermissionPool> pools);

}
