package com.privacy.service;

import java.util.List;

import com.privacy.dao.BoardDAO;
import com.privacy.dao.BoardDAOQuery;
import com.privacy.exception.BizNotFoundException;
import com.privacy.vo.BoardVO;
import com.privacy.vo.SearchVO;

public class BoardServiceImpl implements BoardService {

	BoardDAO boDao = new BoardDAOQuery();

	@Override
	public List<BoardVO> getBoardList(SearchVO searchVO) {
		searchVO.setTotalRows(boDao.getTotalRowCount(searchVO));
		searchVO.setPages();
		if (searchVO.getPage() < searchVO.getPageSize()) {
			searchVO.setPageSize(4);
		} else if (searchVO.getPage() > searchVO.getTotalPages() - searchVO.getPageSize() + 1) {
			searchVO.setPageSize(4);
			searchVO.setFirstPage(searchVO.getTotalPages() - searchVO.getPageSize());
			searchVO.setLastPage(searchVO.getTotalPages());
		} else {
			searchVO.setPageSize(1);
			searchVO.setPages();
		}
		return boDao.getBoardList(searchVO);
	}

	@Override
	public BoardVO getBoard(int boNo) throws BizNotFoundException {
		BoardVO bo = boDao.getBoard(boNo);
		if (bo == null) {
			throw new BizNotFoundException();
		}
		return bo;
	}

	@Override
	public void insertBoard(BoardVO bo) {
		boDao.insertBoard(bo);
	}

	@Override
	public void updateBoard(BoardVO bo) throws BizNotFoundException {
		BoardVO originBo = boDao.getBoard(bo.getBoNo());
		if (originBo == null) {
			throw new BizNotFoundException();
		}
		boDao.updateBoard(bo);
	}

	@Override
	public void deleteBoard(BoardVO bo) throws BizNotFoundException {
		BoardVO originBo = boDao.getBoard(bo.getBoNo());
		if (originBo == null) {
			throw new BizNotFoundException();
		}
		boDao.deleteBoard(bo);
	}

}
