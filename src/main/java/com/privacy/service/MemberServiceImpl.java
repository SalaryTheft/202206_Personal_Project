package com.privacy.service;

import java.util.List;

import com.privacy.dao.MemberDAO;
import com.privacy.dao.MemberDAOQuery;
import com.privacy.exception.BizDuplicateKeyException;
import com.privacy.exception.BizNotEffectedException;
import com.privacy.exception.BizNotFoundException;
import com.privacy.exception.BizPasswordNotMatchedException;
import com.privacy.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	MemberDAO memDao = new MemberDAOQuery();

	@Override
	public List<MemberVO> getMemberList() {
		return memDao.getMemberList();
	}

	@Override
	public MemberVO getMember(String memId) {
		return memDao.getMember(memId);
	}
	
	@Override
	public void updatePwMember(MemberVO mem) throws BizNotFoundException, BizPasswordNotMatchedException {
		MemberVO originMem = memDao.getMember(mem.getMemId());
		if (originMem == null) {
			throw new BizNotFoundException();
		} else {
			if (originMem.getMemPw().equals(mem.getMemPwOld())) {
				memDao.updateMember(mem);
			} else {
				throw new BizPasswordNotMatchedException();
			}
		}
	}

	@Override
	public void resetPwMember(MemberVO mem) throws BizPasswordNotMatchedException, BizNotFoundException{
		MemberVO originMem = memDao.getMember(mem.getMemId());
		if (originMem == null) {
			throw new BizNotFoundException();
		} else {
			if (originMem.getMemSq().equals(mem.getMemSq()) && originMem.getMemSa().equals(mem.getMemSa()) ) {
				memDao.updateMember(mem);
			} else {
				throw new BizPasswordNotMatchedException();
			}
		}

	}

	@Override
	public void deleteMember(MemberVO mem) throws BizNotFoundException, BizPasswordNotMatchedException {
		MemberVO originMem = memDao.getMember(mem.getMemId());
		if (originMem == null) {
			throw new BizNotFoundException();
		} else {
			if (originMem.getMemPw().equals(mem.getMemPw()) ) {
				memDao.deleteMember(mem);
			} else {
				throw new BizPasswordNotMatchedException();
			}
		}
	}

	@Override
	public void insertMember(MemberVO mem) throws BizNotEffectedException, BizDuplicateKeyException {
		MemberVO originMem = memDao.getMember(mem.getMemId());
		if (originMem == null) {
			int updatedRowCnt = memDao.insertMember(mem);
			if (updatedRowCnt == 0) {
				throw new BizNotEffectedException();
			}
		} else {
			throw new BizDuplicateKeyException();
		}
	}

	@Override
	public void authMember(MemberVO mem) throws BizNotFoundException, BizPasswordNotMatchedException {
		MemberVO originMem = memDao.getMember(mem.getMemId());
		if (originMem != null) {
			if (originMem.getMemPw().equals(mem.getMemPw())) {
				return;
			} else {
				throw new BizPasswordNotMatchedException();
			}
		} else {
			throw new BizNotFoundException();
		}
	}

}
