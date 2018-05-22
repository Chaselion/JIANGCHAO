package com.zy.dmop.dao;



import static org.junit.Assert.assertArrayEquals;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.dexcoder.dal.JdbcDao;
import com.zy.dmop.model.Permission;
import com.zy.dmop.model.PermissionGroup;
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
		PermissionGroup group = new PermissionGroup();
		group.setPermissionGroupId(99);;
		List<PermissionGroup> list = jdbcDao.queryList(group);
	}
}
