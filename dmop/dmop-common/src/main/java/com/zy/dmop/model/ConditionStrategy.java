package com.zy.dmop.model;

public class ConditionStrategy {
	private Integer id;
	private Integer alarmConditioId;
	private Integer alarmStrategyId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAlarmConditioId() {
		return alarmConditioId;
	}
	public void setAlarmConditioId(Integer alarmConditioId) {
		this.alarmConditioId = alarmConditioId;
	}
	public Integer getAlarmStrategyId() {
		return alarmStrategyId;
	}
	public void setAlarmStrategyId(Integer alarmStrategyId) {
		this.alarmStrategyId = alarmStrategyId;
	}
	public ConditionStrategy(Integer id, Integer alarmConditioId, Integer alarmStrategyId) {
		super();
		this.id = id;
		this.alarmConditioId = alarmConditioId;
		this.alarmStrategyId = alarmStrategyId;
	}
	public ConditionStrategy() {
		super();
	}
	@Override
	public String toString() {
		return "ConditionStrategy [id=" + id + ", alarmConditioId=" + alarmConditioId + ", alarmStrategyId="
				+ alarmStrategyId + "]";
	}

	

	
}
