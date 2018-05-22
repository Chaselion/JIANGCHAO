package com.zy.dmop.model.vo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zy.dmop.util.JsonUtil;

public class PermissionVo implements Comparable<PermissionVo> {
private static final Map PERMISSION_BIT_TAIL;
	
	private static final String HAS_PERMISSION_OF_THIS_BIT = "1";
	private static final String LACK_PERMISSION_OF_THIS_BIT = "0";
	private Integer id ;
	//父权限id
	private Integer belongto ;
	
	
	//排序
	private Integer sequence ;
	//权限码
	private String config_meta_code ;
	
	//图标
	private String iconcls ;
	
	//权限名字
	private String text ;
	
	//页面地址
	private String url ;
	@JsonIgnore
	private PermissionVo parent;
	
	private List<PermissionVo> children;
	
	private Integer permissionBit;
	static{
		HashMap<Integer, String> hashMap = new HashMap<>();
		hashMap.put(0, ".px");
		hashMap.put(1, ".py");
		hashMap.put(2, ".update");
		hashMap.put(3, ".delete");
		hashMap.put(4, ".import");
		hashMap.put(5, ".add");
		hashMap.put(6, ".export");
		hashMap.put(7, ".show");
		PERMISSION_BIT_TAIL = Collections.unmodifiableMap(hashMap);
	}
	public PermissionVo() {
		super();
	}

	
	public PermissionVo(Integer id, Integer belongto, Integer sequence, String config_meta_code, String iconcls,
			String text, String url, PermissionVo parent, List<PermissionVo> children, Integer permissionBit) {
		super();
		this.id = id;
		this.belongto = belongto;
		this.sequence = sequence;
		this.config_meta_code = config_meta_code;
		this.iconcls = iconcls;
		this.text = text;
		this.url = url;
		this.parent = parent;
		this.children = children;
		this.permissionBit = permissionBit;
	}


	public HashSet<String> generatePermissionArray(){
		String bitStr = Integer.toBinaryString(this.permissionBit);
		String tmp = "00000000"+bitStr;
		String bitStrFull = tmp.substring(tmp.length()-8, tmp.length());
		String[] bitArray = bitStrFull.split("");
		HashSet<String> hashSet = new HashSet<>();
		for(int i = 0;i<bitArray.length;i++){			
			if(HAS_PERMISSION_OF_THIS_BIT.equals(bitArray[i])){
				StringBuffer sb = new StringBuffer(this.config_meta_code);
				sb.append(PERMISSION_BIT_TAIL.get(i));
				hashSet.add(sb.toString());
			}
		}
		return hashSet;		
	}
	public String generatePermission(String action){
		return this.config_meta_code+"." + action;
	}
	
	public Integer getPermissionBit() {
		return permissionBit;
	}


	public void setPermissionBit(Integer permissionBit) {
		this.permissionBit = permissionBit;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBelongto() {
		return belongto;
	}

	public void setBelongto(Integer belongto) {
		this.belongto = belongto;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public String getConfig_meta_code() {
		return config_meta_code;
	}

	public void setConfig_meta_code(String config_meta_code) {
		this.config_meta_code = config_meta_code;
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

	public PermissionVo getParent() {
		return parent;
	}

	public void setParent(PermissionVo parent) {
		this.parent = parent;
	}
	
	public void setChildren(List<PermissionVo> children) {
		this.children = children;
	}


	public List<PermissionVo> getChildren() {
		if(children!=null){
			List<PermissionVo> sortedChildren = new ArrayList<PermissionVo>(children);
			Collections.sort(sortedChildren);
			return sortedChildren;
		}
		return new ArrayList<PermissionVo>();
	}

	public void addChildren(PermissionVo vo) {
		if(null==children){
			children= new ArrayList<>();
		}
		children.add(vo);
	}
	public boolean  hasChildren(){
		return null!=children&&!children.isEmpty();
	}

	@Override
	public int compareTo(PermissionVo permissionVo) {
		if(null==permissionVo){
			return -1;
		}else if(permissionVo==this){
			return 0;
		}else if(this.sequence<permissionVo.sequence){
			return -1;
		}else if(this.sequence>permissionVo.sequence){
			return 1;
		}

		return 0;
	}
	@Override
	public String toString() {
		try {
			return JsonUtil.objectToString(this);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "转换失败";
	}



	
	
}
