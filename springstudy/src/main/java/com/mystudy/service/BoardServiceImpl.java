package com.mystudy.service;


import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mystudy.domain.BoardVO;
import com.mystudy.domain.Criteria;
import com.mystudy.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO boardVO) {

		log.info("register........." + boardVO);
		
		mapper.insertSelectKey(boardVO);
	}

	@Override
	public BoardVO get(Long bno) {
		
		log.info("get.........." + bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO boardVO) {
		log.info("modify............." + boardVO);

		return mapper.update(boardVO) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove............." + bno);

		return mapper.delete(bno) == 1;
	}

	/*
	 * @Override public List<BoardVO> getList() {
	 * 
	 * log.info("getList...............");
	 * 
	 * return mapper.getList(); }
	 */

	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("get List with criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	
	
}
