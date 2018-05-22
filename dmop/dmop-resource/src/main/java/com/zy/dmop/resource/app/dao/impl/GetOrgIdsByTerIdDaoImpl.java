package com.zy.dmop.resource.app.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.resource.app.dao.GetOrgIdsByTerIdDao;
@Component("getOrgIdsByTerIdDao")
public class GetOrgIdsByTerIdDaoImpl extends NamedParameterJdbcDaoSupport implements GetOrgIdsByTerIdDao {

	@Override
	public Integer getOrgIds(String terminalId) {
		String sql="select organization_id from terminal where terminal_num=:terminalId";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("terminalId", terminalId);
		Integer orgId=getNamedParameterJdbcTemplate().queryForObject(sql, params, int.class);
		return orgId;
	}

}
