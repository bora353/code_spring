package com.mystudy.mapper;

import java.util.List;


import com.mystudy.domain.BoardVO;
import com.mystudy.domain.Criteria;

public interface BoardMapper {

	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public void insert(BoardVO boardVO);
	
	public void insertSelectKey(BoardVO boardVO);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO boardVO);
	
	
	
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
}
