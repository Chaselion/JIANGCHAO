package com.zy.dmop.model.vo;

public class ConditionProperityVo {
		//主键id
		private Integer alarmConditionId ;
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
		//判断规则左区间
		private Double judgeJuniorValue ;
		//判断规则右区间
		private Double judgeSeniorValue ;
		//自动升级条件对应阈值
		private Double promoteValue ;
		//设备属性名字
		private String name ;
		//设备英文名字
		private String englishName;
		public Integer getAlarmConditionId() {
			return alarmConditionId;
		}
		public void setAlarmConditionId(Integer alarmConditionId) {
			this.alarmConditionId = alarmConditionId;
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
		public Double getPromoteValue() {
			return promoteValue;
		}
		public void setPromoteValue(Double promoteValue) {
			this.promoteValue = promoteValue;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEnglishName() {
			return englishName;
		}
		public void setEnglishName(String englishName) {
			this.englishName = englishName;
		}
		@Override
		public String toString() {
			return "ConditionDeviceVo [alarmConditionId=" + alarmConditionId + ", deviceProperityId="
					+ deviceProperityId + ", ifActive=" + ifActive + ", ifAutoPromote=" + ifAutoPromote
					+ ", ifRelieveNotice=" + ifRelieveNotice + ", initialAlarmLevelId=" + initialAlarmLevelId
					+ ", judgeRule=" + judgeRule + ", promoteCondition=" + promoteCondition + ", relieveDuration="
					+ relieveDuration + ", repeatTime=" + repeatTime + ", triggerDuration=" + triggerDuration
					+ ", judgeJuniorValue=" + judgeJuniorValue + ", judgeSeniorValue=" + judgeSeniorValue
					+ ", promoteValue=" + promoteValue + ", name=" + name + ", englishName=" + englishName + "]";
		}
		public ConditionProperityVo(Integer alarmConditionId, Integer deviceProperityId, Integer ifActive,
				Integer ifAutoPromote, Integer ifRelieveNotice, Integer initialAlarmLevelId, Integer judgeRule,
				Integer promoteCondition, Integer relieveDuration, Integer repeatTime, Integer triggerDuration,
				Double judgeJuniorValue, Double judgeSeniorValue, Double promoteValue, String name,
				String englishName) {
			super();
			this.alarmConditionId = alarmConditionId;
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
			this.judgeJuniorValue = judgeJuniorValue;
			this.judgeSeniorValue = judgeSeniorValue;
			this.promoteValue = promoteValue;
			this.name = name;
			this.englishName = englishName;
		}
		public ConditionProperityVo() {
			super();
		}
		
}
