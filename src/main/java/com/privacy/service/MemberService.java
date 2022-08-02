package com.privacy.service;

import java.util.List;

import com.privacy.exception.BizDuplicateKeyException;
import com.privacy.exception.BizNotEffectedException;
import com.privacy.exception.BizNotFoundException;
import com.privacy.exception.BizPasswordNotMatchedException;
import com.privacy.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> getMemberList();

	public MemberVO getMember(String memId) throws BizNotFoundException;

	public void resetPwMember(MemberVO mem) throws BizPasswordNotMatchedException, BizNotFoundException;
	
	public void updatePwMember(MemberVO mem) throws BizPasswordNotMatchedException, BizNotFoundException;

	public void deleteMember(MemberVO mem) throws BizPasswordNotMatchedException, BizNotFoundException;

	public void insertMember(MemberVO mem) throws BizNotEffectedException, BizDuplicateKeyException;
	
	public void authMember(MemberVO mem) throws BizNotFoundException, BizPasswordNotMatchedException;

}
