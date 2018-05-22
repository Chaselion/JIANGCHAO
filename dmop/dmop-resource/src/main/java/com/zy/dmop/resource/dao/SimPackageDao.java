package com.zy.dmop.resource.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.SimPackage;
import com.zy.dmop.resource.dao.mapper.SimPackageRowMapper;
import com.zy.dmop.util.DatatablePage;

@Component("simPackageDao")
public class SimPackageDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insertSimPackage(final SimPackage simPackage) {
		final String insertSql="insert into sim_package (package_name, sim_card_operator_id, price, flow, description, custom_id, create_date_time, modify_date_time) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
		int count=jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i = 0;
				PreparedStatement ps = conn.prepareStatement(insertSql);
				ps.setString(++i, simPackage.getPackageName());
				ps.setLong(++i, simPackage.getSimCardOperatorId());
				ps.setDouble(++i, simPackage.getPrice());
				ps.setDouble(++i, simPackage.getFlow());
				ps.setString(++i, simPackage.getDescription());
				ps.setLong(++i, simPackage.getCustomId());
				ps.setDate(++i, (Date) simPackage.getCreateDateTime());
				ps.setDate(++i, (Date) simPackage.getModifyDateTime());
				return ps;
			}
		});
	} 
	
	public void updateSimPackage(final SimPackage simPackage){
		final String updateSql="update sim_package set package_name=?, sim_card_operator_id=?, price=?, flow=?, description=?, custom_id=?, modify_date_time=? where sim_package_id=?";
		int count=jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i = 0;
				PreparedStatement ps = conn.prepareStatement(updateSql);
				ps.setString(++i, simPackage.getPackageName());
				ps.setLong(++i, simPackage.getSimCardOperatorId());
				ps.setDouble(++i, simPackage.getPrice());  
				ps.setDouble(++i, simPackage.getFlow());
				ps.setString(++i, simPackage.getDescription());
				ps.setInt(++i, simPackage.getCustomId());
				ps.setDate(++i, (Date) simPackage.getModifyDateTime());
				ps.setLong(++i, simPackage.getSimPackageId());				
				return ps;
			}
		});
	}
	
	
	public SimPackage getSimPackageById(final Long id, final Integer tenantId){
		final String sql = "select * from sim_package sp left join sim_card_operator so on sp.sim_card_operator_id = so.sim_card_operator_id where sim_package_id = ? and sp.custom_id = ?";
		List<SimPackage> packages = 
				jdbcTemplate.query(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement ps = con.prepareStatement(sql);
						ps.setLong(1, id);
						ps.setLong(2, tenantId);
						return ps;
					}
				}, new SimPackageRowMapper());
		
		if(packages != null && packages.size() == 1){
			return packages.get(0);
		}else{
			return null;
		}
	}
	
	
	
	
	public DatatablePage<SimPackage> getSimPackagePage(
			final String packageName,
			final Long operatorsType,   
			final Integer packageGroupType, 
			final Integer tenantId, 
			final Integer start, 
			final Integer countPerPage){
		
		final StringBuffer sqlBuffer=new StringBuffer();
		final StringBuffer countBuffer=new StringBuffer();
//		sqlBuffer.append("select sp.sim_package_id,sp.package_name,sp.sim_card_operator_id,sp.price,sp.flow,sp.custom_id,sp.description,so.operator_name from sim_package sp left join sim_card_operator so on sp.sim_card_operator_id = so.sim_card_operator_id");
		sqlBuffer.append("select sp.sim_package_id,sp.package_name,sp.sim_card_operator_id,sp.price,sp.flow,sp.custom_id,sp.description,so.operator_name from sim_package sp left join sim_card_operator so on sp.sim_card_operator_id = so.sim_card_operator_id");
		countBuffer.append("select count(sp.sim_package_id) from sim_package sp ");
		int queryObject=0;
		if(packageName != null || operatorsType != null){
			sqlBuffer.append(" where");
			countBuffer.append(" where");
		}
		if(packageName != null){
			sqlBuffer.append(" sp.package_name like ?");
			countBuffer.append(" sp.package_name like ?");
			queryObject++;
		}
		if(operatorsType != null){
			if(queryObject>0)
			{
				sqlBuffer.append(" and");
				countBuffer.append(" and");	
			}
			sqlBuffer.append(" sp.sim_card_operator_id= ?");
			countBuffer.append(" sp.sim_card_operator_id = ?");
			queryObject++;
		}		
		if(packageGroupType != null){
			if(queryObject>0)
			{
				sqlBuffer.append(" and");
				countBuffer.append(" and");	
			}
			sqlBuffer.append(" sp.package_group_type = ?");
			countBuffer.append(" sp.package_group_type = ?");
			queryObject++;
		}
		if(tenantId != null){
			if(queryObject>0)
			{
				sqlBuffer.append(" and");
				countBuffer.append(" and");	
			}
			sqlBuffer.append(" sp.custom_id = ?");
			countBuffer.append(" sp.custom_id = ?");
			queryObject++;
		}
		final String countSql=countBuffer.toString();
		sqlBuffer.append(" limit ?, ?");
		
		StringBuffer totalSqlBuffer = new StringBuffer();
		totalSqlBuffer.append("select count(*) from sim_package ");
		int totalObject=0;
		if(tenantId != null){
			totalSqlBuffer.append(" where custom_id = ?");
			totalObject++;
		}
		
		List<SimPackage> simPackages =
				jdbcTemplate.query(new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection con)
							throws SQLException {
						int i=0;
						PreparedStatement ps=con.prepareStatement(sqlBuffer.toString());
						if(packageName != null){
							ps.setString(++i, "%" + packageName + "%");
						}
						if(operatorsType != null){
							ps.setLong(++i, operatorsType);
						}
						if(packageGroupType != null){
							ps.setInt(++i, packageGroupType);
						}
						if(tenantId != null){
							ps.setLong(++i, tenantId);
						}
						ps.setInt(++i, start);
						ps.setInt(++i, countPerPage);
						// TODO Auto-generated method stub
						return ps;
					}
				}, new SimPackageRowMapper());
		Object[] args=new Object[totalObject];
		if(tenantId != null){
			args[0]=tenantId;
		}
		Integer totoalCount=jdbcTemplate.queryForObject(totalSqlBuffer.toString(),args, Integer.class);
		Object[] obj = new Object[queryObject];
		int i = 0;
		if(packageName != null){
			obj[i++]= "%" + packageName + "%";
		}
		if(packageGroupType != null){
			obj[i++] = packageGroupType;
		}
		if(operatorsType != null){
			obj[i++] = operatorsType;
		}
		if(tenantId != null){
			obj[i++] = tenantId;
		}
		Integer filteredCount=jdbcTemplate.queryForObject(countSql, obj, Integer.class);
		DatatablePage<SimPackage> page=new DatatablePage<>();
		page.setRecordsFiltered(filteredCount);
		page.setRecordsTotal(totoalCount);
		page.setStart(start);
		page.setLength(countPerPage);
		page.setData(simPackages);
		return page;
	}
	
	
	
	
	public void delSimPackagesById(final List<Long> SimPackageIds,final Long tenantId){
		final StringBuffer sb=new StringBuffer();
		sb.append("delete from sim_package where custom_id=? and package_id in (");
		for(int i=0;i<SimPackageIds.size();i++){
			if(i<SimPackageIds.size()-1){
				sb.append("?,");
			}else{
				sb.append("?");
			}
		}
		sb.append(")");
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps=con.prepareStatement(sb.toString());
				ps.setLong(1, tenantId);
				for(int i=1;i<(SimPackageIds.size()+1);i++){
					ps.setLong(i+1, SimPackageIds.get(i-1));
				}
				return ps;
			}
		});
	}
	
	public void delSimPackageById(final Long SimPackageId,final Integer tenantId){
		final StringBuffer sb=new StringBuffer();
		sb.append("delete from sim_package where sim_package_id =? and custom_id=?");
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps=con.prepareStatement(sb.toString());
				
					ps.setLong(1, SimPackageId);
					ps.setLong(2, tenantId);
				return ps;
			}
		});
	}
	
	public Integer getSimPackageRelativeById(final long id,final Integer tenantId){
		final String sql = "select count(*) from sim_card where sim_package_id = ? and custom_id = ?";
		Object[] obj = new Object[]{id, tenantId};
		Integer filteredCount = jdbcTemplate.queryForObject(sql, obj, Integer.class);
		return filteredCount;
	}
	
	public List<SimPackage> getsimCardGroupPackageList(final Integer tenantId){
		final String sql = "select sp.package_id,sp.package_name,sp.package_group_type,sp.operators_type,sp.price,sp.flow,sp.custom_id,sp.description,so.operator_name from sim_packages sp left join sim_card_operators so on sp.operators_type = so.operator_id where sp.custom_id = ? and package_group_type = 1";
		List<SimPackage> simPackages =
				jdbcTemplate.query(new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection con)
							throws SQLException {
						int i=0;
						PreparedStatement ps=con.prepareStatement(sql);
						if(tenantId != null){
							ps.setLong(++i, tenantId);
						}
						// TODO Auto-generated method stub
						return ps;
					}
				}, new SimPackageRowMapper());
		return simPackages;
	}
}
