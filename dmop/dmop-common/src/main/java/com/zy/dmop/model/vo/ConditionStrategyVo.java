package com.zy.dmop.model.vo;

public class ConditionStrategyVo {
	private String condition_name;
	private String note;
	private Integer alarm_condition_id;
	private Integer alarm_conditionId;
	private Integer alarm_strategyId;
	public String getCondition_name() {
		return condition_name;
	}
	public void setCondition_name(String condition_name) {
		this.condition_name = condition_name;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Integer getAlarm_condition_id() {
		return alarm_condition_id;
	}
	public void setAlarm_condition_id(Integer alarm_condition_id) {
		this.alarm_condition_id = alarm_condition_id;
	}
	public Integer getAlarm_conditionId() {
		return alarm_conditionId;
	}
	public void setAlarm_conditionId(Integer alarm_conditionId) {
		this.alarm_conditionId = alarm_conditionId;
	}
	public Integer getAlarm_strategyId() {
		return alarm_strategyId;
	}
	public void setAlarm_strategyId(Integer alarm_strategyId) {
		this.alarm_strategyId = alarm_strategyId;
	}
	@Override
	public String toString() {
		return "ConditionStrategyVo [condition_name=" + condition_name + ", note=" + note + ", alarm_condition_id="
				+ alarm_condition_id + ", alarm_conditionId=" + alarm_conditionId + ", alarm_strategyId="
				+ alarm_strategyId + "]";
	}
	
	
}
