package com.zy.dmop.security.dao.impl;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.Permission;
import com.zy.dmop.model.vo.PermissionVo;
import com.zy.dmop.security.dao.UserPermissionDao;
@Component("userPermissionDao")
public class UserPermissionDaoImpl implements UserPermissionDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<PermissionVo> list() {
		/**
		 * select p.permission_id , p.belongto,p.sequence,p.name,p.iconcls,p.url,p.code,pp.permission_bit from 
		 * permission p inner join permission_pool pp on pp.permission_id = p.permission_id 
		 * inner join permission_group pg on pp.permission_group_id = pg.permission_group_id 
		 * where pg.custom_id is null
		 */
		String sql = new StringBuffer()
				.append("select distinct p.permission_id , p.belongto,p.sequence,p.name,p.iconcls,p.url,p.code ")
				.append("from ")
				.append("	permission p inner join permission_pool pp on pp.permission_id = p.permission_id ")
				.append("	inner join permission_group pg on pp.permission_group_id = pg.permission_group_id ")
				.append("where pg.custom_id is null ")
				.toString();
		List<PermissionVo> list = jdbcTemplate.query(sql, new RowMapper<PermissionVo>() {
			@Override
			public PermissionVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				int id = rs.getInt("permission_id");
				int belongto = rs.getInt("belongto");
				int sequence = rs.getInt("sequence");
				String text = rs.getString("name");
				String iconcls = rs.getString("iconcls");
				String url = rs.getString("url");
				String config_meta_code = rs.getString("code");
				PermissionVo vo = new PermissionVo(id, belongto, sequence, config_meta_code, iconcls, text, url, null, null, null);
				return vo;
			}
		});		
		return list;
	}
	@Override
	public List<PermissionVo> findByPermissionGroupId(Integer permissionGroupId) {
		String sql = new StringBuffer()
				.append("select p.permission_id , p.belongto,p.sequence,p.name,p.iconcls,p.url,p.code,pp.permission_bit ")
				.append("from ")
				.append("	permission p left join permission_pool pp on pp.permission_id = p.permission_id ")
				.append("where pp.permission_group_id = ? ")
				.toString();
		List<PermissionVo> list = jdbcTemplate.query(sql,new Object[]{permissionGroupId}, new RowMapper<PermissionVo>() {
			@Override
			public PermissionVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				int id = rs.getInt("permission_id");
				int belongto = rs.getInt("belongto");
				int sequence = rs.getInt("sequence");
				String text = rs.getString("name");
				String iconcls = rs.getString("iconcls");
				String url = rs.getString("url");
				String config_meta_code = rs.getString("code");
				int bit = rs.getInt("permission_bit");
				PermissionVo vo = new PermissionVo(id, belongto, sequence, config_meta_code, iconcls, text, url, null, null, bit);
				return vo;
			}
		});		
		return list;
	}
	/**
	 * select p.permission_id,p.belongto,p.sequence,p.organization_id,p.permission_type,p.name,p.code,p.iconcls,
	 * p.url,p.description,pp.permission_group_id,pp.permission_bit,p.create_date_time,p.modify_date_time,p.note 
	 * from permission p left join permission_pool pp on pp.permission_id = p.permission_id where pp.permission_group_id =1;
	 */
	@Override
	public List<Permission> findPermissionFromPoolByPermissionGroupId(Integer permissiongroupId) {
		String sql = new StringBuffer()
				.append("select p.permission_id,p.belongto,p.sequence,p.organization_id,p.permission_type,p.name,p.code,p.iconcls, ")
				.append("p.url,p.description,pp.permission_group_id,pp.permission_bit,p.create_date_time,p.modify_date_time,p.note ")
				.append("from ")
				.append("	permission p left join permission_pool pp ")
				.append("on ")
				.append("	pp.permission_id = p.permission_id ")
				.append("where ")
				.append("	pp.permission_group_id =? ")
				.toString();
		
		List<Permission> list = jdbcTemplate.query(sql, new Object[]{permissiongroupId}, new BeanPropertyRowMapper<>(Permission.class));
		
		return list;
	}
}
