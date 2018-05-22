package com.zy.dmop.security.controller.component;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.PermissionVo;
import com.zy.dmop.security.controller.component.ui.TreeDataComponent;

@Controller
@RequestMapping("permission")
public class PermissionTreeComponent extends AbstractPermissionTreeComponent{

	@RequestMapping(value="/treegrid",method=RequestMethod.POST)
	@ResponseBody
	public List<TreeDataComponent> getTreeGridData() {
		User user = SessionUtil.getCommonUserFromSession();
		List<PermissionVo> permissionTree = getPermissionTree(user);
		List<TreeDataComponent> permissions = convert2TreeDataComponent(permissionTree);
		return permissions;
	}
	@RequestMapping(value="/treegridById",method=RequestMethod.POST)
	@ResponseBody
	public List<TreeDataComponent> getTreeGridDataById(@RequestParam Integer id) {
		User user = new User();
		user.setPermissionGroupId(id);
		List<PermissionVo> permissionTree = getPermissionTree(user);
		List<TreeDataComponent> permissions = convert2TreeDataComponent(permissionTree);
		return permissions;
	}
}
