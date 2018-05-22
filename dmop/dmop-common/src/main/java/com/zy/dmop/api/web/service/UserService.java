package com.zy.dmop.api.web.service;

import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.UserCustomVo;


public interface UserService {
	public User findUserByUsername(String username);

	public long getUserCountOfOrganization(long id);

	public PageResult<User> queryUsers(User loginUser, String username, String realname, int queryOrgId, String status,
			String startCreateDateStr, String endCreateDateStr, Page page);

	public User createUser(User user);

	public User getUserById(int id);

	public void deleteUser(int id);
	
	public void deleteUserByOrg(int organizationId);

	public void updateUser(User user);

	public boolean isUsernameExist(String username);

	public void updateUserStatus(int id, int state);

	void updatePwd(User user, String oldPwd, String newPwd);
	
	void initPwd(User user,String newPwd);
	


	public void updateUserInfo(long userId, String realname, String mobilePhone, String email);
	
	public PageResult<User> getAllUserByRole(long tenantId, long roleId, Page page);

	//public PageResult<User> getUsers(List<Long> userIds, String realname, UserType userType, Long tenantId, Page page);

	//public List<User> getUsers(List<Long> userIds, UserType userType, Long tenantId);

	public List<User> getUsers(Integer organizationId,String realname);
	
	public PageResult<User> queryUsers(Integer organizationId,String realname,Page page);

	public User findByUsername(String username);

	public List<User> getUserByPermissionGroup(int permissionGroupId);
	
	public List<User> getUsersByCustomid(Integer custom);

	List<UserCustomVo> getUserCustom();
	public List<User> getUserByOrgId(Integer organizationId);
	
}
