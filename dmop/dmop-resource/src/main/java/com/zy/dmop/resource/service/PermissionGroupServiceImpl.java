package com.zy.dmop.resource.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dexcoder.dal.JdbcDao;
import com.dexcoder.dal.build.Criteria;
import com.dexcoder.dal.build.CriteriaBoundSql;
import com.zy.dmop.api.common.exception.ErrorMessageException;
import com.zy.dmop.api.common.exception.permission.ConvertComponentToPermissionPoolException;
import com.zy.dmop.api.common.exception.permission.DeletePermissionGroupException;
import com.zy.dmop.api.common.exception.permission.GetPermissionGroupByOrganizationException;
import com.zy.dmop.api.common.exception.permission.QueryPermissionGroupBindedUserException;
import com.zy.dmop.api.common.exception.permission.UnbindPermissionGroupException;
import com.zy.dmop.api.common.exception.permission.UpdatePermissionGroupException;
import com.zy.dmop.api.common.exception.permission.UpdatePermissionPoolException;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.PermissionGroupDao;
import com.zy.dmop.api.web.dao.PermissionPoolDao;
import com.zy.dmop.api.web.dao.UserDao;
import com.zy.dmop.api.web.service.PermissionGroupService;
import com.zy.dmop.model.PermissionGroup;
import com.zy.dmop.model.PermissionPool;
import com.zy.dmop.model.User;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;


@Component("permissiongroupService")
@Transactional(propagation=Propagation.REQUIRED)
public class PermissionGroupServiceImpl implements PermissionGroupService{
	private static Logger log=Logger.getLogger(PermissionGroupServiceImpl.class); 
	@Autowired
	private PermissionGroupDao permissiongroupDao;
	@Autowired
	private PermissionPoolDao permissionPoolDao;
	@Autowired
	private JdbcDao jdbcDao;
	@Autowired
	private UserDao userDao;
	@Override
	public PageResult<PermissionGroup> pageQueryPermissionGroup(Page page) throws ErrorMessageException{
		PageResult<PermissionGroup> pageResult;
		pageResult = permissiongroupDao.pageQueryPermissionGroup(page);
		return pageResult;

	}

	@Override
	public boolean createPermissionGroup(PermissionGroup permissiongroup,List<Map<String, Object>> components) {
		Long groupId = null;
		try {
			groupId = jdbcDao.insert(permissiongroup);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		permissiongroup.setPermissionGroupId(groupId.intValue());
		CacheUtil.updateModel(CacheConstant.MODEL_PERMISSION_GROUP, groupId.intValue(), permissiongroup);
		//将TreeDataComponent拆分成PermissionPool对象
		List<PermissionPool> pools = new ArrayList<>();
		if(null!=groupId){
			try {
				pools = convertComponents2PermissionPool(components,groupId.intValue());
			} catch (Exception e) {

				e.printStackTrace();
				return false;
			}			
		}
		int affected = 0;
		if(pools.size()!=0){
			try {
				affected = permissionPoolDao.batchInsert(pools);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		
		return affected==pools.size();
	}


	@Override
	public void deletePermissionGroup(int id) throws Exception {
		User criteria = new User();
		criteria.setPermissionGroupId(id);
		List<User> list = null;
		try {
			list = jdbcDao.queryList(criteria);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			throw new QueryPermissionGroupBindedUserException("权限组绑定用户查询失败");
		}
		//给所有解除绑定的用户绑定0权限
		
		if(null!=list){
			if(!list.isEmpty()){
				int affected = 0;
				try {
					affected = userDao.batchUnbindPermissionGroup(list);
				} catch (Exception e) {
					log.error(e);
					e.printStackTrace();
					throw new UnbindPermissionGroupException("解除权限组绑定失败");
				}				
				if(list.size()==affected){
					try {
						jdbcDao.delete(PermissionGroup.class, new Long(id));
						Criteria criteria1 = Criteria.delete(PermissionPool.class).where("permission_group_id",new Object[]{id});
						jdbcDao.delete(criteria1);
					} catch (Exception e) {
						log.error(e);
						e.printStackTrace();
						throw new DeletePermissionGroupException("删除权限组失败");
					}
				}
			}else{
				try {
					jdbcDao.delete(PermissionGroup.class, new Long(id));
					Criteria criteria1 = Criteria.delete(PermissionPool.class).where("permission_group_id",new Object[]{id});
					jdbcDao.delete(criteria1);
				} catch (Exception e) {
					log.error(e);
					e.printStackTrace();
					throw new DeletePermissionGroupException("删除权限组失败");
				}
			}
		}
		
		CacheUtil.updateModel(CacheConstant.MODEL_PERMISSION_GROUP, id, null);
		
	}

	@Override
	public PermissionGroup getPermissionGroupById(int permissiongroupId) {
		PermissionGroup group =new PermissionGroup();
		try {
			group = jdbcDao.get(PermissionGroup.class,new Long(permissiongroupId));
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return group;
	}

	@Override
	public boolean updatePermissionGroup(PermissionGroup permissiongroup, List<Map<String, Object>> poolData) throws Exception {
		
		 Criteria criteria = Criteria.update(PermissionGroup.class)
				 .set("name",permissiongroup.getName())
				 .set("description",permissiongroup.getDescription())
				 .set("custom_id",permissiongroup.getCustomId())
				 .set("modify_date_time",permissiongroup.getModifyDateTime())
				 .set("organization_id",permissiongroup.getOrganizationId())
				 .where("permission_group_id", new Object[]{permissiongroup.getPermissionGroupId()});
		int affected = 0;
		try {
			affected = jdbcDao.update(criteria);
			CacheUtil.updateModel(CacheConstant.MODEL_PERMISSION_GROUP, permissiongroup.getPermissionGroupId(), permissiongroup);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			throw new UpdatePermissionGroupException("更新权限组失败");
		}
		List<PermissionPool> pools = new ArrayList<>();
		if(affected!=0){
			
			try {
				pools = convertComponents2PermissionPool(poolData,permissiongroup.getPermissionGroupId().intValue());
			} catch (Exception e) {
				log.error(e);
				e.printStackTrace();
				throw new ConvertComponentToPermissionPoolException("构建权限树失败");
			}	
		}
		
		if(pools.size()==poolData.size()){
			int batchUpdate = 0;
			try {
				batchUpdate = permissionPoolDao.batchUpdate(pools);
				
			} catch (Exception e) {
				log.error(e);
				e.printStackTrace();
				throw new UpdatePermissionPoolException("改变权限池出错");
			}
			
			return batchUpdate==pools.size();
			
		}
		return false;
	}
	private List<PermissionPool> convertComponents2PermissionPool(List<Map<String, Object>> components,Integer groupId) {
		List<PermissionPool> pools = new ArrayList<>();
		for(Map<String, Object> component :components){
			String permissionId = (String) component.get("permissionId");
			List<String> bitArray = (List<String>)component.get("permissionBit");
			Integer bit = extextractBit(bitArray);			
			PermissionPool pool = new PermissionPool();
			pool.setPermissionBit(bit);
			pool.setPermissionGroupId(groupId);
			pool.setPermissionId(Integer.parseInt(permissionId));
			pools.add(pool);
		}
		
		return pools;
	}
	
	private Integer extextractBit(List<String> bits){

		
		List<String> binaryArray = new ArrayList<>();
		for(int i = 0;i<8;i++){
			binaryArray.add("");
		}
		
		for(String bit : bits){
			String[] codes = bit.split("\\.");
			String tail = codes[codes.length-1];
			switch (tail) {
			case "show":
				binaryArray.set(7, "1");
				break;
			case "export":
				binaryArray.set(6, "1");
				break;
			case "add":
				binaryArray.set(5, "1");
				break;
			case "import":
				binaryArray.set(4, "1");
				break;
			case "delete":
				binaryArray.set(3, "1");
				break;
			case "update":
				binaryArray.set(2, "1");
				break;
			case "py":
				binaryArray.set(1, "1");
				break;
			case "px":
				binaryArray.set(0, "1");
				break;
			}
		}
		StringBuffer binaryStr = new StringBuffer();
		for(String binary : binaryArray){
			String checked = "".equals(binary)?"0":binary;
			binaryStr.append(checked);
		}
		int binaryValue = Integer.parseInt(binaryStr.toString(), 2);
		return binaryValue;
	}

	@Override
	public List<PermissionGroup> getPermissionGroupByOrganization(Integer organization) throws Exception {
		PermissionGroup group = new PermissionGroup();
		group.setOrganizationId(organization);
		List<PermissionGroup> groups = null;
		try {
			groups = jdbcDao.queryList(group);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			throw new GetPermissionGroupByOrganizationException("查询可见的权限组失败");
		}
		return null==groups?new ArrayList<PermissionGroup>():groups;
	}

	
	
	

}
