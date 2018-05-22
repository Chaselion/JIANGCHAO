package com.zy.dmop.model;

public class MeasureStrategy {
	private Integer id;
	private Integer alarmMeasureId;
	private Integer alarmStrategyId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAlarmMeasureId() {
		return alarmMeasureId;
	}
	public void setAlarmMeasureId(Integer alarmMeasureId) {
		this.alarmMeasureId = alarmMeasureId;
	}
	public Integer getAlarmStrategyId() {
		return alarmStrategyId;
	}
	public void setAlarmStrategyId(Integer alarmStrategyId) {
		this.alarmStrategyId = alarmStrategyId;
	}
	public MeasureStrategy(Integer id, Integer alarmMeasureId, Integer alarmStrategyId) {
		super();
		this.id = id;
		this.alarmMeasureId = alarmMeasureId;
		this.alarmStrategyId = alarmStrategyId;
	}
	public MeasureStrategy() {
		super();
	}
	@Override
	public String toString() {
		return "MeasureStrategy [id=" + id + ", alarmMeasureId=" + alarmMeasureId + ", alarmStrategyId="
				+ alarmStrategyId + "]";
	}

}
