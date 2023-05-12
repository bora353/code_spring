package com.mystudy.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mystudy.domain.Criteria;
import com.mystudy.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	private Long[] bnoArr = {3L ,4L, 5L, 6L, 7L};

	
	@Test
	public void testCreat() {
		
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			//게시물 번호
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글테스트 " + i);
			vo.setReplyer("replyer " + i);
			
			mapper.insert(vo);
		});
	}
	
	
	@Test
	public void testRead() {
		Long targetRno = 13L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 13L;
		
		mapper.delete(targetRno);
	}
	
	
	@Test
	public void testUpdate() {
		
		Long targetRno = 15L;
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update Reply ");
		
		int count = mapper.update(vo);
		
		log.info("Update Count : " + count);
		
	}
	
	@Test
	public void testList() {
		
		Criteria criteria = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(criteria, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
	
}
