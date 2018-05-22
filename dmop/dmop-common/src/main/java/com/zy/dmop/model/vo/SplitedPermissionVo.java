package com.zy.dmop.model.vo;

import java.io.IOException;
import java.util.List;

import com.zy.dmop.util.JsonUtil;

public class SplitedPermissionVo {

	private Integer id ;
	
	//图标
	private String iconcls ;
	
	//权限名字
	private String text ;
	
	//页面地址
	private String url ;

	private List<SplitedPermissionVo[]> children;
	private String color;
	private Boolean isFat;
	private Boolean isTall;
	


	
	public SplitedPermissionVo() {
	}
	
	public SplitedPermissionVo(Integer id, String iconcls, String text, String url,
			List<SplitedPermissionVo[]> children, String color, Boolean isFat, Boolean isTall) {
		super();
		this.id = id;
		this.iconcls = iconcls;
		this.text = text;
		this.url = url;
		this.children = children;
		this.color = color;
		this.isFat = isFat;
		this.isTall = isTall;
	}
	
	public Boolean getIsFat() {
		return isFat;
	}

	public void setIsFat(Boolean isFat) {
		this.isFat = isFat;
	}

	public Boolean getIsTall() {
		return isTall;
	}

	public void setIsTall(Boolean isTall) {
		this.isTall = isTall;
	}

	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIconcls() {
		return iconcls;
	}

	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<SplitedPermissionVo[]> getChildren() {
		return children;
	}

	public void setChildren(List<SplitedPermissionVo[]> children) {
		this.children = children;
	}
	
	
	@Override
	public String toString() {
		String childjson = "";
		try {
			childjson = JsonUtil.objectToString(children);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "SplitedPermissionVo [id=" + id + ", iconcls=" + iconcls + ", text=" + text + ", url=" + url
				+ ", children=" + childjson + "]";
	}

}