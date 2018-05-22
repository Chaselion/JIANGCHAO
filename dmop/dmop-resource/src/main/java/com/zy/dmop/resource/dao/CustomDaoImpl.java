package com.zy.dmop.resource.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.CustomDao;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;

@Component("customDao")
public class CustomDaoImpl extends NamedParameterJdbcDaoSupport implements
		CustomDao {

	@Override
	public Custom createCustom(final Custom custom) {
		final Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		final String sql = "insert into custom(name, link_man_name, link_man_phone, type, create_date_time, expire_date_time,location,state,description,modify_date_time,note) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int count = getJdbcTemplate().update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				int i = 0;

				PreparedStatement ps = con.prepareStatement(sql,
						Statement.RETURN_GENERATED_KEYS);
				ps.setString(++i, custom.getName());
				ps.setString(++i, custom.getLinkManName());
				ps.setString(++i, custom.getLinkManPhone());
				ps.setInt(++i, custom.getType());
				ps.setTimestamp(++i, new Timestamp(System.currentTimeMillis()));
				ps.setDate(++i, new Date(custom.getExpireDateTime().getTime()));
				ps.setString(++i, custom.getLocation());
				ps.setInt(++i, custom.getState());
				ps.setString(++i, custom.getDescription());
				ps.setDate(++i, new Date(custom.getModifyDateTime().getTime()));
				ps.setString(++i, custom.getNote());
				/*
				 * if (role.getTenantId() == 0L) { ps.setNull(++i,
				 * Types.BIGINT); } else { ps.setLong(++i, role.getTenantId());
				 * }
				 */

				return ps;
			}
		}, keyHolder);

		if (count == 0) {
			return null;
		} else {
			int id = keyHolder.getKey().intValue();
			custom.setCustomId(keyHolder.getKey().intValue());
			custom.setCreateDateTime(timestamp);
			custom.setModifyDateTime(timestamp);
			CacheUtil.updateModel(CacheConstant.MODEL_CUSTOM, id, custom);
			return custom;
		}
	}

	@Override
	public Custom getCustom() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCustom(int id) {
		String sql = "delete from custom where custom_Id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		getNamedParameterJdbcTemplate().update(sql, params);
		CacheUtil.updateModel(CacheConstant.MODEL_CUSTOM, id, null);
	}

	@Override
	public void updateCustom(Custom custom) {
		String sql = "update custom set name=:name, link_man_name=:linkname, link_man_phone=:linkphone, type=:type, location=:location, expire_date_time=:etime, state=:state, note=:note, modify_date_time=:newtime, description=:description where custom_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		try {
			params.put("name", custom.getName());
			params.put("description", custom.getDescription());
			params.put("linkname", custom.getLinkManName());
			params.put("linkphone", custom.getLinkManPhone());
			params.put("type", custom.getType());
			params.put("location", custom.getLocation());
			params.put("state", custom.getState());
			params.put("newtime", custom.getModifyDateTime());
			params.put("etime", custom.getExpireDateTime());
			params.put("id", custom.getCustomId());
			params.put("note", custom.getNote());
		} catch (Exception e) {
			e.printStackTrace();
		}
		getNamedParameterJdbcTemplate().update(sql, params);
		Object obj = CacheUtil.getModel(CacheConstant.MODEL_CUSTOM, custom.getCustomId());
		Custom custommodel = (Custom) obj;
		custommodel.setName(custom.getName());
		custommodel.setDescription(custom.getDescription());
		custommodel.setLinkManName(custom.getLinkManName());
		custommodel.setLinkManPhone(custom.getLinkManPhone());
		custommodel.setType(custom.getType());
		custommodel.setLocation(custom.getLocation());
		custommodel.setState(custom.getState());
		custommodel.setModifyDateTime(custom.getModifyDateTime());
		custommodel.setExpireDateTime(custom.getExpireDateTime());
		custommodel.setNote(custom.getNote());
		CacheUtil.updateModel(CacheConstant.MODEL_CUSTOM, custommodel.getCustomId(), custommodel);
	}

	@Override
	public PageResult<Custom> pageQueryCustom(String name, Page page) {
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_CUSTOM);
		if (cache != null && cache.size() > 0 && name == "" ) {

			List<Custom> list = new ArrayList<>();
			for (Object o : cache) {
				Custom custom = (Custom) o;
					list.add(custom);
				
			}
			page.setCount(list.size());
			int end=list.size()-page.getStart();
			int end1=page.getStart()+page.getLimit();
			list = list.subList(
					page.getStart(),
					page.getLimit() > end ? list.size() : end1);
			PageResult<Custom> pr = new PageResult<Custom>(page, list);
			return pr;
		} else {
		
		
		Map<String, Object> params = new HashMap<String, Object>();

		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append("from custom where name like :name ");
		params.put("name", "%" + name + "%");

		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append(sqlCondition.toString());
		sql.append(" order by create_date_time desc limit " + page.getStart()
				+ ", " + page.getLimit());

		StringBuilder sqlCount = new StringBuilder();
		sqlCount.append("select count(*) ");
		sqlCount.append(sqlCondition.toString());

		List<Custom> list = getNamedParameterJdbcTemplate().query(
				sql.toString(), params,
				new BeanPropertyRowMapper<Custom>(Custom.class));
		int count = getNamedParameterJdbcTemplate().queryForObject(
				sqlCount.toString(), params, Integer.class);

		page.setCount(count);
		PageResult<Custom> pr = new PageResult<Custom>(page, list);
		return pr;
	}
		}

	@Override
	public Custom getCustomById(int customId) {
		String sql = "select * from custom where custom_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", customId);

		List<Custom> customs = getNamedParameterJdbcTemplate().query(sql,
				params, new BeanPropertyRowMapper<Custom>(Custom.class));
		if (customs == null || customs.size() != 1) {
			return null;
		} else {
			return customs.get(0);
		}
	}

	@Override
	public List<Custom> getCustoms() {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from custom ");

		return getNamedParameterJdbcTemplate().query(sql.toString(),
				new BeanPropertyRowMapper<Custom>(Custom.class));
	}

	@Override
	public String getCustomLocation(Integer customId) {
		String sql = "select location from custom where custom_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", customId);
		if (customId != 0) {
			String location = new String();
			try {
				location = getNamedParameterJdbcTemplate().queryForObject(sql,
						params, String.class);
				return location;
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String locationa = "常州";

		return locationa;

	}

	@Override
	public List<Custom> getExpireTime() {
		String sql = "select expire_date_time from custom ";
		List<Custom> expireTime = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper<Custom>(Custom.class));
		return expireTime;
	}

	@Override
	public void updateState(String time) {
		String sql = "update custom set state=2 where expire_date_time=:time";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("time", time);
		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_CUSTOM);
		List<Custom> list = new ArrayList<>();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		for (Object o : cache) {
			Custom custom = (Custom) o;
				if (time.equals(sdf.format(custom.getExpireDateTime()))) {
					custom.setState(2);
					CacheUtil.updateModel(CacheConstant.MODEL_CUSTOM, custom.getCustomId(), custom);
				}
			}
	}

	@Override
	public List<Custom> getAllUserForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from custom order by create_date_time desc";
		List<Custom> custom = getNamedParameterJdbcTemplate().query(sql,
				params, new BeanPropertyRowMapper<Custom>(Custom.class));
		return custom;
	}

}
