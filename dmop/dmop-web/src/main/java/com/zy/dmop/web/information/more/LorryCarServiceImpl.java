package com.zy.dmop.web.information.more;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;




@Component("lorryCarService")
@Transactional(propagation=Propagation.REQUIRED)
public class LorryCarServiceImpl implements ILorryCarService{
	@Autowired
	private ILorryCarDao carDao;

	public String findTerminalIdById(Serializable id) {
        String tId=carDao.getTerminalIdById(id);
		return tId;
	}

	
}
