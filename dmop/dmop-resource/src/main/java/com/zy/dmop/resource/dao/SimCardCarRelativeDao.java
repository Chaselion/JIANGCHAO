package com.zy.dmop.resource.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Component;

import com.zy.dmop.model.SimCardTerminalRelative;
import com.zy.dmop.resource.dao.mapper.SimCardCarRelativeRowMapper;

@Component("simCardCarRelativeDao")
public class SimCardCarRelativeDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void insertSimCardCarRelative(final Long carId,final Long cardId) {
		final String insertSql="insert into sim_card_terminal_relative (card_id,terminal_id) values (?,?)";
		int count=jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i=0;
				PreparedStatement ps=conn.prepareStatement(insertSql);
				ps.setLong(++i, cardId);
				ps.setLong(++i, carId);
				return ps;
			}
		});
	} 
	
	public void updateSimCardCarRelative(final Long carId,final Long cardId){
		final String updateSql="update sim_card_terminal_relative set card_id=? where terminal_id=?";
		int count=jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i=0;
				PreparedStatement ps=conn.prepareStatement(updateSql);
				ps.setLong(++i, cardId);
				ps.setLong(++i, carId);
				return ps;
			}
		});
	}
	
	public void updateSimCardCarRelativeWhenCardIdChange(final Long oldCardId,final String terminalNum){
		final String updateSql="update sim_card_terminal_relative set card_id=?, terminal_num=? where card_id=?";
		int count=jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i=0;
				PreparedStatement ps=conn.prepareStatement(updateSql);
				ps.setLong(++i, oldCardId);
				ps.setString(++i, terminalNum);
				ps.setLong(++i, oldCardId);
				return ps;
			}
		});
	}
	
	public SimCardTerminalRelative getSimCardCarRelativeByCardId(final long id){
		final String sql = "select * from sim_card_terminal_relative where card_id = ?";
		List<SimCardTerminalRelative> simCardCarRelatives = 
				jdbcTemplate.query(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement ps = con.prepareStatement(sql);
						ps.setLong(1, id);
						return ps;
					}
				}, new SimCardCarRelativeRowMapper());
		
		if(simCardCarRelatives != null && simCardCarRelatives.size() == 1){
			return simCardCarRelatives.get(0);
		}else{
			return null;
		}
	}
	
	public SimCardTerminalRelative getSimCardCarRelativeByCarId(final long carId){
		final String sql = "select * from sim_card_terminal_relative where terminal_id = ?";
		List<SimCardTerminalRelative> simCardCarRelatives = 
				jdbcTemplate.query(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement ps = con.prepareStatement(sql);
						ps.setLong(1, carId);
						return ps;
					}
				}, new SimCardCarRelativeRowMapper());
		
		if(simCardCarRelatives != null && simCardCarRelatives.size() == 1){
			return simCardCarRelatives.get(0);
		}else{
			return null;
		}
	}
	
	public Integer getSimCardCarRelativeByIds(final  List<Long> ids){
		final StringBuffer sb=new StringBuffer();
		sb.append("select count(*) from sim_card_terminal_relative where card_id in (");
		for(int i=0;i<ids.size();i++){
			if(i<ids.size()-1){
				sb.append("?,");
			}else{
				sb.append("?");
			}
		}
		sb.append(")");
		Object[] obj=new Object[ids.size()];
		for(int i=0;i<obj.length;i++){
			obj[i]=ids.get(i);
		}
		Integer filteredCount=jdbcTemplate.queryForObject(sb.toString(), obj, Integer.class);
		return filteredCount;
	}
	
	public void delSimCardsCarRelativeByCarId(final Long carId){
		final StringBuffer sb=new StringBuffer();
		sb.append("delete from sim_card_terminal_relative where terminal_id =?");
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps=con.prepareStatement(sb.toString());
				
					ps.setLong(1, carId);
		
				return ps;
			}
		});
	}
	
	public void delSimCardCarRelativeBySimCardId(final Long SimCardId){
		final StringBuffer sb=new StringBuffer();
		sb.append("delete from sim_card_terminal_relative where card_id =?");
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps=con.prepareStatement(sb.toString());
				
					ps.setLong(1, SimCardId);
		
				return ps;
			}
		});
	}
	
	public void delSimCardCarRelativeBySimCardIds(final List<Long> SimCardIds){
		final StringBuffer sb=new StringBuffer();
		sb.append("delete from sim_card_terminal_relative where card_id in (");
		for(int i=0;i<SimCardIds.size();i++){
			if(i<SimCardIds.size()-1){
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
				for(int i=0;i<SimCardIds.size();i++){
					ps.setLong(i+1, SimCardIds.get(i));
				}
				return ps;
			}
		});
	}
	
	public String getRelativeCarNameByCarId(final Long SimCardId){
		final String sql = "select name from sim_card_terminal_relative sr left join terminal c on sr.terminal_id=c.id where card_id = ?";
		Object[] obj=new Object[]{SimCardId};
		List<String> simCardCarRelatives=jdbcTemplate.queryForList(sql, obj, String.class);
		if(simCardCarRelatives != null && simCardCarRelatives.size() == 1){
			return simCardCarRelatives.get(0);
		}else{
			return null;
		}
	}
}
