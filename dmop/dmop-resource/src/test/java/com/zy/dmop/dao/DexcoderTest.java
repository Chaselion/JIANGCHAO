package com.zy.dmop.dao;

import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.dexcoder.dal.JdbcDao;
import com.zy.dmop.model.User;

public class DexcoderTest {
	private ApplicationContext ctx = null;
	private JdbcDao jdbcDao = null;
	@Before
    public void setup(){
        ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        jdbcDao = (JdbcDao)ctx.getBean("jdbcDao");
    }

    @After
    public void tearDown(){
        ctx = null;
    }
	
	
	@Test
	@Transactional
	public void testInitTable(){

//com.zy.dmop.model.User.User(Integer userId, Integer alarmLevelId, Integer organizationId, Integer permissionGroupId, Integer state, String email, String mobilePhone, String note, String password, String realname, String salt, String username, Date modifyDateTime, Date registerDateTime)
		//User user = new User(null, 1, 1, 1, 1, "销售部", "12312312343", "qqq", "aaa", "张三", "aasdasd", "asdasd", new Date(), new Date());
		//Long long1 = jdbcDao.insert(user);
	}
}
