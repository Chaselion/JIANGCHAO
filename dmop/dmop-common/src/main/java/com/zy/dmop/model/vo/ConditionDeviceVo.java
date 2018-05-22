package com.zy.dmop.model.vo;

import java.util.Date;

public class ConditionDeviceVo {
	//主键id
		private Integer alarmConditionId ;
		//报警策略id
		private Integer alarmStrategyId ;
		//客户id
		private Integer customId ;
		//设备类型id
		private Integer deviceClassId ;
		//设备属性id
		private Integer deviceProperityId ;
		//是否启用
		private Integer ifActive ;
		//是否自动升级
		private Integer ifAutoPromote ;
		//解除时是否通知
		private Integer ifRelieveNotice ;
		//初始报警等级
		private Integer initialAlarmLevelId;
		//判断规则
		private Integer judgeRule;
		//自动升级条件编号
		private Integer promoteCondition ;
		//解除所需时长
		private Integer relieveDuration ;
		//重复时间
		private Integer repeatTime ;
		//触发所需时长
		private Integer triggerDuration ;
		//条件名字
		private String conditionName ;
		//判断规则左区间
		private Double judgeJuniorValue ;
		//判断规则右区间
		private Double judgeSeniorValue ;
		//备注
		private String note ;
		//自动升级条件对应阈值
		private Double promoteValue ;
		//创建时间
		private Date createDateTime ;
		//修改时间
		private Date modifyDateTime ;
		//设备类别
		private String deviceClassName;
		//设备属性
		private String deviceProperityName;
		public Integer getAlarmConditionId() {
			return alarmConditionId;
		}
		public void setAlarmConditionId(Integer alarmConditionId) {
			this.alarmConditionId = alarmConditionId;
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
		public Integer getDeviceClassId() {
			return deviceClassId;
		}
		public void setDeviceClassId(Integer deviceClassId) {
			this.deviceClassId = deviceClassId;
		}
		public Integer getDeviceProperityId() {
			return deviceProperityId;
		}
		public void setDeviceProperityId(Integer deviceProperityId) {
			this.deviceProperityId = deviceProperityId;
		}
		public Integer getIfActive() {
			return ifActive;
		}
		public void setIfActive(Integer ifActive) {
			this.ifActive = ifActive;
		}
		public Integer getIfAutoPromote() {
			return ifAutoPromote;
		}
		public void setIfAutoPromote(Integer ifAutoPromote) {
			this.ifAutoPromote = ifAutoPromote;
		}
		public Integer getIfRelieveNotice() {
			return ifRelieveNotice;
		}
		public void setIfRelieveNotice(Integer ifRelieveNotice) {
			this.ifRelieveNotice = ifRelieveNotice;
		}
		public Integer getInitialAlarmLevelId() {
			return initialAlarmLevelId;
		}
		public void setInitialAlarmLevelId(Integer initialAlarmLevelId) {
			this.initialAlarmLevelId = initialAlarmLevelId;
		}
		public Integer getJudgeRule() {
			return judgeRule;
		}
		public void setJudgeRule(Integer judgeRule) {
			this.judgeRule = judgeRule;
		}
		public Integer getPromoteCondition() {
			return promoteCondition;
		}
		public void setPromoteCondition(Integer promoteCondition) {
			this.promoteCondition = promoteCondition;
		}
		public Integer getRelieveDuration() {
			return relieveDuration;
		}
		public void setRelieveDuration(Integer relieveDuration) {
			this.relieveDuration = relieveDuration;
		}
		public Integer getRepeatTime() {
			return repeatTime;
		}
		public void setRepeatTime(Integer repeatTime) {
			this.repeatTime = repeatTime;
		}
		public Integer getTriggerDuration() {
			return triggerDuration;
		}
		public void setTriggerDuration(Integer triggerDuration) {
			this.triggerDuration = triggerDuration;
		}
		public String getConditionName() {
			return conditionName;
		}
		public void setConditionName(String conditionName) {
			this.conditionName = conditionName;
		}
		public Double getJudgeJuniorValue() {
			return judgeJuniorValue;
		}
		public void setJudgeJuniorValue(Double judgeJuniorValue) {
			this.judgeJuniorValue = judgeJuniorValue;
		}
		public Double getJudgeSeniorValue() {
			return judgeSeniorValue;
		}
		public void setJudgeSeniorValue(Double judgeSeniorValue) {
			this.judgeSeniorValue = judgeSeniorValue;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}
		public Double getPromoteValue() {
			return promoteValue;
		}
		public void setPromoteValue(Double promoteValue) {
			this.promoteValue = promoteValue;
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
		public String getDeviceClassName() {
			return deviceClassName;
		}
		public void setDeviceClassName(String deviceClassName) {
			this.deviceClassName = deviceClassName;
		}
		public String getDeviceProperityName() {
			return deviceProperityName;
		}
		public void setDeviceProperityName(String deviceProperityName) {
			this.deviceProperityName = deviceProperityName;
		}
		@Override
		public String toString() {
			return "ConditionDeviceVo [alarmConditionId=" + alarmConditionId + ", alarmStrategyId=" + alarmStrategyId
					+ ", customId=" + customId + ", deviceClassId=" + deviceClassId + ", deviceProperityId="
					+ deviceProperityId + ", ifActive=" + ifActive + ", ifAutoPromote=" + ifAutoPromote
					+ ", ifRelieveNotice=" + ifRelieveNotice + ", initialAlarmLevelId=" + initialAlarmLevelId
					+ ", judgeRule=" + judgeRule + ", promoteCondition=" + promoteCondition + ", relieveDuration="
					+ relieveDuration + ", repeatTime=" + repeatTime + ", triggerDuration=" + triggerDuration
					+ ", conditionName=" + conditionName + ", judgeJuniorValue=" + judgeJuniorValue
					+ ", judgeSeniorValue=" + judgeSeniorValue + ", note=" + note + ", promoteValue=" + promoteValue
					+ ", createDateTime=" + createDateTime + ", modifyDateTime=" + modifyDateTime + ", deviceClassName="
					+ deviceClassName + ", deviceProperityName=" + deviceProperityName + "]";
		}
		public ConditionDeviceVo(Integer alarmConditionId, Integer alarmStrategyId, Integer customId,
				Integer deviceClassId, Integer deviceProperityId, Integer ifActive, Integer ifAutoPromote,
				Integer ifRelieveNotice, Integer initialAlarmLevelId, Integer judgeRule, Integer promoteCondition,
				Integer relieveDuration, Integer repeatTime, Integer triggerDuration, String conditionName,
				Double judgeJuniorValue, Double judgeSeniorValue, String note, Double promoteValue, Date createDateTime,
				Date modifyDateTime, String deviceClassName, String deviceProperityName) {
			super();
			this.alarmConditionId = alarmConditionId;
			this.alarmStrategyId = alarmStrategyId;
			this.customId = customId;
			this.deviceClassId = deviceClassId;
			this.deviceProperityId = deviceProperityId;
			this.ifActive = ifActive;
			this.ifAutoPromote = ifAutoPromote;
			this.ifRelieveNotice = ifRelieveNotice;
			this.initialAlarmLevelId = initialAlarmLevelId;
			this.judgeRule = judgeRule;
			this.promoteCondition = promoteCondition;
			this.relieveDuration = relieveDuration;
			this.repeatTime = repeatTime;
			this.triggerDuration = triggerDuration;
			this.conditionName = conditionName;
			this.judgeJuniorValue = judgeJuniorValue;
			this.judgeSeniorValue = judgeSeniorValue;
			this.note = note;
			this.promoteValue = promoteValue;
			this.createDateTime = createDateTime;
			this.modifyDateTime = modifyDateTime;
			this.deviceClassName = deviceClassName;
			this.deviceProperityName = deviceProperityName;
		}
		public ConditionDeviceVo() {
			super();
		}
		
}
