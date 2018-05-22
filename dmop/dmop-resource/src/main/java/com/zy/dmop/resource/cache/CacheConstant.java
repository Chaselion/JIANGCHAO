package com.zy.dmop.resource.cache;

/**
 * 缓存常量集合
 * @author Administrator
 *
 */
public class CacheConstant {
	
	
	//实体类，常量名MODEL_开头
	/**
	 * 方式策略关系
	 */
	public static final String MODEL_MEASURE_STRATEGY = "measure_strategy";
	/**
	 * 条件策略关系
	 */
	public static final String MODEL_CONDITION_STRATEGY = "condition_strategy";
	/**
	 * 报警条件
	 */
	public static final String MODEL_ALARM_CONDITION = "alarm_condition";
	/**
	 * 报警方式
	 */
	public static final String MODEL_ALARM_MEASURE = "alarm_measure";
	/**
	 * 报警策略
	 */
	public static final String MODEL_ALARM_STRATEGY = "alarm_strategy";
	/**
	 * 终端类别
	 */
	public static final String MODEL_DEVICE_CLASS = "device_class";
	/**
	 * 终端属性
	 */
	public static final String MODEL_DEVICE_PROPERITY = "device_properity";
	
	/**
	 * jiangc
	 * 终端管理
	 * 
	 */
	public static final String MODEL_TERMINAL = "terminal";
	/**
	 * 用户
	 */
	public static final String MODEL_USER = "user";
	/**
	 * 客户
	 */
	public static final String MODEL_CUSTOM = "custom";
	/**
	 * 权限组
	 */
	public static final String MODEL_PERMISSION_GROUP = "permission_group";
	/**
	 * 组织
	 */
	public static final String MODEL_ORGANIZATION = "organization";
	/**
	 * 操作日志
	 */
	public static final String MODEL_OPERATE_LOG = "operate_log";
	/**
	 * 报警日志
	 */
	public static final String MODEL_ALARM_LOG = "alarm_log";
	/**
	 * 实体类集合,初始化时使用
	 */
	protected static final String [] MODEL_ARY = {
			MODEL_MEASURE_STRATEGY, MODEL_CONDITION_STRATEGY ,
			MODEL_ALARM_CONDITION, MODEL_ALARM_MEASURE, MODEL_ALARM_STRATEGY, 
			MODEL_DEVICE_CLASS, MODEL_DEVICE_PROPERITY,MODEL_TERMINAL,
			MODEL_USER,MODEL_CUSTOM,MODEL_PERMISSION_GROUP,MODEL_ORGANIZATION,
			MODEL_OPERATE_LOG,MODEL_ALARM_LOG};
	
	//配置文件， 常量名须与文件名相符,变量名CONFIG_开头
	/**
	 * 系统配置
	 */
	public static final String CONFIG_SYSTEM = "system";
	/**
	 * 报警方式穷举
	 */
	public static final String CONFIG_ALARM_WAY = "alarmWay";
	
	protected static final String[] CONFIG_ARY = new String[]{
			CONFIG_SYSTEM, CONFIG_ALARM_WAY};
}
