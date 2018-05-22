package com.zy.dmop.api.web.dao;

import java.sql.Date;
import java.util.List;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmCondition;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.UserCustomVo;



public interface UserDao {
	public User findUserByUsername(String username);

	public long getUserCountOfOrganization(long organizationId);

	public PageResult<User> queryUsers(String username, String realname, List<Integer> orgIds, int userState,
			Date startCreateDate, Date endCreateDate,  Page page);

	public User createUser(User user);

	public User getUserById(int id);

	public void deleteUser(int id);
	//获取所有用户缓存
	public List<User> getAllUserForCache();
	
	public void deleteUserByOrg(int organizationId);

	public void updateUser(User user);

	public void updateUserStatus(int id, int userState);

	public void updatePassword(String encryptNewPwd, long id);
	
	public void initPassword(int id,String psd);

	//public User findTenantAdminUser(long id, UserCreatorType userCreatorType,
			//UserType userType);

	public void updateUserInfo(long userId, String realname, String mobilePhone, String email);
	
	public PageResult<User> getAllUserByRole(final long tenatId, final long roleId, final Page page);

	//public PageResult<User> getUsers(List<Long> userIds, String realname, UserType userType, Long tenantId, Page page);

	public List<User> getUsersbyCustom(Integer custom);
	
	public List<User> getUsers(List<Integer> aorgIds,String realname);
	
	public PageResult<User> queryUsers(List<Integer> orgIds,String realname,Page page);

	public int batchUnbindPermissionGroup(List<User> list);

	List<UserCustomVo> getUserCustom();
	
	public List<User> listByOrg(List<Integer> orgIds) ;
	
}
