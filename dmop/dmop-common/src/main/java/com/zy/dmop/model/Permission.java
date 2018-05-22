package com.zy.dmop.model;
import java.io.Serializable;
import java.math.*;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.sql.Timestamp;

/*
* 
* gen by beetlsql 2017-10-27
*/
public class Permission   implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3809088667417614787L;
	
	private static final Map PERMISSION_BIT_TAIL;
	
	private static final String HAS_PERMISSION_OF_THIS_BIT = "1";
	private static final String LACK_PERMISSION_OF_THIS_BIT = "0";
	//主键id
	private Integer permissionId ;
	//父权限id
	private Integer belongto ;
	//增删改查导入导出权限位
	private Integer permissionBit ;
	//权限组id
	private Integer permissionGroupId ;
	//排序
	private Integer sequence ;
	//权限码
	private String code ;
	//权限描述
	private String description ;
	//图标
	private String iconcls ;
	private Integer organizationId ;
	private Integer permissionType ;
	//权限名字
	private String name ;
	//备注
	private String note ;
	//页面地址
	private String url ;
	//创建时间
	private Date createDateTime ;
	//修改时间
	private Date modifyDateTime ;
	
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
	public Permission() {
	}
	
	
	
	public Permission(Integer permissionId, Integer belongto, Integer permissionBit, Integer permissionGroupId,
			Integer sequence, String code, String description, String iconcls, Integer organizationId,
			Integer permissionType, String name, String note, String url, Date createDateTime, Date modifyDateTime) {
		super();
		this.permissionId = permissionId;
		this.belongto = belongto;
		this.permissionBit = permissionBit;
		this.permissionGroupId = permissionGroupId;
		this.sequence = sequence;
		this.code = code;
		this.description = description;
		this.iconcls = iconcls;
		this.organizationId = organizationId;
		this.permissionType = permissionType;
		this.name = name;
		this.note = note;
		this.url = url;
		this.createDateTime = createDateTime;
		this.modifyDateTime = modifyDateTime;
	}

	

	public Integer getPermissionId() {
		return permissionId;
	}



	public void setPermissionId(Integer permissionId) {
		this.permissionId = permissionId;
	}



	public Integer getBelongto() {
		return belongto;
	}



	public void setBelongto(Integer belongto) {
		this.belongto = belongto;
	}



	public Integer getPermissionBit() {
		return permissionBit;
	}



	public void setPermissionBit(Integer permissionBit) {
		this.permissionBit = permissionBit;
	}



	public Integer getPermissionGroupId() {
		return permissionGroupId;
	}



	public void setPermissionGroupId(Integer permissionGroupId) {
		this.permissionGroupId = permissionGroupId;
	}



	public Integer getSequence() {
		return sequence;
	}



	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}



	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getIconcls() {
		return iconcls;
	}



	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}



	public Integer getOrganizationId() {
		return organizationId;
	}



	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}



	public Integer getPermissionType() {
		return permissionType;
	}



	public void setPermissionType(Integer permissionType) {
		this.permissionType = permissionType;
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



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
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



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public static Map getPermissionBitTail() {
		return PERMISSION_BIT_TAIL;
	}



	public static String getHasPermissionOfThisBit() {
		return HAS_PERMISSION_OF_THIS_BIT;
	}



	public static String getLackPermissionOfThisBit() {
		return LACK_PERMISSION_OF_THIS_BIT;
	}
	
	
	public HashSet<String> generatePermissionArray(){
		String bitStr = Integer.toBinaryString(this.permissionBit);
		String tmp = "00000000"+bitStr;
		String bitStrFull = tmp.substring(tmp.length()-8, tmp.length());
		String[] bitArray = bitStrFull.split("");
		HashSet<String> hashSet = new HashSet<>();
		for(int i = 0;i<bitArray.length;i++){			
			if(HAS_PERMISSION_OF_THIS_BIT.equals(bitArray[i])){
				StringBuffer sb = new StringBuffer(this.code);
				sb.append(PERMISSION_BIT_TAIL.get(i));
				hashSet.add(sb.toString());
			}
		}
		return hashSet;		
	}
	public String generatePermission(String action){
		return this.code+"." + action;
	}



	@Override
	public String toString() {
		return "Permission [permissionId=" + permissionId + ", belongto=" + belongto + ", permissionBit="
				+ permissionBit + ", permissionGroupId=" + permissionGroupId + ", sequence=" + sequence + ", code="
				+ code + ", description=" + description + ", iconcls=" + iconcls + ", organizationId=" + organizationId
				+ ", permissionType=" + permissionType + ", name=" + name + ", note=" + note + ", url=" + url
				+ ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime + "]";
	}
	
	
	
	
	

}
