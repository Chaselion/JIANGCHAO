package com.zy.dmop.resource.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
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

import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;

@Component("organizationDao")
public class OrganizationDaoImpl extends NamedParameterJdbcDaoSupport implements OrganizationDao{
	List<Organization> childMenu=new ArrayList<Organization>(); 
	@Override
	public List<Organization> findChildOrgsByParentId(List<Organization> menuList, long parentId) {
		//List<Organization> childMenu=new ArrayList<Organization>(); 
		for(Organization mu: menuList){
            //遍历出父id等于参数的id，add进子节点集合  
            if(Integer.valueOf(mu.getParentId())==parentId){  
                //递归遍历下一级  
            	findChildOrgsByParentId(menuList,mu.getOrganizationId()); 
                childMenu.add(mu);  
            }  
        }  
    return childMenu;  
	}

	@Override
	public Organization findOrganizationById(int id) {
        String sql = "select * from organization where organization_id = :id";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		
		List<Organization> orgs = getNamedParameterJdbcTemplate().query(sql, params, new BeanPropertyRowMapper<Organization>(Organization.class));
		
		if (orgs.size() != 0) {
			return orgs.get(0);
		}
		
		return null;
	}

	@Override
	public List<Organization> getSystemOrganizations(int customid) {
        String sql = "select * from organization ";
        Map<String, Object> params = new HashMap<String, Object>();
		
		StringBuilder sqlCondition = new StringBuilder();
    	
    	if (customid != 0) {
    		sqlCondition.append("where custom_id = :id ");
    		params.put("id", customid);
    	}
    	sql=sql+sqlCondition.toString();
    	Organization oo=findOrganizationById(1);
        List<Organization> list = getNamedParameterJdbcTemplate().query(sql, params,new BeanPropertyRowMapper<Organization>(Organization.class));
        if (customid != 0) {
        list.add(oo);
        }
        
		return list;
	}

	@Override
	public void create(final Organization org) {
		final String sql = "insert into organization(custom_id, type, parent_id, name, description, create_date_time,alarm_strategy_id,modify_date_time, note) " +
				"values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
//				"values(:type, :parentId, :tenantId, :name, :description, :createDate)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        
        
        
        int count = getJdbcTemplate().update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                int i = 0;

                PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(++i, org.getCustomId());
                ps.setInt(++i, org.getType());
                
                if (org.getParentId() == 0) {
                	ps.setNull(++i, Types.BIGINT);
                } else {
                	ps.setInt(++i, org.getParentId());
                }
                ps.setString(++i, org.getName());
                ps.setString(++i, org.getDescription());
                ps.setTimestamp(++i, new Timestamp(org.getCreateDateTime().getTime()));
                if(org.getAlarmStrategyId()==null) {
                	org.setAlarmStrategyId(1);
                }
                if(org.getModifyDateTime()==null) {
                	org.setModifyDateTime(new Date());
                }
                ps.setInt(++i, org.getAlarmStrategyId());
                ps.setTimestamp(++i, new Timestamp(org.getModifyDateTime().getTime()));
                ps.setString(++i, org.getNote());
                return ps;
            }
        }, keyHolder);

//		int count = getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(org), keyHolder);
        if (count == 0) {
            return;
        } else {
            org.setOrganizationId(keyHolder.getKey().intValue());
            CacheUtil.updateModel(CacheConstant.MODEL_ORGANIZATION, org.getOrganizationId(), org);
            return;
        }
		
	}

	@Override
	public void update(Organization org) {
        String sql = "update organization set name=:name,alarm_strategy_id=:alarmstrategyid,modify_date_time=:modifydatetime,note=:note, description=:description where organization_id=:id";
        if(org.getAlarmStrategyId()==null) {
        	org.setAlarmStrategyId(-1);
        }
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", org.getName());
		params.put("alarmstrategyid", org.getAlarmStrategyId());
		params.put("modifydatetime", org.getModifyDateTime());
		params.put("note", org.getNote());
		params.put("description", org.getDescription());
		params.put("id", org.getOrganizationId());
		
		getNamedParameterJdbcTemplate().update(sql, params);
		Object obj = CacheUtil.getModel(CacheConstant.MODEL_ORGANIZATION, org.getOrganizationId());
		Organization orgmodel = (Organization) obj;
		orgmodel.setName(org.getName());
		orgmodel.setAlarmStrategyId(org.getAlarmStrategyId());
		orgmodel.setModifyDateTime(org.getModifyDateTime());
		orgmodel.setNote(org.getNote());
		orgmodel.setDescription(org.getDescription());
	    CacheUtil.updateModel(CacheConstant.MODEL_ORGANIZATION, orgmodel.getOrganizationId(), orgmodel);
	}

	@Override
	public int getChildOrganizationCount(int id) {
        String sql = "select count(*) from organization where parent_id=:parent_id";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("parent_id", id);
		int count = getNamedParameterJdbcTemplate().queryForObject(sql, params, Integer.class);
		return count;
	}

	@Override
	public void delete(int id) {
        String sql = "delete from organization where organization_id=:id";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		
		getNamedParameterJdbcTemplate().update(sql, params);
		CacheUtil.updateModel(CacheConstant.MODEL_ORGANIZATION, id, null);
	}

	@Override
	public List<Organization> getOrganizations() {
		StringBuilder sql = new StringBuilder();
    	sql.append("select * from organization ");
  
		return getNamedParameterJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Organization>(Organization.class));
	}

	@Override
	public Integer getcustomId(Integer orgId) {
		String sql = "select custom_id from organization where organization_id=:id";
		
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("id", orgId);
    	Integer customId=0;
		try {
			customId = getNamedParameterJdbcTemplate().queryForObject(sql, params, Integer.class);
		 return customId;
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
			return customId;
	}

	@Override
	public List<Organization> getAllOrganizationForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from organization";
		List<Organization> organizations = getNamedParameterJdbcTemplate().query(sql, params,
				new BeanPropertyRowMapper<Organization>(Organization.class));
		return organizations;
	}
	
	

}
