package com.mystudy.spring;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
// Test for Controller
@WebAppConfiguration
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		 "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before // 테스트 전 매번 실행하는 메서드
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test  //get 방식
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders
				.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()		//	model 객체 전달할때 사용!	
				);
	}
	
	@Test  //post 방식
	public void testRegister() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.post("/board/register")
				.param("title", "새글 제목이요")
				.param("content", "새글 내용이요")
				.param("writer", "새글 작성자요")				
				).andReturn()
				.getModelAndView()
				.getViewName());
		
	}
	
	@Test
	public void testGet() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders
						.get("/board/get")
						.param("bno", "3"))
						.andReturn()
						.getModelAndView()
						.getModelMap()	//	model 객체 전달할때 사용!	
				);
		
	}
	
	@Test
	public void testModify() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
						.post("/board/modify")
						.param("bno", "1")
						.param("title", "수정된 테스트 새글 제목")
						.param("content", "수정된 테스트 새글 내용")
						.param("writer", "수정된 테스트 작성자"))
						.andReturn()
						.getModelAndView()
						.getViewName());
		
	}
	
	@Test
	public void testRemove() throws Exception{
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
						.post("/board/remove")
						.param("bno", "20"))
						.andReturn()
						.getModelAndView()
						.getViewName());
	}
	
	
	
	
	
}
