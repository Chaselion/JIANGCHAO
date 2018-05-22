package com.zy.dmop.resource.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.dao.PermissionGroupDao;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;



@Component("permissiongroupDao")
public class PermissionGroupDaoImpl extends NamedParameterJdbcDaoSupport implements PermissionGroupDao{

	@Override
	public PermissionGroup createPermissionGroup(PermissionGroup permissiongroup) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PermissionGroup getPermissionGroup() {
		return null;
		 
	}

	@Override
	public void deletePermissionGroup(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePermissionGroup(PermissionGroup PermissionGroup) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageResult<PermissionGroup> pageQueryPermissionGroup(Page page) {
		User user = SessionUtil.getCommonUserFromSession();
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_PERMISSION_GROUP);
		if (cache != null && cache.size() > 0) {
			List<PermissionGroup> list = new ArrayList<>();
			for (Object o : cache) {
				PermissionGroup permissionGroup = (PermissionGroup) o;
				if (user.getOrganizationId()==permissionGroup.getOrganizationId()) {
					list.add(permissionGroup);
				}
			}
			page.setCount(list.size());
			int end=list.size()-page.getStart();
			int end1=page.getStart()+page.getLimit();
			list = list.subList(
					page.getStart(),
					page.getLimit() > end ? list.size() : end1);
			PageResult<PermissionGroup> pr = new PageResult<PermissionGroup>(page, list);
			return pr;
		} else {
		Map<String, Object> params = new HashMap<String, Object>();	
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append("from permission_group ");
		sqlCondition.append(" where organization_id = :organizationId ");
		params.put("organizationId", user.getOrganizationId());
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append(sqlCondition.toString());
		sql.append(" order by create_date_time desc limit " + page.getStart() + ", " + page.getLimit());

		StringBuilder sqlCount = new StringBuilder();
		sqlCount.append("select count(*) ");
		sqlCount.append(sqlCondition.toString());

		List<PermissionGroup> list = getNamedParameterJdbcTemplate().query(sql.toString(),params, new BeanPropertyRowMapper<PermissionGroup>(PermissionGroup.class));
		int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);

		page.setCount(count);
		PageResult<PermissionGroup> pr = new PageResult<PermissionGroup>(page, list);
		return pr;
	}
		}

	@Override
	public PermissionGroup getPermissionGroupById(int permissiongroupId) {
		String sql = "select * from permission_group where permission_group_id=:id";
		
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("id", permissiongroupId);
		
		List<PermissionGroup> permissiongroups = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<PermissionGroup>(PermissionGroup.class));
		if (permissiongroups == null || permissiongroups.size() != 1) {
			return null;
		} else {
			return permissiongroups.get(0);
		}
	}

	@Override
	public List<PermissionGroup> getAllPermissionGroupForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from permission_group order by create_date_time desc";
		List<PermissionGroup> permissiongroups = getNamedParameterJdbcTemplate().query(sql, params,
				new BeanPropertyRowMapper<PermissionGroup>(PermissionGroup.class));
		return permissiongroups;
	}

}
