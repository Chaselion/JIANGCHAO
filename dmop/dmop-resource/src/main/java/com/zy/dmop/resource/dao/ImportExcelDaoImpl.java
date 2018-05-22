package com.zy.dmop.resource.dao;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.api.web.dao.ImportExcelDao;
import com.zy.dmop.model.Custom;
import com.zy.dmop.model.Organization;
import com.zy.dmop.model.Terminal;
import com.zy.dmop.model.User;


@Component("excelDao")
public class ImportExcelDaoImpl extends NamedParameterJdbcDaoSupport implements ImportExcelDao{
	private static Logger log = Logger.getLogger(ImportExcelDaoImpl.class);
//插入表格的信息
	@Override
	public int excelToDb(Terminal terminal) {
		User loginUser = SessionUtil.getCommonUserFromSession();
		Date date=new Date();
		terminal.setCreateDateTime(date);
		terminal.setModifyDateTime(date);
		String sql = new StringBuffer()
				.append(" insert into ")
				.append(" terminal(organization_id,terminal_num,terminal_name,fireware_version,create_date_time,modify_date_time,longitude ,latitude) ")
				.append(" values(?,?,?,?,?,?,?,?) ")
				.toString();
		
		int excelInfo = 0;
		try {
			excelInfo=getJdbcTemplate().update(sql,
					loginUser.getOrganizationId(),terminal.getTerminalNum(),terminal.getTerminalName(),terminal.getFirewareVersion(),terminal.getCreateDateTime(),terminal.getModifyDateTime(),1.1,1.1);
		} catch (Exception e) {
			log.error("存储数据库发生错误！"+e);
		}
		return excelInfo;
	}
	@Override
	public int excelUserToDb(User user) {
		User loginUser = SessionUtil.getCommonUserFromSession();
		String sql = new StringBuffer()
				.append(" insert into ")
				.append(" user(organization_id, permission_group_id, username,realname, mobile_phone, email, state,alarm_level_id,register_date_time,modify_date_time ,custom_id) ")
				.append(" values(?,?,?,?,?,?,?,?,?,?,?) ")
				.toString();
		
		int excelInfo = 0;
		try {
			
			Timestamp time=new Timestamp(System.currentTimeMillis());
			excelInfo=getJdbcTemplate().update(sql,
					loginUser.getOrganizationId(),loginUser.getPermissionGroupId(),user.getUsername(),user.getRealname(),user.getMobilePhone(),user.getEmail(),1,1,time,time,loginUser.getCustomId());
		} catch (Exception e) {
			log.error("存储数据库发生错误！");
		}
		return excelInfo;
	}
	@Override
	public int excelCustomToDb(Custom custom) {
       User loginUser = SessionUtil.getCommonUserFromSession();
		
		String sql = new StringBuffer()
				.append(" insert into ")
				.append(" custom(name, link_man_name, link_man_phone, type, create_date_time, expire_date_time,location,state,modify_date_time) ")
				.append(" values(?,?,?,?,?,?,?,?,?) ")
				.toString();
		
		int excelInfo = 0;
		try {
			
			Timestamp time=new Timestamp(System.currentTimeMillis());
			excelInfo=getJdbcTemplate().update(sql,
					custom.getName(),custom.getLinkManName(),custom.getLinkManPhone(),1,time,time,custom.getLocation(),1,time);
		} catch (Exception e) {
			log.error("存储数据库发生错误！");
		}
		return excelInfo;
	}
	@Override
	public int excelOrgToDb(Organization organization) {
		 User loginUser = SessionUtil.getCommonUserFromSession();
			
			String sql = new StringBuffer()
					.append(" insert into ")
					.append(" organization(custom_id, type, parent_id, name, description, create_date_time,alarm_strategy_id,modify_date_time) ")
					.append(" values(?,?,?,?,?,?,?,?) ")
					.toString();
			
			int excelInfo = 0;
			try {
				
				Timestamp time=new Timestamp(System.currentTimeMillis());
				excelInfo=getJdbcTemplate().update(sql,
						loginUser.getCustomId(),1,1,organization.getName(),organization.getDescription(),time,1,time);
			} catch (Exception e) {
				log.error("存储数据库发生错误！");
			}
			return excelInfo;
	}
}
