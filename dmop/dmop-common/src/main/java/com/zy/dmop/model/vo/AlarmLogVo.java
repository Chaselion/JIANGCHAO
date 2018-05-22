package com.zy.dmop.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class AlarmLogVo {
	    //主键id
		private Long alarmLogId ;
		//报警条件名字
		private String acname ;
		//报警等级
		private String alname ;
		//客户名字
		private String cname ;
		//设备类型
		private String dcname ;
		//设备
		private String dname ;
		//是否由升级动作产生
		private Integer isRelieve ;
		//是否由解除动作产生
		private Integer isPromote ;
		//是否成功发送
		private Integer isSuccessSend ;
		//从那条报警产生
		private Integer originalAlarmLogId ;
		//终端
		private String tname ;
		//告警的值
		private Double currentAlarmProperityValue ;
		//日志记录时间
		private Date createDateTime ;
		private Date modifyDateTime ;
		public Long getAlarmLogId() {
			return alarmLogId;
		}
		public void setAlarmLogId(Long alarmLogId) {
			this.alarmLogId = alarmLogId;
		}
		public String getAcname() {
			return acname;
		}
		public void setAcname(String acname) {
			this.acname = acname;
		}
		public String getAlname() {
			return alname;
		}
		public void setAlname(String alname) {
			this.alname = alname;
		}
		public String getCname() {
			return cname;
		}
		public void setCname(String cname) {
			this.cname = cname;
		}
		public String getDcname() {
			return dcname;
		}
		public void setDcname(String dcname) {
			this.dcname = dcname;
		}
		public String getDname() {
			return dname;
		}
		public void setDname(String dname) {
			this.dname = dname;
		}
		public Integer getIsRelieve() {
			return isRelieve;
		}
		public void setIsRelieve(Integer isRelieve) {
			this.isRelieve = isRelieve;
		}
		public Integer getIsPromote() {
			return isPromote;
		}
		public void setIsPromote(Integer isPromote) {
			this.isPromote = isPromote;
		}
		public Integer getIsSuccessSend() {
			return isSuccessSend;
		}
		public void setIsSuccessSend(Integer isSuccessSend) {
			this.isSuccessSend = isSuccessSend;
		}
		public Integer getOriginalAlarmLogId() {
			return originalAlarmLogId;
		}
		public void setOriginalAlarmLogId(Integer originalAlarmLogId) {
			this.originalAlarmLogId = originalAlarmLogId;
		}
		public String getTname() {
			return tname;
		}
		public void setTname(String tname) {
			this.tname = tname;
		}
		public Double getCurrentAlarmProperityValue() {
			return currentAlarmProperityValue;
		}
		public void setCurrentAlarmProperityValue(Double currentAlarmProperityValue) {
			this.currentAlarmProperityValue = currentAlarmProperityValue;
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
		public AlarmLogVo(Long alarmLogId, String acname, String alname,
				String cname, String dcname, String dname, Integer isRelieve,
				Integer isPromote, Integer isSuccessSend,
				Integer originalAlarmLogId, String tname,
				Double currentAlarmProperityValue, Date createDateTime,
				Date modifyDateTime) {
			super();
			this.alarmLogId = alarmLogId;
			this.acname = acname;
			this.alname = alname;
			this.cname = cname;
			this.dcname = dcname;
			this.dname = dname;
			this.isRelieve = isRelieve;
			this.isPromote = isPromote;
			this.isSuccessSend = isSuccessSend;
			this.originalAlarmLogId = originalAlarmLogId;
			this.tname = tname;
			this.currentAlarmProperityValue = currentAlarmProperityValue;
			this.createDateTime = createDateTime;
			this.modifyDateTime = modifyDateTime;
		}
		public AlarmLogVo() {
			super();
		}
		@Override
		public String toString() {
			return "AlarmLogVo [alarmLogId=" + alarmLogId + ", acname="
					+ acname + ", alname=" + alname + ", cname=" + cname
					+ ", dcname=" + dcname + ", dname=" + dname
					+ ", isRelieve=" + isRelieve + ", isPromote=" + isPromote
					+ ", isSuccessSend=" + isSuccessSend
					+ ", originalAlarmLogId=" + originalAlarmLogId + ", tname="
					+ tname + ", currentAlarmProperityValue="
					+ currentAlarmProperityValue + ", createDateTime="
					+ createDateTime + ", modifyDateTime=" + modifyDateTime
					+ "]";
		}
		
		public String toStrings() {
			String relieve="";
			if(isRelieve==1){
				relieve="是";
			} else if (isRelieve == 0) {
				relieve = "否";
			}
			String stat="";
			if(isPromote==1){
				stat="是";
			} else if (isPromote == 0) {
				stat = "否";
			}
			String successSend="";
			if(isSuccessSend==1){
				successSend="是";
			} else if (isSuccessSend == 0) {
				successSend = "否";
			}
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//String permissiongroupname=permissiongroupService.getPermissionGroupById(permissionGroupId).getName();
			return sdf.format(createDateTime)  + ","
					+ acname + ", " + alname + "," + cname + "," + dcname
					+ "," + dname + ","+stat+"," +relieve+","+ successSend+","+originalAlarmLogId+","+tname+"," + currentAlarmProperityValue;
		}
}
