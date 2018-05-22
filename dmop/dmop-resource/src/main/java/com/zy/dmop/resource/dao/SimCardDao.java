package com.zy.dmop.resource.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.common.helper.Page;
import com.zy.dmop.api.common.helper.PageResult;
import com.zy.dmop.model.AlarmLog;
import com.zy.dmop.model.SimCard;
import com.zy.dmop.model.vo.HistoryDataVO;
import com.zy.dmop.model.vo.SimTerminalVo;
import com.zy.dmop.resource.dao.mapper.SimCardRowMapper;
import com.zy.dmop.util.DatatablePage;
@Component("simCardDao")
public class SimCardDao extends NamedParameterJdbcDaoSupport{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insertSimCard(final SimCard simCard) {
		final String insertSql = "insert into sim_card "
				+ " (sim_card_id, sim_package_id, custom_id, create_date_time, modify_date_time) "
				+ " values (:simCardId,:simPackageId,:customId,:createDateTime,:modifyDateTime)";
		int affected=getNamedParameterJdbcTemplate().update(insertSql, new BeanPropertySqlParameterSource(simCard));
		/*int count = jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i = 0;
				PreparedStatement ps = conn.prepareStatement(insertSql);
				ps.setLong(++i, simCard.getSimCardId());
				ps.setLong(++i, simCard.getSimPackageId());
				//ps.setDouble(++i, simCard.getBalance());
				//ps.setInt(++i, simCard.getArrearsState());
				ps.setInt(++i, simCard.getCustomId());
				
				ps.setString(++i, simCard.getCreateDateTime().toString());
				//ps.setDate(++i, (Date) simCard.getModifyDateTime());
				
				return ps;
			}
		});*/
	} 
	
	
	public void updateSimCard(final SimCard simCard, final Long oldCardId){
		final String updateSql = "update sim_card set sim_card_id=?, sim_package_id=?, custom_id=?, arrears_state=?, balance=?, modify_date_time=? where sim_card_id=? ";
		int count = jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i = 0;
				PreparedStatement ps = conn.prepareStatement(updateSql);
				ps.setLong(++i, simCard.getSimCardId());
				ps.setLong(++i, simCard.getSimPackageId());
				ps.setLong(++i, simCard.getCustomId());
				ps.setInt(++i, simCard.getArrearsState());
				ps.setDouble(++i, simCard.getBalance());
				
				ps.setDate(++i, (Date) simCard.getModifyDateTime());
				
				ps.setLong(++i, oldCardId);
				//ps.setLong(++i, simCard.getCustomId());
				return ps;
			}
		});
	}
	public void changeArrearState(final Long cardId, final Integer arrearState, final Integer tenantId){
		final String updateSql = "update sim_card set arrears_state = ? where sim_card_id = ? and custom_id = ?";
		int count = jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i = 0;
				PreparedStatement ps = conn.prepareStatement(updateSql);
				ps.setInt(++i, arrearState);
				ps.setLong(++i, cardId);
				ps.setLong(++i, tenantId);
				return ps;
			}
		});
	}
	public List<SimCard> getSimCardIdsListByPackage(final Long packageType, final Integer tenantId){
		final String sql = "select * from sim_card sc left join sim_package sp on sc.sim_package_id = sp.sim_package_id where sc.sim_package_id = ? and sc.custom_id = ?";
		List<SimCard> cards = 
				jdbcTemplate.query(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement ps = con.prepareStatement(sql);
						ps.setLong(1, packageType);
						ps.setLong(2, tenantId);
						return ps;
					}
				}, new SimCardRowMapper());
		return cards;
	}
	
	public void rechargeSimCard(final Long cardId, final Float balance, final Integer arrearsState, final Long tenantId){
		final String updateSql = "update sim_card set balance = ?, arrears_state = ? where sim_card_id = ? and custom _id = ?";
		int count = jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i =  0;
				PreparedStatement ps = conn.prepareStatement(updateSql);
				ps.setFloat(++i, balance);
				ps.setInt(++i, arrearsState);
				ps.setLong(++i, cardId);
				ps.setLong(++i, tenantId);
				return ps;
			}
		});
	}

	public SimTerminalVo getSimCardById(final long id, final Integer customId){
		final String sql = "select sc.sim_package_id,sc.sim_card_id,st.terminal_num,sp.package_name from sim_card sc, sim_package sp ,sim_card_terminal_relative st where sc.sim_card_id = ? and sc.sim_package_id=sp.sim_package_id and st.card_id=sc.sim_card_id";
		List<SimTerminalVo> cards = 
				jdbcTemplate.query(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement ps = con.prepareStatement(sql);
						ps.setLong(1, id);
						return ps;
					}
				},  new BeanPropertyRowMapper<SimTerminalVo>(SimTerminalVo.class));
		if(cards != null && cards.size() == 1){
			return cards.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 分页查询sim信息，cardId到tenantId都为null，start=0，countPerPage=10
	 * @param cardId
	 * @param usedStatus
	 * @param packageType
	 * @param arrearsState
	 * @param tenantId
	 * @param start
	 * @param countPerPage
	 * @return
	 */
	public DatatablePage<SimCard> getSimCardPage(final Long cardId, final Integer usedStatus, final Long packageType, final Integer arrearsState, final Integer tenantId, final Integer start, final Integer countPerPage){
		final StringBuffer sqlBuffer = new StringBuffer();
		final StringBuffer countBuffer = new StringBuffer();
		sqlBuffer.append("select sc.sim_card_id, sc.sim_package_id, sc.balance, sc.arrears_state, sc.custom_id, r.terminal_id from sim_card sc left join sim_package sp on sc.sim_package_id = sp.sim_package_id left join sim_card_terminal_relative r on sc.sim_card_id = r.card_id");
		countBuffer.append("select count(sc.sim_card_id) from sim_card sc left join sim_card_terminal_relative r on sc.sim_card_id = r.card_id");
		int queryObject = 0;
		if(packageType != null || arrearsState != null || tenantId != null){
			sqlBuffer.append(" where");
			countBuffer.append(" where");
		}
		if(packageType != null){
			sqlBuffer.append(" sc.sim_package_id = ?");
			countBuffer.append(" sc.sim_package_id = ?");
			queryObject++;
		}
		if(arrearsState != null){
			if(queryObject > 0)
			{
				sqlBuffer.append(" and");
				countBuffer.append(" and");	
			}
			sqlBuffer.append(" sc.arrears_state = ?");
			countBuffer.append(" sc.arrears_state = ?");
			queryObject++;
		}
		if(tenantId != null){
			if(queryObject > 0)
			{
				sqlBuffer.append(" and");
				countBuffer.append(" and");	
			}
			sqlBuffer.append(" sc.custom_id = ?");
			countBuffer.append(" sc.custom_id = ?");
			queryObject++;
		}
		if(cardId != null){
			if(queryObject > 0)
			{ 
				sqlBuffer.append(" and");
				countBuffer.append(" and");	
			}
			sqlBuffer.append(" sc.sim_card_id like ?");
			countBuffer.append(" sc.sim_card_id like ?");
			queryObject++;
		}
		if(usedStatus != null){
			if(queryObject>0)
			{
				sqlBuffer.append(" and");
				countBuffer.append(" and");	
			}
			if(usedStatus == 0){
				sqlBuffer.append(" r.sim_car_id is null");
				countBuffer.append(" r.sim_car_id is null");
			}else{
				sqlBuffer.append(" r.sim_car_id is not null");
				countBuffer.append(" r.sim_car_id is not null");
			}
		}
		final String countSql = countBuffer.toString();
		sqlBuffer.append(" order by sc.sim_card_id desc limit ?,?");
		StringBuffer totalSqlBuffer = new StringBuffer();
		totalSqlBuffer.append("select count(*) from sim_card ");
		int totalObject=0;
		if(tenantId != null){
			totalSqlBuffer.append(" where custom_id = ?");
			totalObject++;
		}

		//分页查询sim卡信息
		StringBuilder sqlCondition = new StringBuilder();
    	sqlCondition.append("from sim_card order by sim_card_id desc ");
    	StringBuilder sql = new StringBuilder();
    	sql.append("select * ");
    	sql.append(sqlCondition.toString());
    	sql.append("limit " + start + ", " + countPerPage);
    	StringBuilder sqlCount = new StringBuilder();
    	sqlCount.append("select count(*) ");
    	sqlCount.append(sqlCondition.toString());
    	List<SimCard> simCards=jdbcTemplate.query(sql.toString(), new SimCardRowMapper());
		Object[] args=new Object[totalObject];
		if(tenantId != null){
			args[0]=tenantId;
		}
		Integer totoalCount = jdbcTemplate.queryForObject(totalSqlBuffer.toString(), args,Integer.class);
		Object[] obj = new Object[queryObject];
		int i = 0;
		if(packageType != null){
			obj[i++] = packageType;
		}
		if(arrearsState != null){
			obj[i++] = arrearsState;
		}
		if(tenantId != null){
			obj[i++] = tenantId;
		}
		if(cardId != null){
			obj[i++] = "%" + cardId + "%";
		}
		Integer filteredCount = jdbcTemplate.queryForObject(countSql, obj, Integer.class);
		DatatablePage<SimCard> page = new DatatablePage<>();
		page.setRecordsFiltered(filteredCount);
		page.setRecordsTotal(totoalCount);
		page.setStart(start);
		page.setLength(countPerPage);
		page.setData(simCards);
		return page;
	}
	
	
	
	public List<SimCard> getSimCardList(final Long tenantId){
		final StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append("select * from sim_card where custom_id = ? ");
		
		List<SimCard> simCards=
				jdbcTemplate.query(new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection con)
							throws SQLException {
						int i = 0;
						PreparedStatement ps=con.prepareStatement(sqlBuffer.toString());
						ps.setLong(++i, tenantId);
						return ps;
					}
				}, new SimCardRowMapper());
		return simCards;
	}
	
	public void delSimCardsById(final List<Long> SimCardIds,final Integer tenantId){
		final StringBuffer sb = new StringBuffer();
		sb.append("delete from sim_card where custom_id = ? and sim_card_id in (");
		for(int i = 0 ; i < SimCardIds.size() ; i++){
			if(i < SimCardIds.size() - 1){
				sb.append("?, ");
			}else{
				sb.append("?");
			}
		}
		sb.append(") ");
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps = con.prepareStatement(sb.toString());
				ps.setLong(1, tenantId);
				for(int i = 1 ; i < (SimCardIds.size() + 1 ) ; i++){
					ps.setLong(i+1, SimCardIds.get(i-1));
				}
				return ps;
			}
		});
	}
	
	public void delSimCardById(final Long SimCardId){
		final StringBuffer sb = new StringBuffer();
		sb.append("delete from sim_card where sim_card_id =? ");
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps = con.prepareStatement(sb.toString());
				
					ps.setLong(1, SimCardId);
					//ps.setLong(2, tenantId);
				return ps;
			}
		});
	}
	
	//方法并补适用，执行sql会报错！！
	public void updateAllSimCardOperator( Long pakcageId, Integer arrearsState, Float balance, Long tenantId){
		final String sql = "update sim_card set arrears_state=:arrearsState, balance=:balance where sim_package_id=:simPakcageId and custom_id=:customId";
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("arrearsState", arrearsState);
		paramMap.put("balance", balance);
		paramMap.put("simPakcageId", pakcageId);
		paramMap.put("customId", tenantId);
		NamedParameterJdbcTemplate temp = new NamedParameterJdbcTemplate(jdbcTemplate);
		temp.update(sql, paramMap);
	}


	public SimCard getSimById(final Long id) {
		final String sql = "select * from sim_card  where sim_card_id = ? ";
		List<SimCard> cards = 
				jdbcTemplate.query(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement ps = con.prepareStatement(sql);
						ps.setLong(1, id);
						return ps;
					}
				}, new SimCardRowMapper());
		if(cards != null && cards.size() == 1){
			return cards.get(0);
		}else{
			return null;
		}
		
	}


	public void addSimTer(final Long id, final String terminalNum) {
		final String addSql = "insert into sim_card_terminal_relative (card_id, terminal_num ) values (?, ?)";
			jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps = con.prepareStatement(addSql);
				
					ps.setLong(1, id);
					ps.setString(2, terminalNum);
				return ps;
			}
		});
	}


	public PageResult<SimTerminalVo> getSimCardPage(Long simCardId, Page page) {
		 Map<String, Object> params = new HashMap<String, Object>();
			StringBuilder sqlCondition = new StringBuilder();
	    	sqlCondition.append("from sim_card a ");
	    	StringBuilder sql = new StringBuilder();
	    	sql.append("select a.sim_card_id,a.create_date_time,a.modify_date_time,a.custom_id,b.package_name,c.terminal_num ");
	    	sql.append(sqlCondition.toString());
	    	StringBuilder sqlJoinA = new StringBuilder();
	    	sqlJoinA.append("LEFT JOIN sim_package b ON (a.sim_package_id = b.sim_package_id) ");
	    	StringBuilder sqlJoinB = new StringBuilder();
	    	sqlJoinB.append("LEFT JOIN sim_card_terminal_relative c ON (a.sim_card_id = c.card_id) ");
	    	sql.append(sqlJoinA.toString());
	    	sql.append(sqlJoinB.toString());
	    	if(null!=simCardId) {
	    		sql.append(" where a.sim_card_id like :simCardId ");
				params.put("simCardId", "%"+ simCardId+"%");
	    	}
	    	sql.append(" order by  a.create_date_time desc ");
	    	sql.append("limit " + page.getStart() + ", " + page.getLimit());
	    	StringBuilder sqlCount = new StringBuilder();
	    	sqlCount.append("select count(*) ");
	    	sqlCount.append(sqlCondition.toString());
	    	sqlCount.append(sqlJoinA.toString());
	    	sqlCount.append(sqlJoinB.toString());
	    	if(null!=simCardId) {
	    		sqlCount.append(" where sim_card_id like :simCardId ");
				params.put("simCardId", "%"+ simCardId+"%");
	    	}
	    	List<SimTerminalVo> list=getNamedParameterJdbcTemplate().query(sql.toString(), params,new BeanPropertyRowMapper<SimTerminalVo>(SimTerminalVo.class));
	    	int count = getNamedParameterJdbcTemplate().queryForObject(sqlCount.toString(), params, Integer.class);
	    	page.setCount(count);
			PageResult<SimTerminalVo> pr = new PageResult<SimTerminalVo>(page, list);
			return pr;
	}


	public void updateSimInfo(final Long id, final int simPackageId) {
		final String sql = "update sim_card set modify_date_time=?, sim_card_id=?, sim_package_id=? where sim_card_id=? ";
		int count = jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				int i =  0;
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setTimestamp(++i, new Timestamp(System.currentTimeMillis()));
				ps.setLong(++i, id);
			//	ps.setFloat(++i, balance);
				ps.setInt(++i, simPackageId);
				ps.setLong(++i, id);
				return ps;
			}
		});
		
	}
}
