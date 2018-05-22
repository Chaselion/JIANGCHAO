package com.zy.dmop.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dmop.api.alarm.dao.AlarmStrategyDao;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.service.OrganizationService;
import com.zy.dmop.model.AlarmStrategy;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.TreeDataComponent;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.OrganizationView;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;

public abstract class AbstractOrganizationTreeDataComponent {

	@Autowired
	protected OrganizationService organizationService;

	@Autowired
	protected AlarmStrategyDao alarmStrategy;

	// protected abstract String getUiProvider();

	protected List<TreeDataComponent> convert2TreeDataComponent(
			List<OrganizationView> orgs) {
		List<TreeDataComponent> treeDataComps = new ArrayList<TreeDataComponent>();

		for (OrganizationView org : orgs) {
			List<TreeDataComponent> childrenTreeDataComps = convert2TreeDataComponent(org
					.getChildren());

			TreeDataComponent tdc = convert2TreeDataComponent(org);

			tdc.setChildren(childrenTreeDataComps);

			treeDataComps.add(tdc);
		}

		return treeDataComps;
	}

	private TreeDataComponent convert2TreeDataComponent(OrganizationView org) {
		TreeDataComponent node = new TreeDataComponent();
		int alarm = org.getAlarmStrategyId();
		AlarmStrategy alarms = new AlarmStrategy();
		try {
			alarms = alarmStrategy.getAlarmStrategyById(alarm);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Object obj = CacheUtil.getModel(CacheConstant.MODEL_CUSTOM,
				org.getCustomId());
		Custom custom = (Custom) obj;

		node.setId(String.valueOf(org.getOrganizationId()));
		node.setName(org.getName());
		// node.setCls("forum");
		// node.setIconCls("");
		// node.setLeaf(!org.hasChildren());
		// node.setUiProvider(getUiProvider());

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("id", node.getId());
		// data.put("text", node.getText());
		// data.put("cls", "x-menu-bar-4");
		data.put("name", node.getName());
		// data.put("grade", "0");
		data.put("url", "");
		data.put("iconcls", "");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		data.put("create_date", sdf.format(org.getCreateDateTime()));
		data.put("modify_date", sdf.format(org.getModifyDateTime()));
		data.put("description", org.getDescription());
		data.put("note", org.getNote());
		// data.put("customId", org.getCustomId().toString());
		if (alarms.getName() != null) {

			data.put("alarmStrategyId", alarms.getName());
		} else {
			data.put("alarmStrategyId", "未设置报警策略");
		}
		if (custom != null) {
			if (org.getCustomId() == 0) {
				data.put("custom", "DMOP");
			} else {
				data.put("custom", custom.getName());
			}

		} else {
			if (org.getCustomId() == 0) {
				data.put("custom", "DMOP");
			} else {
				data.put("custom", " ");
			}
		}
		OrganizationView parentMv = org.getParent();
		if (parentMv == null) {
			data.put("belongto", null);
		} else {
			data.put("belongto", String.valueOf(parentMv.getOrganizationId()));
		}

		node.setData(data);

		return node;
	}

	protected List<OrganizationView> getOrgsTree() {
		User loginUser = SessionUtil.getCommonUserFromSession();

		List<OrganizationView> orgTree = organizationService
				.getOrgsTreeByUser(loginUser.getCustomId());
		return orgTree;
	}

	protected List<OrganizationView> getChildOrgsTree() {
		User loginUser = SessionUtil.getCommonUserFromSession();

		List<OrganizationView> orgTree = organizationService
				.findChildOrgsByParentId(loginUser.getOrganizationId());
		return orgTree;
	}

}
