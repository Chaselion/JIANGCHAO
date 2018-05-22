package com.zy.dmop.resource.dao;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.TerminalDao;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.AlarmStrategy;
import com.zy.dmop.model.DeviceClass;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.UpsInfo;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.ConditionDeviceVo;
import com.zy.dmop.model.vo.TerOrzCusVo;
import com.zy.dmop.model.vo.TerminalStrategyVo;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;
import com.zy.dmop.util.StringUtil;

@Component("terminalDao")
public class TerminalDaoImpl extends NamedParameterJdbcDaoSupport implements TerminalDao{
	private static Logger log = Logger.getLogger(TerminalDaoImpl.class);
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	@Override
	public int deleteUpsById(Terminal terminal) {
		String sql = new StringBuffer()
				.append("delete from ")
				.append("	terminal ")
				.append("where terminal_num = :terminalNum ")
				.toString();
		int affected = getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(terminal));
		List<Object> list = CacheUtil.getModelList(CacheConstant.MODEL_TERMINAL);
		for(Object o:list) {
			if(terminal.getTerminalNum().equals( ((Terminal)o).getTerminalNum()  )) {
				CacheUtil.updateModel(CacheConstant.MODEL_TERMINAL, ((Terminal)o).getTerminalId(), null);
				break;
			}
		}
		return affected;
	}

	@Override
	public int updateById(Terminal terminal) {
		Date date=new Date();
		terminal.setModifyDateTime(date);
		String sql = new StringBuffer()
				.append("update ")
				.append("terminal ")
				.append("set ")
				.append("terminal_name= :terminalName ,device_class_id=:deviceClassId,terminal_num= :terminalNum,organization_id= :organizationId, ")
				.append("fireware_version= :firewareVersion ,longitude= :longitude ,latitude= :latitude ,ip= :ip ,note= :note,modify_date_time=:modifyDateTime,alarm_strategy_id= :alarmStrategyId ")
				.append("where terminal_id=:terminalId")
				.toString();
		int affected = 0;
		try {
			affected = getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(terminal));
			Object obj = CacheUtil.getModel(CacheConstant.MODEL_TERMINAL, terminal.getTerminalId());
			Terminal terminalModel = (Terminal)obj;
			terminalModel.setTerminalName(terminal.getTerminalName());
			terminalModel.setDeviceClassId(terminal.getDeviceClassId());
			terminalModel.setTerminalNum(terminal.getTerminalNum());
			terminalModel.setOrganizationId(terminal.getOrganizationId());
			terminalModel.setFirewareVersion(terminal.getFirewareVersion());
			terminalModel.setLongitude(terminal.getLongitude());
			terminalModel.setLatitude(terminal.getLatitude());
			terminalModel.setIp(terminal.getIp());
			terminalModel.setNote(terminal.getNote());
			terminalModel.setModifyDateTime(terminal.getModifyDateTime());
			terminalModel.setAlarmStrategyId(terminal.getAlarmStrategyId());
			CacheUtil.updateModel(CacheConstant.MODEL_TERMINAL,terminal.getTerminalId(),terminalModel);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	@Override
	public void updateStrategy(int id, int strategyId) {
        String sql = "update terminal set alarm_strategy_id=:strategyId where terminal_id=:id";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("strategyId", strategyId);
		params.put("id", id);
		
		getNamedParameterJdbcTemplate().update(sql, params);
		Object rev = CacheUtil.getModel(CacheConstant.MODEL_TERMINAL, id);
		Terminal terminal = (Terminal)rev;
		terminal.setAlarmStrategyId(strategyId);
		CacheUtil.updateModel(CacheConstant.MODEL_TERMINAL,id,terminal);
	}

	
	@Override
	public Terminal selectById(Integer id) {
			String sql = new StringBuffer()
					.append("select ")
					.append("* ")
					.append("from ")
					.append("terminal ")
					.append("where ")
					.append("terminal_id = ? ").toString();
			List<Terminal> list = getJdbcTemplate().query(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Terminal.class));
			return list.size()==0? null : list.get(0);
		
	}
	
	

	@Override
	public int insert(Terminal terminal) {
		Date date=new Date();
		terminal.setCreateDateTime(date);
		terminal.setModifyDateTime(date);
		terminal.setCurrentState(0);
		terminal.setIcon("0");
		String sql = new StringBuffer()
				.append("insert into ")
				.append("terminal(terminal_num,terminal_name,device_class_id,fireware_version,longitude,latitude,ip,organization_id,note,alarm_strategy_id,create_date_time,modify_date_time,current_state,icon) ")
				.append("values(:terminalNum,:terminalName,:deviceClassId,:firewareVersion,:longitude,:latitude,:ip,:organizationId,:note,:alarmStrategyId,:createDateTime, :modifyDateTime,:currentState,:icon) ")
				.toString();
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int affected = getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(terminal), keyHolder);
		int id = keyHolder.getKey().intValue();
		terminal.setTerminalId(id);
		CacheUtil.updateModel(CacheConstant.MODEL_TERMINAL,id,terminal);
		return affected;
	}
	
	//根据终端编号取对应策略
	@Override
	public int getStrategyId(String terminalNum) {
		
		String sql = new StringBuffer()
				.append("select ")
				.append("alarm_strategy_id ")
				.append("from ")
				.append("terminal ")
				.append("where ")
				.append("terminal_num= ? ").toString();
		Object sId = null;
		try {
			sId = getJdbcTemplate().queryForObject(sql, Integer.class, terminalNum);
		} catch (DataAccessException e) {
			log.error("不存在该终端号");
		}
		if(null == sId) {
			Integer id =0;
			return id;
		}
		Integer id=(Integer) sId;
		return id;
	}

	@Override
	public String getTerminalNum(int terminalId) {
		Object rev = CacheUtil.getModel(CacheConstant.MODEL_TERMINAL,terminalId);
		if(null == rev) {
			String sql = new StringBuffer()
					.append("select ")
					.append("terminal_num ")
					.append("from ")
					.append("terminal ")
					.append("where ")
					.append("terminal_id = ? ").toString();
			Object[] obj=new Object[]{terminalId};
			List<String> terminalNums=jdbcTemplate.queryForList(sql, obj,String.class);
			if(terminalNums != null && terminalNums.size() == 1){
				return terminalNums.get(0);
			}else{
				return null;
			}
		}else {
			return ((Terminal)rev).getTerminalNum();
		}
		
	}

	@Override
	public PageResult<TerminalStrategyVo> pageQueryAlarm(String terminalNum,Page page,List<Integer> orgIds) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_TERMINAL);
		if(cache != null && cache.size() > 0 && (terminalNum == "" || null == terminalNum))  {
			List<TerminalStrategyVo> list = new ArrayList<>();
			
			for(Object o : cache) {
				Terminal t=(Terminal)o;
				if(orgIds.contains(t.getOrganizationId())) {
				try {
					TerminalStrategyVo tsv = turnVo(t);
					list.add(tsv);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				}catch (IllegalAccessException e) {
					e.printStackTrace();
				}
				}
			}
			page.setCount(list.size());
			int end=list.size()-page.getStart();
			int end1=page.getStart()+page.getLimit();
			list = list.subList(
					page.getStart(),
					page.getLimit() > end ? list.size() : end1);
			PageResult<TerminalStrategyVo> pr = new PageResult<TerminalStrategyVo>(page, list);
			return pr;
		}else {
			Map<String, Object> params = new HashMap<String, Object>();
			StringBuilder sqlCondition = new StringBuilder();
			sqlCondition.append(" from terminal a ");
			sqlCondition.append("LEFT JOIN alarm_strategy b on a.alarm_strategy_id=b.alarm_strategy_id ");
			sqlCondition.append("LEFT JOIN device_class dc on a.device_class_id=dc.device_class_id ");
			sqlCondition.append("LEFT JOIN organization org on a.organization_id=org.organization_id ");
			sqlCondition.append("where a.organization_id in(:orgIds) ");
			StringBuilder sql = new StringBuilder();
			sql.append("select 	a.terminal_id, a.terminal_num,a.longitude,a.latitude, a.terminal_name, a.terminal_model_id, a.icon,"
					+ "a.fireware_version, a.ip,a.create_date_time, a.modify_date_time,org.name oname, b.name,a.note,dc.name deviceClassName");
			params.put("orgIds", orgIds);
			if (!StringUtil.isNullOrEmpty(terminalNum)) {
				sqlCondition.append(" and terminal_num like :terminalNum ");
				params.put("terminalNum", "%"+ terminalNum +"%");
			}
			sql.append(sqlCondition.toString());
			sql.append(" order by a.create_date_time desc limit " + page.getStart() + ", " + page.getLimit());
			StringBuilder sqlCount = new StringBuilder();
			sqlCount.append("select count(*) ");
			sqlCount.append(sqlCondition.toString());
			List<TerminalStrategyVo> list= getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<TerminalStrategyVo>(TerminalStrategyVo.class));
			int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
			page.setCount(count);
			PageResult<TerminalStrategyVo> pr = new PageResult<TerminalStrategyVo>(page, list);
			return pr;
		}
	}

	private TerminalStrategyVo turnVo(Terminal t) throws IllegalArgumentException, IllegalAccessException {
		TerminalStrategyVo tsv=new TerminalStrategyVo();
		for(Field tsvF : tsv.getClass().getDeclaredFields()) {
			String tsvFName = tsvF.getName();
			tsvF.setAccessible(true);
			for(Field field : t.getClass().getDeclaredFields()) {
				String tFName = field.getName();
				if(tFName.equals(tsvFName)) {
					field.setAccessible(true);
					tsvF.set(tsv, field.get(t));;
				}
			}
			if("deviceClassName".equals(tsvFName)) {
				Object dcO = CacheUtil.getModel(CacheConstant.MODEL_DEVICE_CLASS, t.getDeviceClassId());
				tsvF.set(tsv, dcO != null ? ((DeviceClass)dcO).getName() : "");
			}
			if("oname".equals(tsvFName)) {
				Object oO = CacheUtil.getModel(CacheConstant.MODEL_ORGANIZATION, t.getOrganizationId());
				tsvF.set(tsv, oO != null ? ((Organization)oO).getName() : "");
			}
			if("name".equals(tsvFName)) {
				Object oO = CacheUtil.getModel(CacheConstant.MODEL_ALARM_STRATEGY, t.getAlarmStrategyId());
				tsvF.set(tsv, oO != null ? ((AlarmStrategy)oO).getName() : "");
			}
		}
		return tsv;
	}

	@Override
	public Integer selectIdByTerminalId(String terminalNum) {
		String sql = new StringBuffer()
				.append("select ")
				.append("	count(terminal_num) ")
				.append("from ")
				.append("	terminal ")
				.append("where ")
				.append("	terminal_num = ? ")
				.toString();
		Integer id = null;
			try {
				id= getJdbcTemplate().queryForObject(sql.toString(), new Object[]{terminalNum}, Integer.class);
			} catch (DataAccessException e) {
				e.printStackTrace();
			}
		return id;
	}

	@Override
	public List<Terminal> getTerminalExcel() {
		String sql=new StringBuffer()
				.append("select ")
				.append("organization_id, terminal_num, terminal_name, terminal_model_id, fireware_version, longitude, latitude, ip, port, create_date_time ")
				.append("from terminal ")
				.toString();
		return getNamedParameterJdbcTemplate().query(sql, new BeanPropertyRowMapper<Terminal>(Terminal.class));
	}



	@Override
	public PageResult<Terminal> getTerminalPage(String terminalNum, Integer terminalModelId, Page page,List<Integer> orgIds) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orgIds", orgIds);
		StringBuilder sqlCondition = new StringBuilder();
    	sqlCondition.append("from terminal t  where t.current_state=0 and t.organization_id in(:orgIds)");
    	StringUtil.isNullOrEmpty(terminalNum);
    	if(!StringUtil.isNullOrEmpty(terminalNum)) {
    		sqlCondition.append(" and terminal_num like :terminalNum ");
    		params.put("terminalNum", "%"+terminalNum+"%");
    	}
    	if(terminalModelId!=null) {
    		sqlCondition.append("where terminal_model_id =:terminalModelId ");
    		params.put("terminalModelId", terminalModelId);
    	}
    	StringBuilder sql = new StringBuilder();
    	sql.append("select terminal_num, fireware_version, terminal_name, terminal_model_id " );
    	sql.append(sqlCondition.toString());
    	sql.append("limit " + page.getStart() + ", " + page.getLimit());
    	
    	StringBuilder sqlCount = new StringBuilder();
    	sqlCount.append("select count(*) ");
    	sqlCount.append(sqlCondition.toString());
    	List<Terminal> terminals = getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<Terminal>(Terminal.class));
    	int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
    	page.setCount(count);
		PageResult<Terminal> pr = new PageResult<Terminal>(page, terminals);
		return pr;
	}
	

	@Override
	public List<Terminal> listAll(List<Integer> orgIds) {
		StringBuilder sql = new StringBuilder();
    	sql.append("select * from terminal where organization_id in(:orgIds)");
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("orgIds", orgIds);
	    List<Terminal> list =getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<Terminal>(Terminal.class));
		return list;
	}

	@Override
	public List<HistoryData> getUpsInfo(String terminalId) {
		String sql = new StringBuffer()
				.append("select ")
				.append("ups_hardware, ups_serial, ups_factory_info, coefficient ")
				.append("from ")
				.append("ups_info ")
				.append("where terminal_id=? ")				
				.toString();
		List<HistoryData> list=getJdbcTemplate().query(sql, new Object[]{terminalId}, new BeanPropertyRowMapper<HistoryData>(HistoryData.class));
		return list;
	}

	@Override
	public List<TerminalStrategyVo> getExcelData(List<Integer> aorgIds) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orgIds", aorgIds);
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from terminal a ");
		sqlCondition.append("LEFT JOIN alarm_strategy b on a.alarm_strategy_id=b.alarm_strategy_id ");
    	sqlCondition.append("LEFT JOIN device_class dc on a.device_class_id=dc.device_class_id ");
    	sqlCondition.append("LEFT JOIN organization org on a.organization_id=org.organization_id ");
    	sqlCondition.append(" where a.organization_id in(:orgIds) ");
    	StringBuilder sqlC1= new StringBuilder();
    	sqlC1.append(" order by a.create_date_time  ");
    	StringBuilder sql = new StringBuilder();
    	sql.append("select 	a.terminal_id, a.terminal_num,a.longitude,a.latitude, a.terminal_name, "
    			+ "a.fireware_version,a.create_date_time, a.modify_date_time,org.name oname, b.name,dc.name deviceClassName");
    	sql.append(sqlCondition.toString());
    	List<TerminalStrategyVo> list= getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<TerminalStrategyVo>(TerminalStrategyVo.class));
		return list;
	}

	@Override
	public List<TerOrzCusVo> getInfo(String terminalId) {
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from terminal t ");
    	sqlCondition.append(" LEFT JOIN organization o on t.organization_id=o.organization_id ");
    	sqlCondition.append(" LEFT JOIN custom c on c.custom_id=o.custom_id ");
    	StringBuilder sql = new StringBuilder();
    	sql.append("select o.organization_id,t.terminal_num,"
    			+ "o.custom_id, c.link_man_name, "
    			+ "c.link_man_phone ");
    	sql.append(sqlCondition.toString());
    	sql.append(" where t.terminal_num=:terminalId ");
    	Map<String, Object> params = new HashMap<String, Object>();
		params.put("terminalId", terminalId);
    	List<TerOrzCusVo> list= getNamedParameterJdbcTemplate().query(sql.toString(), params, new BeanPropertyRowMapper<TerOrzCusVo>(TerOrzCusVo.class));
    	return list;
	}

	@Override
	public List<DeviceClass> getDeviceClass() {
		StringBuilder sql = new StringBuilder();
    	sql.append("select * from device_class ");
		return getNamedParameterJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<DeviceClass>(DeviceClass.class));
	}

	@Override
	public void updateState(String id, Integer state) {
        String sql = "update terminal set current_state=:state where terminal_num=:id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("state", state);
		params.put("id", id);
		getNamedParameterJdbcTemplate().update(sql, params);
		
	}
	//详情界面新增固件信息
	@Override
	public void addInfo(final UpsInfo upsInfo) {
		
		final String sql = " insert into ups_info "
				+ "(terminal_id, ups_hardware,ups_serial,ups_factory_info,coefficient) "
				+ "values(:terminalId,:upsHardware,:upsSerial,:upsFactoryInfo,:coefficient)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(upsInfo), keyHolder);
		
	}
	//详情界面更新固件信息
	@Override
	public void updateInfo(UpsInfo upsInfo) {
		String sql = " update ups_info set  ups_hardware=:upsHardware, "
				+ " ups_serial=:upsSerial,ups_factory_info=:upsFactoryInfo, "
				+ " coefficient=:coefficient "
				+ " where terminal_id=:terminalId";
		getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(upsInfo));
		
		
	}
	//通过组织id删除终端
	@Override
	public void deleteTerminalByOrg(int organizationId) {
		final String sql = "delete from terminal where organization_id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", organizationId);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_TERMINAL);
		for (Object o : cache) {
			Terminal terminal = (Terminal) o;
				if (organizationId==(terminal.getOrganizationId())) {
					CacheUtil.updateModel(CacheConstant.MODEL_TERMINAL, terminal.getTerminalId(), null);
				}
			}
	}
	//查询详情界面固件信息是否正确
	@Override
	public Boolean isTerminalTrue(String terminalId) {
		final String sql = "select * from ups_info where terminal_id=?";
		List<UpsInfo> upsInfo=getJdbcTemplate().query(sql, new Object[]{terminalId}, new BeanPropertyRowMapper<UpsInfo>(UpsInfo.class));
		if(null==upsInfo||0==upsInfo.size()) {
			return false;
		}else {
			return true;
		}
	}
	//根据终端号查询终端名字
	@Override
	public String getNamefromId(String terminalId) {
		final String sql = "select terminal_name from terminal where terminal_num=?";
		Object terminalName=getJdbcTemplate().queryForObject(sql, new Object[]{terminalId}, String.class);
		System.out.println("terminalName=="+(String)terminalName);
		return (String) terminalName;
	}

	@Override
	public List<Terminal> getAllTerminalForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from terminal order by create_date_time desc";
		List<Terminal> terminal = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<Terminal>(Terminal.class));
		return terminal;
	}

	@Override
	public List<TerminalStrategyVo> getTerminalMobile(String terminalNum,List<Integer> orgIds) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from terminal a ");
		sqlCondition.append("LEFT JOIN alarm_strategy b on a.alarm_strategy_id=b.alarm_strategy_id ");
		sqlCondition.append("LEFT JOIN device_class dc on a.device_class_id=dc.device_class_id ");
		sqlCondition.append("LEFT JOIN organization org on a.organization_id=org.organization_id ");
		sqlCondition.append("where a.organization_id in(:orgIds) ");
		StringBuilder sql = new StringBuilder();
		sql.append("select 	a.terminal_id, a.terminal_num,a.longitude,a.latitude, a.terminal_name, a.terminal_model_id, a.icon,"
				+ "a.fireware_version, a.ip,a.create_date_time, a.modify_date_time,org.name oname, b.name,a.note,dc.name deviceClassName");
		params.put("orgIds", orgIds);
		if (!StringUtil.isNullOrEmpty(terminalNum)) {
			sqlCondition.append(" and terminal_num like :terminalNum ");
			params.put("terminalNum", "%"+ terminalNum +"%");
		}
		sql.append(sqlCondition.toString());
		sql.append(" order by a.create_date_time desc  " );
		List<TerminalStrategyVo> list= getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<TerminalStrategyVo>(TerminalStrategyVo.class));
	    return list;
	}
}
