package com.zy.dmop.model;

import java.util.List;
import java.util.Map;

public class TreeDataComponent {
	private String id;
	private String name;
	private Map<String, Object> data;
	private List<TreeDataComponent> children;
	private String state;
	private boolean checked;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	public List<TreeDataComponent> getChildren() {
		return children;
	}
	public void setChildren(List<TreeDataComponent> children) {
		this.children = children;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	@Override
	public String toString() {
		return "TreeDataComponent [id=" + id + ", name=" + name + ", data=" + data + ", children=" + children
				+ ", state=" + state + ", checked=" + checked + "]";
	}
}
