package com.zy.dmop.web.information.more;

import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;


@Component("lorryCarDao")
public class LorryCarDaoImpl extends NamedParameterJdbcDaoSupport implements ILorryCarDao{
	@Override
	public String getTerminalIdById(Serializable id) {
     final String sql = "select terminal_num from terminal where terminal_id = ?";
     
		String terminalId = null;
		try {
			terminalId = getJdbcTemplate().queryForObject(sql, String.class, id);
		} catch (DataAccessException e) {
			
		}
		return null==terminalId?null:terminalId;
	}
	


	public int add2sim(Long card_id, Long id) {
		String sql = new StringBuffer()
				.append("insert into ")
				.append("	sim_card_car_relative(card_id,car_id) ")
				.append("	values(?,?) ")
				.toString();
		int affected = getJdbcTemplate().update(sql, card_id,id);
		return affected;
	}



	public String findZipCodeByLocation(Long id) {
		String sql = new StringBuffer()
				.append("select ")
				.append("	zip_code ")
				.append("from ")
				.append("	region ")
				.append("where id = ? ")
				.toString();
				String zip_code = getJdbcTemplate().queryForObject(sql, new Object[]{(Long)id}, String.class);
		return zip_code;
	}

	public int update2sim(Long card_id, Long id) {
		String sql = new StringBuffer()
				.append("update ")
				.append("	sim_card_car_relative ")
				.append("set ")
				.append("	card_id = ? ")
				.append("where ")
				.append("	car_id = ? ")
				.toString();
		int affected = getJdbcTemplate().update(sql, (Long)card_id,(Long)id);
		return affected;
	}


	@Override
	public int deleteFromSim(Long id) {
		String sql = new StringBuffer()
				.append("delete from ")
				.append("	sim_card_car_relative ")
				.append("where ")
				.append("	car_id = ? ")
				.toString();
		int affected = getJdbcTemplate().update(sql, new Object[]{id});
		return affected;
	}


	@Override
	public List<Long> selectByTenant_id(Long tenantId) {
		String sql = new StringBuffer()
				.append("select ")
				.append("	id ")
				.append("from ")
				.append("	ups ")
				.append("where ")
				.append("	tenant_id = ?")
				.toString();
		
		return getJdbcTemplate().queryForList(sql, new Object[]{tenantId}, Long.class);
		
	}


	@Override
	public Long getIdByLicense(String lineCarLicense) {
		String sql = new StringBuffer()
				.append("select ")
				.append("	id ")
				.append("from ")
				.append("	ups ")
				.append("where carLicense = ? ")
				.toString();
		Long id = getJdbcTemplate().queryForObject(sql, new Object[]{lineCarLicense}, Long.class);
		return id;
	}





}
