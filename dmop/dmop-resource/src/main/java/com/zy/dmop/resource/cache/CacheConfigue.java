package com.zy.dmop.resource.cache;

import java.net.URISyntaxException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.alarm.dao.AlarmConditionDao;
import com.zy.dmop.api.alarm.dao.AlarmMeasureDao;
import com.zy.dmop.api.alarm.dao.AlarmStrategyDao;
import com.zy.dmop.api.alarm.dao.ConditionStrategyDao;
import com.zy.dmop.api.alarm.dao.DeviceClassDao;
import com.zy.dmop.api.alarm.dao.DeviceProperityDao;
import com.zy.dmop.api.alarm.dao.MeasureStrategyDao;
import com.zy.dmop.api.web.dao.CustomDao;
import com.zy.dmop.api.web.dao.OperateLogDao;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.dao.PermissionGroupDao;
import com.zy.dmop.api.web.dao.TerminalDao;
import com.zy.dmop.api.web.dao.UserDao;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.AlarmStrategy;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.DeviceProperity;
import com.zy.dmop.model.MeasureStrategy;
import com.zy.dmop.model.OperateLog;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;

import net.sf.json.JSONObject;

@Component("CacheConfigue")
public class CacheConfigue implements ApplicationListener<ContextRefreshedEvent>{

	private static Logger log = Logger.getLogger(CacheConfigue.class);
	@Autowired
	private MeasureStrategyDao msDao;
	@Autowired
	private ConditionStrategyDao csDao;
	@Autowired
	private AlarmConditionDao acDao;
	@Autowired
	private AlarmStrategyDao asDao;
	@Autowired
	private AlarmMeasureDao amDao;
	@Autowired
	private DeviceClassDao dcDao;
	@Autowired
	private DeviceProperityDao dpDao;
	@Autowired
	private TerminalDao tDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private CustomDao customDao;
	@Autowired
	private PermissionGroupDao permissiongroupDao;
	@Autowired
	private OrganizationDao organizationDao;
	@Autowired
	private OperateLogDao operateLogDao;
	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		if(!arg0.getApplicationContext().getDisplayName().equals("Root WebApplicationContext")) {
			initConfig();
			String value = CacheUtil.getConfigValue(CacheConstant.CONFIG_SYSTEM, "model_cache_able", "value");
			if("true".endsWith(value)) {				
				initModel();
			}
		}
	}
	
	public void reloadCache() {
		ConfigCache.getCache().clear();
		initConfig();
		ModelCache.getCache().clear();
		initModel();
	}
	
	private void initConfig() {
		Map<String, Map<String, JSONObject>> configMap = ConfigCache.getCache();
		for(String name : CacheConstant.CONFIG_ARY){
			Map<String, JSONObject> m;
			try {
				m = CacheUtil.loadConfig(name);
				configMap.put(name, m);	
				log.info("配置文件缓存初始化-" + name + ":" + m.size());
			} catch (URISyntaxException e) {
				log.error("配置文件缓存失败！", e);
			}
		}
	}
	
	private void initModel() {
		Map<String, Map<Integer, Object>> modelMap = ModelCache.getCache();
		for(String name : CacheConstant.MODEL_ARY) {
			Map<Integer, Object> map = new LinkedHashMap<>();
			List<?> list = null;
			switch (name) {
			case CacheConstant.MODEL_MEASURE_STRATEGY:
				list = msDao.getAllMeasureStrategyForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((MeasureStrategy)m).getId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_CONDITION_STRATEGY:
				list = csDao.getAllConditionStrategyForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((ConditionStrategy)m).getId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_ALARM_CONDITION:
				list = acDao.getAllAlarmConditionForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((AlarmCondition)m).getAlarmConditionId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_ALARM_MEASURE:
				list = amDao.getAllAlarmMeasureForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((AlarmMeasure)m).getAlarmMeasureId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_ALARM_STRATEGY:
				list = asDao.getAllAlarmStrategyForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((AlarmStrategy)m).getAlarmStrategyId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_DEVICE_CLASS:
				list = dcDao.getAllDeviceClassForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((DeviceClass)m).getDeviceClassId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_DEVICE_PROPERITY:
				list = dpDao.getAllDeviceProperityForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((DeviceProperity)m).getDeviceProperityId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_TERMINAL:
				list = tDao.getAllTerminalForCache();
				if(list != null && list.size() > 0) {	
					for(Object m : list) {
						map.put(((Terminal)m).getTerminalId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_USER:
				list = userDao.getAllUserForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((User)m).getUserId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_CUSTOM:
				list = customDao.getAllUserForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((Custom)m).getCustomId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_PERMISSION_GROUP:
				list = permissiongroupDao.getAllPermissionGroupForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((PermissionGroup)m).getPermissionGroupId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_ORGANIZATION:
				list = organizationDao.getAllOrganizationForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((Organization)m).getOrganizationId(), m);
					}
				}
				break;
			case CacheConstant.MODEL_OPERATE_LOG:
				list = operateLogDao.getAllOperateLogForCache();
				if(list != null && list.size() > 0) {					
					for(Object m : list) {
						map.put(((OperateLog)m).getOperateLogId(), m);
					}
				}
				break;
			}
			/*for(Integer ii : map.keySet()) {
				log.info(map.get(ii).toString());
			}*/	
			modelMap.put(name, map);
			log.info("实体类缓存初始化-" + name + ":" + map.size());
		}
	}
	
}
