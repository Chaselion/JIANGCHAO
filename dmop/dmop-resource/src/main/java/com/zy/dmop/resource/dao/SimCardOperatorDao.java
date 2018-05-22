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

import com.zy.dmop.model.SimCardOperator;
import com.zy.dmop.resource.dao.mapper.SimCardOperatorRowMapper;
import com.zy.dmop.util.DatatablePage;
@Component("simCardOperatorDao")
public class SimCardOperatorDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insertSimCardOperator(final SimCardOperator simCardOperator) {
		final String insertSql=
				"insert into sim_card_operator (operator_name, description, custom_id,create_date_time,modify_date_time) "
				+ "values (?, ?, ?, ?, ?)";
		int count=jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i = 0;
				PreparedStatement ps = conn.prepareStatement(insertSql);
				ps.setString(++i, simCardOperator.getOperatorName());
				ps.setString(++i, simCardOperator.getDescription());
				ps.setInt(++i, simCardOperator.getCustomId());
				ps.setDate(++i, (Date) simCardOperator.getCreateDateTime());
				ps.setDate(++i, (Date) simCardOperator.getModifyDateTime());
				return ps;
			}
		});
	} 
	
	public void updateSimCardOperator(final SimCardOperator simCardOperator){
		final String updateSql="update sim_card_operator set operator_name = ?, description = ?, custom_id = ?, modify_date_time=? where sim_card_operator_id = ?";
		int count=jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i = 0;
				PreparedStatement ps = conn.prepareStatement(updateSql);
				ps.setString(++i, simCardOperator.getOperatorName());
				ps.setString(++i, simCardOperator.getDescription());
				ps.setInt(++i, simCardOperator.getCustomId());
				ps.setDate(++i, (Date) simCardOperator.getModifyDateTime());
				return ps;
			}
		});
	}
	public SimCardOperator getSimCardOperatorById(final long id,final int tenantId){
		final String sql = "select * from sim_card_operator where sim_card_operator_id = ? and custom_id=?";
		List<SimCardOperator> simCardOperators = 
				jdbcTemplate.query(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement ps = con.prepareStatement(sql);
						ps.setLong(1, id);
						ps.setInt(2, tenantId);
						return ps;
					}
				}, new SimCardOperatorRowMapper());
		
		if(simCardOperators != null && simCardOperators.size() == 1){
			return simCardOperators.get(0);
		}else{
			return null;
		}
	}
	public DatatablePage<SimCardOperator> getSimCardOperatorPage(final String operatorName, final Integer tenantId, final Integer start, final Integer countPerPage){
		final StringBuffer sqlBuffer = new StringBuffer();
		final StringBuffer countBuffer = new StringBuffer();
		sqlBuffer.append("select * from sim_card_operator");
		countBuffer.append("select count(*) from sim_card_operator");
		int queryObject = 0;
		if(operatorName != null){
			sqlBuffer.append(" where");
			countBuffer.append(" where");
			sqlBuffer.append(" operator_name like ?");
			countBuffer.append(" operator_name like ?");
			queryObject++;
		}
		if(tenantId != null){
			if(queryObject>0)
			{
				sqlBuffer.append(" and");
				countBuffer.append(" and");	
			}
			sqlBuffer.append(" custom_id = ?");
			countBuffer.append(" custom_id = ?");
			queryObject++;
		}

		final String countSql=countBuffer.toString();
		sqlBuffer.append(" limit ?, ?");
		StringBuffer totalSqlBuffer = new StringBuffer();
		totalSqlBuffer.append("select count(*) from sim_card_operator ");
		int totalObject=0;
		if(tenantId != null){
			totalSqlBuffer.append(" where custom_id = ?");
			totalObject++;
		}

		
		List<SimCardOperator> simCardOperators=
				jdbcTemplate.query(new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection con)
							throws SQLException {
						int i = 0;
						PreparedStatement ps= con.prepareStatement(sqlBuffer.toString());
						if(operatorName != null){
							ps.setString(++i, "%" + operatorName + "%");
						}
						if(tenantId != null){
							ps.setLong(++i, tenantId);
						}
						ps.setInt(++i, start);
						ps.setInt(++i, countPerPage);
						return ps;
					}
				}, new SimCardOperatorRowMapper());
		
		Object[] args=new Object[totalObject];
		if(tenantId != null){
			args[0]=tenantId;
		}
		Integer totoalCount = jdbcTemplate.queryForObject(totalSqlBuffer.toString(),args,Integer.class);
		Object[] obj = new Object[queryObject];
		int i = 0;
		if(operatorName != null){
			obj[i++] = "%" + operatorName + "%";
		}
		if(tenantId != null){
			obj[i++] = tenantId;
		}
		Integer filteredCount = jdbcTemplate.queryForObject(countSql, obj, Integer.class);
		DatatablePage<SimCardOperator> page=new DatatablePage<>();
		page.setRecordsFiltered(filteredCount);
		page.setRecordsTotal(totoalCount);
		page.setStart(start);
		page.setLength(countPerPage);
		page.setData(simCardOperators);
		return page;
	}
	
	/**
	 * 根据客户id查询operator表中的信息
	 * @param tenantId
	 * @return
	 */
	public List<SimCardOperator> getSimCardOperatorList(final Integer tenantId){
		final StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append("select * from sim_card_operator ");
		if(tenantId != null){
			sqlBuffer.append(" where custom_id = ?");
		}
		
		List<SimCardOperator> simCardOperators=
				jdbcTemplate.query(new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection con)
							throws SQLException {
						int i = 0;
						PreparedStatement ps = con.prepareStatement(sqlBuffer.toString());
						if(tenantId != null){
							ps.setLong(++i, tenantId);
						}
						return ps;
					}
				}, new SimCardOperatorRowMapper());
		return simCardOperators;
	}
	
	public void delSimCardOperatorsById(final List<Long> SimCardOperatorIds,final Integer tenantId){
		final StringBuffer sb=new StringBuffer();
		sb.append("delete from sim_card_operator where coutom_id = ? and sim_cardoperator_id in (");
		for(int i=0;i<SimCardOperatorIds.size();i++){
			if(i<SimCardOperatorIds.size()-1){
				sb.append("?, ");
			}else{
				sb.append("?");
			}
		}
		sb.append(")");
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps = con.prepareStatement(sb.toString());
					ps.setLong(1,tenantId);
					for(int i = 1 ; i < (SimCardOperatorIds.size() + 1) ; i++){
						ps.setLong(i+1, SimCardOperatorIds.get(i-1));
					}
				return ps;
			}
		});
	}
	
	public void delSimCardOperatorById(final Long SimCardOperatorId,final Integer tenantId){
		final StringBuffer sb = new StringBuffer();
		sb.append("delete from sim_card_operator where sim_card_operator_id = ? and custom_id = ?");
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps = con.prepareStatement(sb.toString());
				
					ps.setLong(1, SimCardOperatorId);
					ps.setLong(2, tenantId);
				return ps;
			}
		});
	}
	
	public Integer getSimCardOperatorRelativeById(final Long id,final Integer tenantId){
		final String sql = "select count(*) from sim_package where operators_type = ? and custom_id=?";
		Object[] obj=new Object[]{id,tenantId};
		Integer filteredCount=jdbcTemplate.queryForObject(sql, obj, Integer.class);
		return filteredCount;
	}

}
