package com.zy.dmop.web.alarm.core;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dmop.api.alarm.dao.AlarmLogDao;
import com.zy.dmop.api.alarm.dao.AlarmStrategyDao;
import com.zy.dmop.api.alarm.service.AlarmConditionService;
import com.zy.dmop.api.alarm.service.AlarmLogService;
import com.zy.dmop.api.alarm.service.ConditionStrategyService;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.model.AlarmMeasure;
import com.zy.dmop.model.AppDataCache;
import com.zy.dmop.model.ConditionStrategy;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.vo.ConditionProperityVo;
import com.zy.dmop.resource.cache.CacheUtil;
//import com.zy.dmop.websocket.WebsocketController;
import com.zy.dmop.web.information.more.CarDataCache;



public class EngineThread_LogForTest extends Thread{
	private static Logger log = Logger.getLogger(EngineThread_LogForTest.class);
	//定义通用的前缀key名
	private static final String PREFIX2 ="DMOP_ALARMDATA_";
	//定义计时缓存的key
	private static final String CACHE_KEY__PREFIX_Timing2Data = PREFIX2 +"JUDGMENT_";
	//定义计入次数缓存的key
	private static final String CACHE_KEY__PREFIX_Frequency2Data = PREFIX2 +"REPEATTIMES_";
	//定义报警缓存的key
	private static final String CACHE_KEY__PREFIX_Alarm2Data = PREFIX2 +"ALARM_";
	//定义接触计时缓存的key
	private static final String CACHE_KEY__PREFIX_Remove2Data = PREFIX2 +"REMOVE_TIME_";
	//定义报警列表缓存的key
	private static final String PREFIX= "ZHYAN_DMOPDATA_";
	private static final String CACHE_KEY__PREFIX_App2Data=PREFIX+ "app2data_FORALARM";
	@Autowired
	private TerminalService terminalService;
	@Autowired
	private AlarmConditionService alarmConditionService;
	@Autowired
	private AlarmStrategyDao asDao;
	@Autowired
	private ConditionStrategyService conditionStrategyService;
	@Autowired
	private EngineDataCache engineDataCache;
	@Autowired
	private SendMsg sendMsg;
	@Autowired
	private AlarmLogDao alarmDao;
	@Autowired
	private AlarmLogService alarmService;
	@Autowired
	private AppDataCacheService appDataCacheService;
	@Autowired
	private CarDataCache carDataCache;
	//线程方法
	public void init() {
		Runnable runnable = new Runnable() {
			
			/**
			 * 若满足条件则不报警，正常下半部分逻辑处理。
			 * 满足条件不报警，并判断告警缓存是否存在，
			 * 不存在则返回结束，存在则接着进行判断。
			 */
			private void hasJudge(String terminalID, ConditionProperityVo vo, Double value, int reDuraTime) {
				log.info("77行------进入告警缓存是否存在报警");
	    		if(null==engineDataCache.getFirstCache(CACHE_KEY__PREFIX_Alarm2Data+terminalID+
						"_"+vo.getEnglishName())) {
					log.info("80行------判断不存在告警");
					return;
	    		}
				// 若缓存中存在告警，则需要进行解除延时判定
				//将当前时间插入到缓存中
				long time_1=System.currentTimeMillis();
				String t_1=Long.toString(time_1);
				engineDataCache.addCarData(CACHE_KEY__PREFIX_Remove2Data+terminalID+
						"_"+vo.getEnglishName(),  t_1);
				//取得解除计时缓存第一条数据
				long reTime_1=Long.parseLong(engineDataCache.getFirstCache(CACHE_KEY__PREFIX_Remove2Data+terminalID+
						"_"+vo.getEnglishName()));
				//取得解除计时缓存最后一条数据
				//从左边插入，第一条时间会大于等于最先插入的时间。
				long reTime_2=Long.parseLong(engineDataCache.getLastCache(CACHE_KEY__PREFIX_Remove2Data+terminalID+
						"_"+vo.getEnglishName()));
				Integer diffTime = (int) ((reTime_1-reTime_2)/1000/60);
				log.info("97行------diffTime时间差===="+diffTime);
				if(diffTime>=reDuraTime) {
					//满足时间条件后清楚缓存
					log.info("100行------满足时间条件,清除全部缓存。");
					engineDataCache.removeCache(terminalID+"_"+vo.getEnglishName());
					Date time=new Date();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
					String date = df.format(time);
					try {
						updateAlarmLog(terminalID,vo, value,date);
					} catch (Exception e1) {
						log.error("更新报警日志失败！");
					}
					log.info("110行------发送报警");
					try {
						sendMsg(terminalID, vo.getName());
					} catch (Exception e) {
						log.error("发送报警出错！");
					}
				}
			}
			
			private void sendMsg(String terminalID, String conditionName) {
				Terminal terminal = CacheUtil.geTerminalByNum(terminalID);
				if(terminal != null) {
					int sID = terminal.getAlarmStrategyId();
					List<AlarmMeasure> mList = asDao.getMeasure(sID);
					if(mList != null && mList.size() > 0) {
						for(AlarmMeasure m : mList) {
							int type = m.getTypeID();
							log.info("报警类型："+type);
							switch (type) {
							case 1://短信
								try {
									sendMsg.sendSolveMsg(terminalID, conditionName);
								} catch (Exception e) {
									log.error("发送报警短信出错！");
								}
								break;
							default:
								break;
							}
						}
					}else {
						log.error("无有效的报警方式！");
					}
				}else {
					log.error("终端为空！");
				}
			}
			
			/**
			 * 若不满足条件则触发报警
			 * 通过查询计时缓存中是否存在数据，从而判断告警是否已存在，
			 * 若存在则说明该告警是需要延时来触发的，达到一定时间就可以触发告警
			 * 刷新计时缓存到redis中,取第一条和最后一条的时间差，
			 * 和延时时间进行对比，直至满足条件时跳出循环，产生告警。
			 */
			private void hasNoJudge(String terminalID, ConditionProperityVo vo,Double value ,Integer trDuraTime,Integer repetTime) {
				//判断计时缓存中是否存在，存在即进行延时检测；
				if(null!=engineDataCache.getFirstCache(CACHE_KEY__PREFIX_Timing2Data+terminalID+
						"_"+vo.getEnglishName())) {
					long first_time=Long.parseLong(engineDataCache.getFirstCache(CACHE_KEY__PREFIX_Timing2Data+terminalID+
							"_"+vo.getEnglishName()));
					long last_time=Long.parseLong(engineDataCache.getLastCache(CACHE_KEY__PREFIX_Timing2Data+terminalID+
							"_"+vo.getEnglishName()));
					Integer different_1=(int) ((first_time-last_time)/1000/60);
					log.info("154行------different_1时间差===="+different_1);
					
					//进行延时检测，如果满足条件就需要报警，不满足则刷新计时缓存时间；
					if (different_1>=trDuraTime) {
						timeDetermination(repetTime,terminalID,vo,value);
					}else {
						long time_1=System.currentTimeMillis();
						String t_1=Long.toString(time_1);
						engineDataCache.addCarData(CACHE_KEY__PREFIX_Timing2Data+terminalID+
								"_"+vo.getEnglishName(),  t_1);
					}
				}else {
					//若不存在，则生成新的告警
					log.info("167行------1 若不存在，则生成新的告警;2 判断是否立即告警,如果延迟大于0，则计时再实现告警");
					long time_2=System.currentTimeMillis();
					String t_2=Long.toString(time_2);
					engineDataCache.addCarData(CACHE_KEY__PREFIX_Timing2Data+terminalID+
							"_"+vo.getEnglishName(),  t_2);
					long first_time=Long.parseLong(engineDataCache.getFirstCache(CACHE_KEY__PREFIX_Timing2Data+terminalID+
							"_"+vo.getEnglishName()));
					long last_time=Long.parseLong(engineDataCache.getLastCache(CACHE_KEY__PREFIX_Timing2Data+terminalID+
							"_"+vo.getEnglishName()));
					Integer different_2=(int) ((first_time-last_time)/1000/60);
					log.info("177行------different_2时间差===="+different_2);
					if(different_2>=trDuraTime) {
						//查询计次缓存中的数据，进行计次判定，如果超过一定的次数则不再继续报警
						timeDetermination(repetTime,terminalID,vo,value);
					}
				}	
			}
			
			@Override
			public void run() {
				log.info("报警线程启动");
				//去终端绑定报警策略的缓存中去取终端号
				List<String> terminalIds=engineDataCache.getTerminalIds();
				log.info("190行------terminalIds=="+terminalIds);
				//根据终端号取查询相应报警策略
				if(terminalIds.isEmpty()) {
					return;
				}
				for (int j = 0; j < terminalIds.size(); j++) {
				Integer strategyId=terminalService.getStrategyId(terminalIds.get(j)); 
				log.info("198行------strategyId=="+strategyId);
				if(0==strategyId) {
					continue;
				}
				//连表查询，先查条件策略集合表的对应的条件id，
		    	List<ConditionStrategy> conditionIds=conditionStrategyService.getConditionIds(strategyId);
		    	log.info("203行------conditionIds=="+conditionIds);
		    	if(null==conditionIds) {
		    		continue;
		    	}
		    	for(int m=0;m<conditionIds.size();m++ ) {
		    	//根据返回的条件id去查properity和条件的连表查询,返回连表对象
		    	List<ConditionProperityVo> conditionDeviceVo=alarmConditionService.getConDeviceVo(conditionIds.get(m).getAlarmConditioId());
		    	if(null==conditionDeviceVo) {
		    		continue;
		    	}
		    	/**
		    	 * 根据终端id，取redis中对应的第一条实时数据，
		    	 * 然后通过map去get对应的属性值。
		    	 */
		    	List<Map<String, Object>> firstData=engineDataCache.getFirstData(terminalIds.get(j));
		    	if(firstData.isEmpty()) {
		    		continue;
		    	}
		    	//遍历条件属性Vo对象链表
		    	for (int i = 0; i < conditionDeviceVo.size(); i++) {
		    		Object obj=firstData.get(0).get(conditionDeviceVo.get(i).getEnglishName());
		    		Double value= (Double) obj;
		    		log.info("225行------value=="+value);
		    		//将判断规则的值事先定义
		    		int ruleNum=conditionDeviceVo.get(i).getJudgeRule();
		    		//将判断的左右区间值事先定义
		    		log.info("229行------ruleNum=="+ruleNum);
		    		Double leftVal=null;
		    		try {
						leftVal=conditionDeviceVo.get(i).getJudgeJuniorValue();
					} catch (Exception e) {
						log.error("未检测到左区间");
					}
		    		log.info("236行------leftVal=="+leftVal);
		    		Double rightVal=null;
		    		try {
						rightVal=conditionDeviceVo.get(i).getJudgeSeniorValue();
					} catch (Exception e) {
						log.error("未检测到右区间");
					}
		    		log.info("243行------rightVal=="+rightVal);
		    		//定义解除所需时长
		    		Integer reDuraTime = 0;
					//定义持续所需时间
					Integer trDuraTime = 0;
					//定义重复次数
					Integer repetTime = 0;
					try {
						reDuraTime = conditionDeviceVo.get(i).getRelieveDuration();
						trDuraTime = conditionDeviceVo.get(i).getTriggerDuration();
						repetTime = conditionDeviceVo.get(i).getRepeatTime();
					} catch (Exception e) {
						log.error("获取解除时长、持续时长、重复次数出现错误！");
					}
		    		log.info("257行------reDuraTime=="+reDuraTime);
		    		log.info("258行------trDuraTime=="+trDuraTime);
		    		log.info("259行------repetTime=="+repetTime);
		    		/**
		    		 * 将取到的value和条件对象中对应的规则进行匹配
		    		 * 1、不在区间；2、在区间
		    		 * 3、等于；4、不等于
		    		 * 5、大于；6、小于
		    		 */
		    		switch (ruleNum) {
		    		//1、不在区间
					case 1:
						if(value>=leftVal&&value<=rightVal) {
							hasJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime);
						}else {
							hasNoJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime, repetTime);
						}	
						break;
					//2、在区间
					case 2:
						if(value<leftVal||value>rightVal) {
							hasJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime);
						}else {
							hasNoJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime, repetTime);
						}	
						break;
					//3、等于
					case 3:
						if(value==rightVal) {
							//满足相等条件需要报警
							hasNoJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime, repetTime);
						}else {
							//不满足则不需要报警
							hasJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime);
						}	
						break;
					//4、不等于
					case 4:
						if(!value.equals(rightVal)) {
							hasNoJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime, repetTime);
						}else {
							hasJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime);
						}	
						break;
					//5、大于
					case 5:
						if(value>rightVal) {
							hasNoJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime, repetTime);
						}else {
							hasJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime);
						}	
						break;
					//6、小于
					case 6:
						if(value<rightVal) {
							hasNoJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime, repetTime);
						}else {
							hasJudge(terminalIds.get(j), conditionDeviceVo.get(i), value,  reDuraTime);
						}	
						break;
					}
		    	}
		    }
		}
	}			
			//更新日志
			private void updateAlarmLog(String terminalId, ConditionProperityVo conditionProperityVo, Double value,
					String date) {
				alarmService.updateLog(terminalId,conditionProperityVo, value,date);
				List<String> list=new ArrayList<String>();
				//以字符串数组形势返回key中所有的数据
				List<String> forData= appDataCacheService.getAllAppCache();
				//以map数组形势返回key中所有的解析后的数据
				List<Map<String, Object>> getAppData=appDataCacheService.getFirstData();
				//遍历缓存中符合条件的那条数据
				for (int i = 0; i < forData.size(); i++) {
					String redisTerminalId=(String) getAppData.get(i).get("terminalId");
					String redisValue=(String) getAppData.get(i).get("value");
					Double valueR=Double.parseDouble(redisValue);
					if(terminalId.equals(redisTerminalId)&&valueR==value){
						list.add(forData.get(i));
					}
				}
				carDataCache.delete(CACHE_KEY__PREFIX_App2Data, list);
				
			}
			/**
			 * 根据条件判断是否执行，若是，则触发联动报警，并将报警信息写入到报警缓存中去；
			 * 若否，则返回处理结束。
			 * 
			 * @param delayTime 
			 */
			private void timeDetermination(Integer repetTime, String terminlId,ConditionProperityVo conditionDeviceVo,Double value) {
				//插入告警缓存
				engineDataCache.addCarData(CACHE_KEY__PREFIX_Alarm2Data+terminlId+
						"_"+conditionDeviceVo.getEnglishName(), terminlId); 
				
				//根据相关信息去查询，如果返回0为true，则判断中插入，返回1为false，不再插入日志；
				Date time=new Date();
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
				String date = df.format(time);
				log.info("364行------进入判断");
				boolean success=alarmService.getAlarmLogByInfo(terminlId,date, value);
				if(success) {
					log.info("367行------进入判断");
					AlarmLog alarmLog=alarmDao.getAlarm(terminlId);
					AppDataCache appDataCache=new AppDataCache();
					appDataCache.setTerminalId(terminlId);
					appDataCache.setOrganizationId(alarmLog.getOrganizationId());
					appDataCache.setProperty(conditionDeviceVo.getName());
					appDataCache.setRemind(1);
					appDataCache.setConfirm(0);
					appDataCache.setValue(value);
					appDataCacheService.addOriginalAppCache(appDataCache);
					log.info("377行------插入到告警日志");
					alarmService.createLog(terminlId,conditionDeviceVo, value);
					String message = terminlId+ "设备" + conditionDeviceVo.getName() + "发生异常，异常值为" + value;
					log.info("获取插入前数据：" + message);
				}
				
				int frequency = 0;
				try {
					frequency = Integer.parseInt(engineDataCache.getFirstCache(CACHE_KEY__PREFIX_Frequency2Data+terminlId+"_"+conditionDeviceVo.getEnglishName()));
				} catch (Exception e1) {
					log.error("查询次数缓存出错！");
				}
				log.info("389行------frequency=="+frequency);
				if(frequency<repetTime) {
					frequency++;
					String fre=String.valueOf(frequency);
					engineDataCache.addCarData(CACHE_KEY__PREFIX_Frequency2Data+terminlId+"_"+conditionDeviceVo.getEnglishName(), fre);
					log.info("394----发送提醒短信");
					try {
						sendMsg.sendAlarmMsg(terminlId,conditionDeviceVo.getName());
					} catch (Exception e) {
						log.error("发送短信出错！"+e);
					}
				}
			}
			
			
		};
		ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
		// 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  
		long first=30;
		long again=60;
	    service.scheduleAtFixedRate(runnable, first, again, TimeUnit.SECONDS);
	}
}
	
