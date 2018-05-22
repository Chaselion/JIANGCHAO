package com.zy.dmop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dmop.model.TreeDataComponent;
import com.zy.dmop.model.vo.OrganizationView;

@Controller
@RequestMapping("/organization_ui")
public class OrganizationGridTreeDataComponent extends AbstractOrganizationTreeDataComponent {

	@RequestMapping(value = "/treegrid", method = RequestMethod.POST)
	@ResponseBody
	public List<TreeDataComponent> getTreeGridData() {
		List<OrganizationView> orgTree = getOrgsTree();

		List<TreeDataComponent> orgs = convert2TreeDataComponent(orgTree);
		return orgs;
	}
	@RequestMapping(value = "/ctreegrid", method = RequestMethod.POST)
	@ResponseBody
	public List<TreeDataComponent> getcTreeGridData() {
		List<OrganizationView> orgTree = getChildOrgsTree();

		List<TreeDataComponent> orgs = convert2TreeDataComponent(orgTree);
		return orgs;
	}

}
