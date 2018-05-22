package com.zy.dmop.resource.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dexcoder.dal.JdbcDao;
import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.OrganizationDao;
import com.zy.dmop.api.web.dao.UserDao;
import com.zy.dmop.api.web.service.OrganizationService;
import com.zy.dmop.api.web.service.UserService;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.UserCustomVo;


@Component("userService")

public class UserServiceImpl implements UserService {
	private static final Logger log = Logger.getLogger(UserServiceImpl.class);
	@Autowired
	private JdbcDao jdbcDao;
	@Autowired
	private OrganizationService organizationService;

	@Autowired
	private UserDao userDao;
	@Autowired
	private OrganizationDao organizationDao;
	@Override
	public User findUserByUsername(String username) {
		return userDao.findUserByUsername(username);
	}

	@Override
	public long getUserCountOfOrganization(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageResult<User> queryUsers(User loginUser, String username, String realname, int queryOrgId, String status,
			String startCreateDateStr, String endCreateDateStr, Page page) {
		List<Integer> orgIds = new ArrayList<Integer>();

		int userState = 1;
		Date startCreateDateSql = null;
		Date endCreateDateSql = null;
		PageResult<User> userPage = userDao.queryUsers(username, realname, orgIds, userState, startCreateDateSql,endCreateDateSql, page);

		// int totalCount =
		// userDao.getUserCountOfOrganizations(userBelongOrg.getOrgTreeIds());

		// userPage.getPage().setCount(totalCount);

		return userPage;
	}

	@Override
	public User createUser(User user) {
		SecureRandomNumberGenerator secureRandomNumberGenerator = new SecureRandomNumberGenerator();
        String salt = secureRandomNumberGenerator.nextBytes().toHex();

        String password = encryptPassword(user.getPassword(), salt);

        user.setPassword(password);
        user.setSalt(salt);
        
		userDao.createUser(user);
		return user;
	}
	
	private String encryptPassword(String password, String salt) {
		return new Sha256Hash(password, ByteSource.Util.bytes(salt), 1024).toHex();
	}

	@Override
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	@Override
	public void deleteUser(int id) {
		userDao.deleteUser(id);

	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);

	}

	@Override
	public boolean isUsernameExist(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updatePwd(User user, String oldPwd, String newPwd) {
		// TODO Auto-generated method stub
		String encryptOldPwd = encryptPassword(oldPwd, user.getSalt());
		if (encryptOldPwd.equals(user.getPassword())) {
			String encryptNewPwd = encryptPassword(newPwd, user.getSalt());
			userDao.updatePassword(encryptNewPwd, user.getUserId());
			user.setPassword(encryptNewPwd);	//数据库更新成功后更新缓存
			
			return; 
		}
		
		throw new IncorrectPasswordException("修改密码失败!输入的旧密码不正确!");

	}

	@Override
	public void updateUserInfo(long userId, String realname, String mobilePhone, String email) {
		// TODO Auto-generated method stub

	}

	@Override
	public PageResult<User> getAllUserByRole(long tenantId, long roleId, Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUsers(Integer organizationId,String realname) {
		// TODO Auto-generated method stub
		int o=organizationId;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organizationId);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();
		List<User> users=userDao.getUsers(aorgIds,realname);
		aorgIds.clear();
		return users;
	}

	@Override
	public PageResult<User> queryUsers(Integer organizationId,String realname,Page page) {
		PageResult<User> pageResult;
		int o=organizationId;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organizationId);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();

		pageResult=userDao.queryUsers(aorgIds,realname,page);
		aorgIds.clear();
		return pageResult;
	}

	@Override
	public void updateUserStatus(int id, int state) {
		userDao.updateUserStatus(id, state);
		
	}

	@Override
	public void initPwd(User user, String newPwd) {
		
		
			String encryptNewPwd = encryptPassword(newPwd, user.getSalt());
			userDao.initPassword(user.getUserId(),encryptNewPwd);
			user.setPassword(encryptNewPwd);	//数据库更新成功后更新缓存
			
			return; 
		
		
		
	}

	@Override
	public User findByUsername(String username) {
		User criteria = new User();
		criteria.setUsername(username);
		return jdbcDao.querySingleResult(criteria);
	}

	@Override
	public List<User> getUserByPermissionGroup(int permissionGroupId) {
		User criteria = new User();
		criteria.setPermissionGroupId(permissionGroupId);
		return jdbcDao.queryList(criteria);
	}

	@Override
	public List<User> getUsersByCustomid(Integer custom) {
		// TODO Auto-generated method stub
		return userDao.getUsersbyCustom(custom);
	}
	@Override
	public List<UserCustomVo> getUserCustom() {
		return userDao.getUserCustom();
	}

	@Override
	public List<User> getUserByOrgId(Integer organizationId) {
		int o=organizationId;
		List<Organization> menu=organizationDao.getOrganizations();
		List<Organization> orgs=organizationDao.findChildOrgsByParentId(menu, organizationId);
		Organization aorg=organizationDao.findOrganizationById(o);
		orgs.add(aorg);
		List<Integer> aorgIds =new ArrayList<Integer>();
		for(Organization org : orgs){
			Integer orgId =org.getOrganizationId();
					aorgIds.add(orgId);
			}
		orgs.clear();
		List<User> users=userDao.listByOrg(aorgIds);
		aorgIds.clear();
		return users;
	}

	@Override
	public void deleteUserByOrg(int organizationId) {
		// TODO Auto-generated method stub
		userDao.deleteUserByOrg(organizationId);
	}

}
