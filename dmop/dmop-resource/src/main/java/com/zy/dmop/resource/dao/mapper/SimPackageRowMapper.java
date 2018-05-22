package com.zy.dmop.resource.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zy.dmop.model.SimPackage;

public class SimPackageRowMapper  implements RowMapper<SimPackage>{

	@Override
	public SimPackage mapRow(ResultSet rs, int rowNum) throws SQLException {
		SimPackage simPackage = new SimPackage();
		long id = rs.getLong("sim_package_id");
		String packageName = rs.getString("package_name");
		long operatorsType = rs.getLong("sim_card_operator_id");
		float flow = rs.getFloat("flow");
		float price = rs.getFloat("price");
		String description = rs.getString("description");
		String operatorsName = rs.getString("operator_name");
		long tenantId = rs.getLong("custom_id");
//		Date createDateTime=rs.getDate("create_date_time");
//		Date modifyDateTime=rs.getDate("modify_date_time");
//		int packageGroupType = rs.getInt("package_group_type");
		simPackage.setSimPackageId(id);
		simPackage.setPackageName(packageName);
		simPackage.setSimCardOperatorId(operatorsType);
		simPackage.setFlow(flow);
		simPackage.setPrice(price);
		simPackage.setDescription(description);
		simPackage.setOperatorName(operatorsName);
		simPackage.setCustomId((int) tenantId);
//		simPackage.setPackageGroupType(packageGroupType);
//		simPackage.setCreateDateTime(createDateTime);
//		simPackage.setModifyDateTime(modifyDateTime);
		return simPackage;
	}

}
