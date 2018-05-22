package com.zy.dmop.security.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dexcoder.dal.JdbcDao;
import com.zy.dmop.api.security.service.UserPermissionService;
import com.zy.dmop.model.Permission;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.PermissionVo;
import com.zy.dmop.security.dao.UserPermissionDao;

@Component("userPermissionService")
public class UserPermissionServiceImpl implements UserPermissionService {
	@Autowired
	private JdbcDao jdbcDao;
	@Autowired
	private UserPermissionDao userPermissionDao;

	@Override
	public List<Permission> findFunctionsAndFunctionPackagesByPermissionGroupId(Integer permissionGroupId) {		
		return userPermissionDao.findPermissionFromPoolByPermissionGroupId(permissionGroupId);
	}
	@Override
	public List<PermissionVo> getPermissionTreeByUser(User user){
		List<PermissionVo> list = userPermissionDao.findByPermissionGroupId(user.getPermissionGroupId());
		List<PermissionVo> tree = makeTree(list);
		
		return tree;
		
	}
	@Override
	public List<PermissionVo> getModuleTree() {
		List<PermissionVo> list = userPermissionDao.list();
		List<PermissionVo> rootlist = makeTree(list);
		//print(rootlist, "");
		return rootlist;
	}
	
	private List<PermissionVo> makeTree(List<PermissionVo> list) {
		if (list.isEmpty()) {
			return new ArrayList<PermissionVo>();
		}
		List<PermissionVo> parentList = new ArrayList<>();
		List<PermissionVo> childrenList = new ArrayList<>();
		Map<Integer, PermissionVo> parnets = new HashMap<>();

		for (PermissionVo permission : list) {
			if (permission.getBelongto()>0) {
				childrenList.add(permission);
			} else {
				parentList.add(permission);
				parnets.put(permission.getId(), permission);
			}
		}
		makeChildren(parnets, childrenList);
		Collections.sort(parentList);
		return parentList;
	}

	private void makeChildren(Map<Integer, PermissionVo> parnets, List<PermissionVo> childrenList) {
		if (childrenList.isEmpty()) {
			return;
		}
		List<PermissionVo> parentHasFound = new ArrayList<>();
		for (PermissionVo child : childrenList) {
			if (child.getBelongto()>0) {
				PermissionVo parent = parnets.get(child.getBelongto());
				if (null != parent) {
					parent.addChildren(child);
					child.setParent(parent);
					parentHasFound.add(child);
					parnets.put(child.getId(), child);
				}
			}
		}
		childrenList.removeAll(parentHasFound);
		makeChildren(parnets, childrenList);
	}
	@Override
	public void print(List<PermissionVo> rootlist, String tab) {
		for (PermissionVo vo : rootlist) {

			if (vo.getChildren() != null && vo.getChildren().size() > 0) {
				print(vo.getChildren(), tab + "\t");
			}
		}
	}
}
