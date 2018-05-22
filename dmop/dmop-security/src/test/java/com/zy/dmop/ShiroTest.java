package com.zy.dmop;



import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.shiro.authz.AuthorizationInfo;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.dexcoder.dal.JdbcDao;
import com.zy.dmop.api.security.service.UserPermissionService;
import com.zy.dmop.model.Permission;
import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.PermissionVo;
import com.zy.dmop.security.controller.component.PermissionTreeComponent;
import com.zy.dmop.security.controller.component.PermissionTreeComponentInterface;
import com.zy.dmop.security.controller.component.ui.TreeDataComponent;
import com.zy.dmop.security.shiro.CommonUserAuthorization;

public class ShiroTest {
	private ApplicationContext ctx = null;
	private PermissionTreeComponentInterface permissionTreeComponent = null;
	@Before
    public void setup(){
        ctx = new ClassPathXmlApplicationContext("applicationContext-security-main.xml");
        permissionTreeComponent = (PermissionTreeComponentInterface)ctx.getBean("permissionTreeComponent");
    }

    @After
    public void tearDown(){
        ctx = null;
    }
	
	
	@Test
	@Transactional
	public void testInitTable(){
		
		List<TreeDataComponent> list = permissionTreeComponent.getTreeGridData();
	}
}
