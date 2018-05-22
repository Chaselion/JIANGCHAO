package com.zy.dmop.resource.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.api.web.dao.UserDao;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.UserCustomVo;
import com.zy.dmop.resource.cache.CacheConstant;
import com.zy.dmop.resource.cache.CacheUtil;

@Component("userDao")
public class UserDaoImpl extends NamedParameterJdbcDaoSupport implements
		UserDao {

	@Override
	public User findUserByUsername(String username) {
		String sql = "select * from user where username=?";
		List<User> userList = getJdbcTemplate().query(sql,
				new BeanPropertyRowMapper<User>(User.class), username);
		if (userList.size() == 0) {
			return null;
		}
		return userList.get(0);
	}

	@Override
	public long getUserCountOfOrganization(long organizationId) {
		return 0;
	}

	@Override
	public PageResult<User> queryUsers(String username, String realname,
			List<Integer> orgIds, int userState, Date startCreateDate,
			Date endCreateDate, Page page) {
				return null;
		
	}

	@Override
	public User createUser(final User user) {
		final Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		user.setModifyDateTime(timestamp);
		user.setRegisterDateTime(timestamp);
		final String sql = "insert into user(organization_id, permission_group_id, username, password, salt, realname, mobile_phone, email, state,alarm_level_id,register_date_time,modify_date_time ,note,custom_id) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int count = getJdbcTemplate().update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				int i = 0;

				PreparedStatement ps = con.prepareStatement(sql,
						Statement.RETURN_GENERATED_KEYS);
				ps.setInt(++i, user.getOrganizationId());
				ps.setObject(++i, user.getPermissionGroupId());

				ps.setString(++i, user.getUsername());
				ps.setString(++i, user.getPassword());
				ps.setString(++i, user.getSalt());
				ps.setString(++i, user.getRealname());
				ps.setString(++i, user.getMobilePhone());
				ps.setString(++i, user.getEmail());
				ps.setInt(++i, user.getState());
				ps.setInt(++i, user.getAlarmLevelId());
				ps.setTimestamp(++i, timestamp);
				ps.setTimestamp(++i, timestamp);
				ps.setString(++i, user.getNote());
				ps.setInt(++i, user.getCustomId());

				return ps;
			}
		}, keyHolder);

		if (count == 0) {
			return null;
		} else {
			int id = keyHolder.getKey().intValue();
			user.setUserId(keyHolder.getKey().intValue());
			CacheUtil.updateModel(CacheConstant.MODEL_USER, id, user);
			return user;
		}
	}

	@Override
	public User getUserById(int id) {
		String sql = "select * from user where user_id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		List<User> users = getNamedParameterJdbcTemplate().query(
				sql.toString(), params,
				new BeanPropertyRowMapper<User>(User.class));

		if (users.size() == 0) {
			return null;
		}

		return users.get(0);
	}

	@Override
	public void deleteUser(int id) {
		final String sql = "delete from user where user_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		getNamedParameterJdbcTemplate().update(sql, params);
		CacheUtil.updateModel(CacheConstant.MODEL_USER, id, null);

	}

	@Override
	public void updateUser(User user) {
		String sql = "update user set realname=:realname, mobile_phone=:mobile_phone, email=:email, organization_id=:organization_id,permission_group_id = :permission_group_id, state=:status,alarm_level_id=:alarm_level_id,note=:note,modify_date_time=:modifytime where user_id=:id";
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("realname", user.getRealname());
		params.put("mobile_phone", user.getMobilePhone());
		params.put("email", user.getEmail());
		params.put("organization_id", user.getOrganizationId());
		params.put("status", user.getState());
		params.put("id", user.getUserId());
		params.put("alarm_level_id", user.getAlarmLevelId());
		params.put("note", user.getNote());
		params.put("modifytime", timestamp);
		params.put("permission_group_id", user.getPermissionGroupId());
		getNamedParameterJdbcTemplate().update(sql, params);
		Object obj = CacheUtil.getModel(CacheConstant.MODEL_USER, user.getUserId());
		User usermodel = (User) obj;
		usermodel.setRealname(user.getRealname());
		usermodel.setMobilePhone(user.getMobilePhone());
		usermodel.setEmail(user.getEmail());
		usermodel.setOrganizationId(user.getOrganizationId());
		usermodel.setState(user.getState());
		usermodel.setRealname(user.getRealname());
		usermodel.setAlarmLevelId(user.getAlarmLevelId());
		usermodel.setNote(user.getNote());
		usermodel.setModifyDateTime(timestamp);
		usermodel.setPermissionGroupId(user.getPermissionGroupId());
	    CacheUtil.updateModel(CacheConstant.MODEL_USER, usermodel.getUserId(), usermodel);
	}

	@Override
	public void updatePassword(String encryptNewPwd, long id) {
		// TODO Auto-generated method stub
		String sql = "update user set password=:password where user_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("password", encryptNewPwd);
		params.put("id", id);

		getNamedParameterJdbcTemplate().update(sql, params);
		Object obj = CacheUtil.getModel(CacheConstant.MODEL_USER, (int) id);
		User usermodel = (User) obj;
		usermodel.setPassword(encryptNewPwd);
		CacheUtil.updateModel(CacheConstant.MODEL_USER, usermodel.getUserId(), usermodel);
	}

	@Override
	public void updateUserInfo(long userId, String realname,
			String mobilePhone, String email) {
		// TODO Auto-generated method stub

	}

	@Override
	public PageResult<User> getAllUserByRole(long tenatId, long roleId,
			Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUsers(List<Integer> aorgIds, String realname) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append("from user ");
		sqlCondition.append(" where realname like :realnameRegex ");
		sqlCondition.append(" and organization_id in(:orgIds) ");
		params.put("orgIds", aorgIds);

		sqlCondition.append(" order by register_date_time desc ");
		params.put("realnameRegex", "%" + realname + "%");
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append(sqlCondition.toString());
		return getNamedParameterJdbcTemplate().query(sql.toString(), params,
				new BeanPropertyRowMapper<User>(User.class));
	}

	@Override
	public PageResult<User> queryUsers(List<Integer> orgIds, String realname,
			Page page) {
		
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_USER);
		if (cache != null && cache.size() > 0 && realname == "" ) {

			List<User> list = new ArrayList<>();
			for (Object o : cache) {
				User user = (User) o;
				if (orgIds.contains(user.getOrganizationId())) {
					list.add(user);
				}
			}
			page.setCount(list.size());
			int end=list.size()-page.getStart();
			int end1=page.getStart()+page.getLimit();
			list = list.subList(
					page.getStart(),
					page.getLimit() > end ? list.size() : end1);
			PageResult<User> pr = new PageResult<User>(page, list);
			return pr;
		} else {
		Map<String, Object> params = new HashMap<String, Object>();
		// User loginUser = SessionUtil.getCommonUserFromSession();
		// Integer customId=loginUser.getCustomId();
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append("from user ");
		sqlCondition.append(" where realname like :realnameRegex ");

		sqlCondition.append(" and organization_id in(:orgIds) ");
		params.put("orgIds", orgIds);

		params.put("realnameRegex", "%" + realname + "%");

		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append(sqlCondition.toString());
		sql.append(" order by register_date_time desc limit " + page.getStart()
				+ ", " + page.getLimit());

		StringBuilder sqlCount = new StringBuilder();
		sqlCount.append("select count(*) ");
		sqlCount.append(sqlCondition.toString());

		List<User> list = getNamedParameterJdbcTemplate().query(sql.toString(),
				params, new BeanPropertyRowMapper<User>(User.class));
		int count = getNamedParameterJdbcTemplate().queryForObject(
				sqlCount.toString(), params, Integer.class);

		page.setCount(count);
		PageResult<User> pr = new PageResult<User>(page, list);
		return pr;
	}
		}

	public List<User> queryUsersByOrgId() {
		Integer orgId = 1;
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from user where OrganizationId=?");
		List<User> list = getJdbcTemplate().queryForList(sql.toString(),
				new Object[] { orgId }, User.class);
		return list;

	}

	@Override
	public void updateUserStatus(int id, int userState) {
		String sql = "update user set state=:state where user_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("state", userState);
		params.put("id", id);

		getNamedParameterJdbcTemplate().update(sql, params);
		Object obj = CacheUtil.getModel(CacheConstant.MODEL_USER,id);
		User usermodel = (User) obj;
		usermodel.setState(userState);
		CacheUtil.updateModel(CacheConstant.MODEL_USER, usermodel.getUserId(), usermodel);
	}

	@Override
	public void initPassword(int id, String psd) {
		String sql = "update user set password=:psd where user_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("psd", psd);
		params.put("id", id);
		getNamedParameterJdbcTemplate().update(sql, params);
		Object obj = CacheUtil.getModel(CacheConstant.MODEL_USER,  id);
		User usermodel = (User) obj;
		usermodel.setPassword(psd);
		CacheUtil.updateModel(CacheConstant.MODEL_USER, usermodel.getUserId(), usermodel);
	}

	@Override
	public int batchUnbindPermissionGroup(final List<User> list) {
		final String sql = new StringBuffer().append("update user ")
				.append("	set permission_group_id = 2 ")
				.append("where user_id = ? ").toString();
		int[] update = getJdbcTemplate().batchUpdate(sql,
				new BatchPreparedStatementSetter() {

					@Override
					public void setValues(PreparedStatement ps, int i)
							throws SQLException {
						User user = list.get(i);
						ps.setInt(1, user.getUserId());
					}

					@Override
					public int getBatchSize() {

						return list.size();
					}
				});
		return update.length;
	}

	@Override
	public List<User> getUsersbyCustom(Integer custom) {
		String sql = "select * from user where custom_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", custom);

		List<User> users = getNamedParameterJdbcTemplate().query(sql, params,
				new BeanPropertyRowMapper<User>(User.class));
		if (users == null || users.size() != 1) {
			return null;
		} else {
			return users;
		}
	}

	@Override
	public List<UserCustomVo> getUserCustom() {
		StringBuilder sqlCondition = new StringBuilder();
		sqlCondition.append(" from user u ");
		sqlCondition.append("LEFT JOIN custom c on c.custom_id=u.custom_id ");

		StringBuilder sql = new StringBuilder();
		sql.append("select 	u.user_id, u.custom_id, "
				+ "u.state userstate, c.state customstate ");
		sql.append(sqlCondition.toString());

		List<UserCustomVo> list = getNamedParameterJdbcTemplate().query(
				sql.toString(),
				new BeanPropertyRowMapper<UserCustomVo>(UserCustomVo.class));

		return list;
	}

	@Override
	public List<User> listByOrg(List<Integer> orgIds) {
		StringBuilder sql = new StringBuilder();
		sql.append("select username from user where organization_id in(:orgIds)");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orgIds", orgIds);
		List<User> list = getNamedParameterJdbcTemplate().query(sql.toString(),
				params, new BeanPropertyRowMapper<User>(User.class));
		return list;
	}

	@Override
	public void deleteUserByOrg(int organizationId) {
		// TODO Auto-generated method stub
		final String sql = "delete from user where organization_id=:id";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", organizationId);

		getNamedParameterJdbcTemplate().update(sql, params);
		List<Object> cache = CacheUtil.getModelList(CacheConstant.MODEL_USER);
		List<User> list = new ArrayList<>();
		for (Object o : cache) {
				User user = (User) o;
				if (organizationId==(user.getOrganizationId())) {
					CacheUtil.updateModel(CacheConstant.MODEL_USER, user.getUserId(), null);
				}
			}
	}

	@Override
	public List<User> getAllUserForCache() {
		Map<String, Object> params = new HashMap<String, Object>();
		String sql = "select * from user order by register_date_time desc";
		List<User> user = getNamedParameterJdbcTemplate().query(sql, params,
				new BeanPropertyRowMapper<User>(User.class));
		return user;
	}

}
