package com.zy.dmop.model;

import java.util.Date;

public class UpsInfo {
	private Integer id;
	private String terminalId;
	//UPS厂家信息
		private String upsFactoryInfo ;
		//UPS固件版本
		private String upsHardware ;
		private String upsSerial ;
		//ups类型
		private String factoryDate ;
		//负载
		private Date modifyDateTime ;
		//日志记录时间
		private Date createDateTime ;
		private String upsSoftwareSerial ;
		//系数
		private Integer coefficient;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getTerminalId() {
			return terminalId;
		}
		public void setTerminalId(String terminalId) {
			this.terminalId = terminalId;
		}
		public String getUpsFactoryInfo() {
			return upsFactoryInfo;
		}
		public void setUpsFactoryInfo(String upsFactoryInfo) {
			this.upsFactoryInfo = upsFactoryInfo;
		}
		public String getUpsHardware() {
			return upsHardware;
		}
		public void setUpsHardware(String upsHardware) {
			this.upsHardware = upsHardware;
		}
		public String getUpsSerial() {
			return upsSerial;
		}
		public void setUpsSerial(String upsSerial) {
			this.upsSerial = upsSerial;
		}
		public String getFactoryDate() {
			return factoryDate;
		}
		public void setFactoryDate(String factoryDate) {
			this.factoryDate = factoryDate;
		}
		public Date getModifyDateTime() {
			return modifyDateTime;
		}
		public void setModifyDateTime(Date modifyDateTime) {
			this.modifyDateTime = modifyDateTime;
		}
		public Date getCreateDateTime() {
			return createDateTime;
		}
		public void setCreateDateTime(Date createDateTime) {
			this.createDateTime = createDateTime;
		}
		public String getUpsSoftwareSerial() {
			return upsSoftwareSerial;
		}
		public void setUpsSoftwareSerial(String upsSoftwareSerial) {
			this.upsSoftwareSerial = upsSoftwareSerial;
		}
		public Integer getCoefficient() {
			return coefficient;
		}
		public void setCoefficient(Integer coefficient) {
			this.coefficient = coefficient;
		}
		public UpsInfo(Integer id, String terminalId, String upsFactoryInfo, String upsHardware, String upsSerial,
				String factoryDate, Date modifyDateTime, Date createDateTime, String upsSoftwareSerial,
				Integer coefficient) {
			super();
			this.id = id;
			this.terminalId = terminalId;
			this.upsFactoryInfo = upsFactoryInfo;
			this.upsHardware = upsHardware;
			this.upsSerial = upsSerial;
			this.factoryDate = factoryDate;
			this.modifyDateTime = modifyDateTime;
			this.createDateTime = createDateTime;
			this.upsSoftwareSerial = upsSoftwareSerial;
			this.coefficient = coefficient;
		}
		public UpsInfo() {
			super();
			// TODO Auto-generated constructor stub
		}
		@Override
		public String toString() {
			return "UpsInfo [id=" + id + ", terminalId=" + terminalId + ", upsFactoryInfo=" + upsFactoryInfo
					+ ", upsHardware=" + upsHardware + ", upsSerial=" + upsSerial + ", factoryDate=" + factoryDate
					+ ", modifyDateTime=" + modifyDateTime + ", createDateTime=" + createDateTime
					+ ", upsSoftwareSerial=" + upsSoftwareSerial + ", coefficient=" + coefficient + "]";
		}
		
		
}
