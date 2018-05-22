package com.zy.dmop.resource.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.DatagramTablesDao;
import com.zy.dmop.model.HistoryData;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.vo.OperateCusUserVo;
import com.zy.dmop.util.StringUtil;
@Component("datagramTablesDao")
public class DatagramTablesDaoImpl extends NamedParameterJdbcDaoSupport implements DatagramTablesDao {

	@Override
	public List<Organization> getOrgName(Integer orgId) {
		String sql=new StringBuffer()
				.append(" select name ")
				.append(" from organization ")
				.append(" where organization_id=? ")
				.append(" or parent_id=? ")
				.toString();
		List<Organization> org = getJdbcTemplate().query(sql, new Object[]{orgId,orgId},  new BeanPropertyRowMapper<>(Organization.class));
		return org;
	}

	@Override
	public List<Terminal> getTerName(Integer orgId) {
		String sql = new StringBuffer()
				.append("select ")
				.append("* ")
				.append("from ")
				.append("terminal ")
				.append("where ")
				.append("organization_id = ? ")
				.toString();
		List<Terminal> list = getJdbcTemplate().query(sql, new Object[]{orgId}, new BeanPropertyRowMapper<>(Terminal.class));
		return list;
	}

	@Override
	public List<HistoryData> getData(String terminalNum, String startTime, String endTime) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sql1 = new StringBuilder();
		sql1.append(" select dump_energy,work_load,inner_temperature,input_voltage,output_voltage,input_frequency,create_date_time ");
		sql1.append(" from history_data ");
		sql1.append(" where 1=1 ");
		StringBuilder sqlCondition = new StringBuilder();
		if(!StringUtil.isNullOrEmpty(terminalNum)) {
    		sqlCondition.append(" and terminal_id= :terminalNum ");
    		params.put("terminalNum", terminalNum);
    	}
		if (!StringUtil.isNullOrEmpty(startTime)) {
			sqlCondition.append(" and create_date_time >= :startTime ");
			params.put("startTime", startTime);
		}
		if (!StringUtil.isNullOrEmpty(endTime)) {
			sqlCondition.append(" and create_date_time <= :endTime ");
			params.put("endTime", endTime);
		}
		StringBuilder sql = new StringBuilder();
		sql.append(sql1);
		sql.append(sqlCondition);
		List<HistoryData> data=getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<>(HistoryData.class));
		return data;
	}

	@Override
	public List<Terminal> getTerNum(String terName) {
		String sql=new StringBuffer()
				.append(" select terminal_num ")
				.append(" from terminal ")
				.append(" where terminal_name=? ")
				.toString();
		List<Terminal> list = getJdbcTemplate().query(sql, new Object[]{terName}, new BeanPropertyRowMapper<>(Terminal.class));
		return list;
	}

}
