package com.mystudy.service;

import java.util.List;

import com.mystudy.domain.BoardVO;
import com.mystudy.domain.Criteria;

public interface BoardService {

	public void register(BoardVO boardVO);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO boardVO);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
