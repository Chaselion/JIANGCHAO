package com.zy.dmop.security.controller.component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.zy.dmop.api.security.service.UserPermissionService;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.PermissionVo;
import com.zy.dmop.security.controller.component.ui.TreeDataComponent;

public abstract class AbstractPermissionTreeComponent {
	@Autowired
	protected UserPermissionService userPermissionService;

	protected List<TreeDataComponent> convert2TreeDataComponent(List<PermissionVo> permissions) {
		List<TreeDataComponent> components = new ArrayList<TreeDataComponent>();
		for (PermissionVo permission : permissions) {
			List<TreeDataComponent> children = convert2TreeDataComponent(permission.getChildren());
			TreeDataComponent parent = convert2TreeDataComponent(permission);
			parent.setChildren(children);
			components.add(parent);
		}

		return components;
	}

	protected TreeDataComponent convert2TreeDataComponent(PermissionVo permission) {
		TreeDataComponent component = new TreeDataComponent();
		component.setId(String.valueOf(permission.getId()));
		component.setName(permission.getText());
		if(!permission.getChildren().isEmpty()&&null!=permission.getChildren()){
			component.setState("closed");
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("id", component.getId());
		data.put("text", component.getName());
		data.put("code", permission.getConfig_meta_code());
		//String code = JSON.toJSONString(permission.generatePermissionArray());
		data.put("bit", permission.generatePermissionArray());
		
		PermissionVo parent = permission.getParent();
		if (null == parent) {
			data.put("belongto", null);
		} else {
			data.put("belongto", String.valueOf(parent.getId()));
		}
		component.setData(data);
		return component;
	}

	protected List<PermissionVo> getPermissionTree(User user) {
		
		List<PermissionVo> tree = userPermissionService.getPermissionTreeByUser(user);

		return tree;
	}

}
