package com.privacy.service;

import java.util.List;

import com.privacy.exception.BizNotFoundException;
import com.privacy.vo.BoardVO;
import com.privacy.vo.SearchVO;

public interface BoardService {
	public List<BoardVO> getBoardList(SearchVO searchVO);
	
	public BoardVO getBoard(int boNo) throws BizNotFoundException;
	
	public void insertBoard(BoardVO bo);
	
	public void updateBoard(BoardVO bo) throws BizNotFoundException;
	
	public void deleteBoard(BoardVO bo) throws BizNotFoundException;
	
	
}
