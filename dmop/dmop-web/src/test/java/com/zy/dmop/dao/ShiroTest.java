package com.zy.dmop.dao;



import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.dexcoder.dal.JdbcDao;
import com.zy.dmop.model.Permission;
import com.zy.dmop.model.User;

public class ShiroTest {
	private ApplicationContext ctx = null;
	//private CommonUserAuthorization userAuthorization = null;
	@Before
    public void setup(){
        ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        //jdbcDao = (JdbcDao)ctx.getBean("jdbcDao");
    }

    @After
    public void tearDown(){
        ctx = null;
    }
	
	
	@Test
	@Transactional
	public void testInitTable(){
	/*	List<Permission> list = jdbcDao.queryList(Permission.class);
		List<Set<String>> arrayList = new ArrayList<>();
		for(Permission p : list){
			arrayList.add(p.generatePermissionArray());
		}
		Stream<String> stream = arrayList.stream().flatMap(Set::stream);
		HashSet<String> set = stream.collect(Collectors.toCollection(HashSet::new));	*/
	}

		
}
