package com.zy.dmop.resource.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.zy.dmop.api.web.dao.DevicepropertyDao;
@Component("devicepropertyDao")
public class DevicepropertyDaoImpl extends NamedParameterJdbcDaoSupport implements DevicepropertyDao{

	@Override
	public String getEnglishName(String name) {
		String sql = "select english_name from device_properity where name=:name";
		
		Map<String, Object> params = new HashMap<String, Object>();
    	params.put("name", name);
    	
	    	String englishname=new String();
			try {
				englishname = getNamedParameterJdbcTemplate().queryForObject(sql, params, String.class);
			 return englishname;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
		String locationa="";
		
			return locationa;
	}

}
