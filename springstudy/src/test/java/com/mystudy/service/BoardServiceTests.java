package com.mystudy.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mystudy.domain.BoardVO;
import com.mystudy.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	
	@Test 
	public void testRegister() {
		
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("새글12345");
		boardVO.setContent("새내용12345");
		boardVO.setWriter("새작성자12345");
		
		service.register(boardVO);
		
		log.info("생성된 게시글의 번호 : " + boardVO.getBno());
	}
	
	@Test
	public void testGetList() {
		
		//service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(2,10))
				.forEach(board -> log.info(board));
		
	}
	
	@Test
	public void testGet() {
		
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		
		log.info("remove result : " + service.remove(17L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO boardVO = service.get(1L);
		
		if(boardVO == null) {
			return;
		}
	
		boardVO.setTitle("제목 수정해요!!!!!");
		log.info("modify result : " + service.modify(boardVO));
	}


}
