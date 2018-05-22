package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.SimCard;


public class SimCardRowMapper implements RowMapper<SimCard>{

	@Override
	public SimCard mapRow(ResultSet rs, int rowNum) throws SQLException {
		Set<String> columnNames = getColumns(rs);
		SimCard card = new SimCard();
		long simCardId = rs.getLong("sim_card_id");
		float balance = rs.getFloat("balance");
		long simPackageId = rs.getLong("sim_package_id");
		int arrearsState = rs.getInt("arrears_state");
		//String packageName = rs.getString("package_name");
		int customId = rs.getInt("custom_id");
		Date createDateTime=rs.getDate("create_date_time");
		Date modifyDateTime=rs.getDate("modify_date_time");
		
//		int usedStatus = 0;
//		 if (columnNames.contains("sim_car_id")) {
//			String carId = rs.getString("sim_car_id");
//			if(carId != null && !carId.equals("")){
//				usedStatus = 1;
//			}
//		 }
//		int packageGroupType=rs.getInt("package_group_type");
		card.setSimCardId(simCardId);
		card.setBalance( balance);
		card.setSimPackageId(simPackageId);
		card.setArrearsState(arrearsState);
//		card.setPackageName(packageName);
		card.setCustomId(customId);
		card.setCreateDateTime(createDateTime);
		card.setModifyDateTime(modifyDateTime);
//		card.setUsedStatus(usedStatus);
//		card.setPackageGroupType(packageGroupType);
		return card;
	}
	
	private Set<String> getColumns(ResultSet rs) throws SQLException {
    	ResultSetMetaData rsm = rs.getMetaData();
    	int colNum = rsm.getColumnCount();
    	
    	Set<String> columnNames = new HashSet<String>();
    	for (int i = 0; i < colNum; i++) {
    		columnNames.add(rsm.getColumnName(i + 1));
		}
    	
		return columnNames;
	}

}
