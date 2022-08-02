package com.privacy.dao;

import java.util.List;
import com.privacy.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> getMemberList();

	public MemberVO getMember(String memId);

	public int updateMember(MemberVO member);

	public int deleteMember(MemberVO member);

	public int insertMember(MemberVO member);
}
