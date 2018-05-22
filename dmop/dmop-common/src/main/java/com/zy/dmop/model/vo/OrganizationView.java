package com.zy.dmop.model.vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class OrganizationView implements Comparable<OrganizationView>{
	
	private Integer organizationId ;
	//报警策略id
	private Integer alarmStrategyId ;
	//客户id
	private Integer customId ;
	//父组织id
	private Integer parentId ;
	//组织类型
	private Integer type ;
	//组织描述
	private String description ;
	//组织名字
	private String name ;
	//备注
	private String note ;
	//创建时间
	private Date createDateTime ;
	//修改日期
	private Date modifyDateTime ;
	
    private OrganizationView parent;
    
    private List<OrganizationView> children;

	public Integer getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}

	public Integer getAlarmStrategyId() {
		return alarmStrategyId;
	}

	public void setAlarmStrategyId(Integer alarmStrategyId) {
		this.alarmStrategyId = alarmStrategyId;
	}

	public Integer getCustomId() {
		return customId;
	}

	public void setCustomId(Integer customId) {
		this.customId = customId;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Date getCreateDateTime() {
		return createDateTime;
	}

	public void setCreateDateTime(Date createDateTime) {
		this.createDateTime = createDateTime;
	}

	public Date getModifyDateTime() {
		return modifyDateTime;
	}

	public void setModifyDateTime(Date modifyDateTime) {
		this.modifyDateTime = modifyDateTime;
	}

	public OrganizationView getParent() {
		return parent;
	}

	public void setParent(OrganizationView parent) {
		this.parent = parent;
	}

	public List<OrganizationView> getChildren() {
		if (children != null) {
			List<OrganizationView> sortedChildren = new ArrayList<OrganizationView>(children);
			Collections.sort(sortedChildren);
			return sortedChildren;
		}
		return new ArrayList<OrganizationView>();
	}
	public void addChild(OrganizationView child) {
		if (children == null) {
			children = new ArrayList<OrganizationView>();
		}
		
		children.add(child);
	}

	public void setChildren(List<OrganizationView> children) {
		this.children = children;
	}

	@Override
	public int compareTo(OrganizationView m) {
		if (m == null) {
			return -1;
		} else if (m == this) {
			return 0;
		} else if (this.organizationId < m.getOrganizationId()) {
			return -1;
		} else if (this.organizationId > m.getOrganizationId()) {
			return 1;
		}

		return 0;
	}

}
