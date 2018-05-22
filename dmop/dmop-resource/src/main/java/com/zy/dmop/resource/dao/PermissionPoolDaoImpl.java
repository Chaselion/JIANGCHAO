package com.zy.dmop.resource.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.PermissionPoolDao;
import com.zy.dmop.model.PermissionPool;
@Component("permissionPoolDao")
public class PermissionPoolDaoImpl extends NamedParameterJdbcDaoSupport implements PermissionPoolDao {

	@Override
	public int batchInsert(List<PermissionPool> pools) {
		String sql = new StringBuffer()
				.append("insert into permission_pool ")
				.append("	(permission_id,permission_group_id,permission_bit) ")
				.append("values ")
				.append("	(:permissionId,:permissionGroupId,:permissionBit) ")
				.toString();
		SqlParameterSource[] params = SqlParameterSourceUtils.createBatch(pools.toArray());
		 int[] update = getNamedParameterJdbcTemplate().batchUpdate(sql, params);
		return update.length;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int batchUpdate(final List<PermissionPool> pools) {
		final String sql = new StringBuffer()
				.append("update permission_pool ")
				.append("	set permission_bit = ? ")
				.append("where permission_group_id = ? and permission_id = ? ")
				.toString();
		int[] affected = getJdbcTemplate().batchUpdate(sql, new BatchPreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setInt(1, pools.get(i).getPermissionBit());
				ps.setInt(2, pools.get(i).getPermissionGroupId());
				ps.setInt(3, pools.get(i).getPermissionId());
			}
			
			@Override
			public int getBatchSize() {
				return pools.size();
			}
		});
		return affected.length;
	}

}
