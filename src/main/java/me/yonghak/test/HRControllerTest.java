package me.yonghak.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import me.yonghak.service.HRService;
import me.yonghak.vo.SearchForm;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class HRControllerTest {
	@Autowired
	private ApplicationContext applicationContext;
	 
	@Autowired
	private HRService hrService;
	@Test
    public void test(){
		SearchForm searchForm = new SearchForm();
		// expected integer is row count(*) from employees table
		assertEquals(108, hrService.getRowCount(searchForm));
	}
}
