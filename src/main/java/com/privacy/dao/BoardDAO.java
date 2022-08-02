package com.privacy.dao;

import java.util.List;

import com.privacy.vo.BoardVO;
import com.privacy.vo.SearchVO;

public interface BoardDAO {
	public List<BoardVO> getBoardList(SearchVO searchVO);
	
	public int getTotalRowCount(SearchVO searchVO);
	
	public BoardVO getBoard(int boNo);
	
	public int updateBoard(BoardVO bo);
	
	public int deleteBoard(BoardVO bo);
	
	public int insertBoard(BoardVO bo);

}
