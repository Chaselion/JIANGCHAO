package com.zy.dmop.web.information.more;


import java.io.Serializable;
import java.util.List;




public interface ILorryCarDao {
	public String getTerminalIdById(Serializable id);
	

	
	public int add2sim(Long card_id,Long carId);
	public String findZipCodeByLocation(Long location);
	
	public int update2sim(Long card_id , Long carId);
	public int deleteFromSim(Long id);
	
	public List<Long> selectByTenant_id(Long tenantId);
	public Long getIdByLicense(String lineCarLicense);
}
