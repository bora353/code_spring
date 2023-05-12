package com.mystudy.mapper;

import java.util.List;

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
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("새글");
		boardVO.setContent("새내용");
		boardVO.setWriter("새작성자");
		
		mapper.insert(boardVO);
		
		log.info(boardVO);
	}
	
	@Test
	public void testInsertSelectKey() {
		
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("새글 SelectKey");
		boardVO.setContent("새내용 SelectKey");
		boardVO.setWriter("새작성자");
		
		mapper.insert(boardVO);
		
		log.info(boardVO);
	}
	
	@Test
	public void testRead() {
		// 존재하는 게시물 번호로 테스트
		BoardVO boardVO = mapper.read(5L);
		
		log.info(boardVO);
	}
	
	@Test
	public void testDelete() {
		
		log.info("delete count : " + mapper.delete(10L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO boardVO = new BoardVO();
		
		boardVO.setBno(5L);
		boardVO.setTitle("수정된 제목");
		boardVO.setContent("수정된 내용");
		boardVO.setWriter("나는야싼쵸");
		
		int count = mapper.update(boardVO);
		log.info("update Count : "+ count);
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	
}
