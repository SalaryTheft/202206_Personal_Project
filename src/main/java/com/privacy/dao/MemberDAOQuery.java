package com.privacy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.privacy.vo.MemberVO;

public class MemberDAOQuery implements MemberDAO{
	
	@Override
	public int insertMember(MemberVO mem) {
		int updatedRowCnt = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
			StringBuffer query = new StringBuffer();
			query.append("INSERT INTO				");
			query.append("	P2_MEMBER(				");
			query.append("		MEM_ID,				");
			query.append("		MEM_PW,				");
			query.append("		MEM_SQ,				");
			query.append("		MEM_SA,				");
			query.append("		MEM_REGDATE			");
			query.append("	)						");
			query.append("VALUES(					");
			query.append("	?, ?, ?, ?, SYSDATE		");
			query.append(")							");
			ps = conn.prepareStatement(query.toString());
			
			int psIdx = 1;
			ps.setString(psIdx++, mem.getMemId());
			ps.setString(psIdx++, mem.getMemPw());
			ps.setString(psIdx++, mem.getMemSq());
			ps.setString(psIdx++, mem.getMemSa());
			
			updatedRowCnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (ps != null) { try { ps.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
		return updatedRowCnt;
	}
	
	@Override
	public MemberVO getMember(String memId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
			StringBuffer query = new StringBuffer();
			query.append("SELECT					");
			query.append("	MEM_ID,					");
			query.append("	MEM_PW,					");
			query.append("	MEM_SQ,					");
			query.append("	MEM_SA,					");
			query.append("	TO_CHAR(MEM_REGDATE, 'YYYY-MM-dd') AS MEM_REGDATE	");
			query.append("FROM						");
			query.append("	P2_MEMBER				");
			query.append("WHERE 1=1					");
			query.append(" AND MEM_ID = ?			");
			ps = conn.prepareStatement(query.toString());
			
			int psIdx = 1;
			ps.setString(psIdx++, memId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MemberVO mem = new MemberVO();
				mem.setMemId(rs.getString("MEM_ID"));
				mem.setMemPw(rs.getString("MEM_PW"));
				mem.setMemSq(rs.getString("MEM_SQ"));
				mem.setMemSa(rs.getString("MEM_SA"));
				mem.setMemRegDate(rs.getString("MEM_REGDATE"));
				return mem;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) { try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (ps != null) { try { ps.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
		return null;
	}

	@Override
	public List<MemberVO> getMemberList() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
			StringBuffer query = new StringBuffer();
			query.append("SELECT					");
			query.append("	MEM_ID,					");
			query.append("	MEM_PW,					");
			query.append("	MEM_SQ,					");
			query.append("	MEM_SA,					");
			query.append("	TO_CHAR(MEM_REGDATE, 'YYYY-MM-dd') AS MEM_REGDATE	");
			query.append("FROM						");
			query.append("	P2_MEMBER				");
			ps = conn.prepareStatement(query.toString());
			rs = ps.executeQuery();
			
			List<MemberVO> memList = new ArrayList<MemberVO>();
			while (rs.next()) {
				MemberVO mem = new MemberVO();
				mem.setMemId(rs.getString("MEM_ID"));
				mem.setMemPw(rs.getString("MEM_PW"));
				mem.setMemSq(rs.getString("MEM_SQ"));
				mem.setMemSa(rs.getString("MEM_SA"));
				mem.setMemRegDate(rs.getString("MEM_REGDATE"));
				memList.add(mem);
			}
			return memList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) { try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (ps != null) { try { ps.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
		return null;
	}

	@Override
	public int updateMember(MemberVO mem) {
		int updatedRowCnt = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
			StringBuffer query = new StringBuffer();
			query.append("UPDATE					");
			query.append("	P2_MEMBER				");
			query.append("SET						");
			query.append("	MEM_PW = ?				");
			query.append("WHERE	1=1					");
			query.append("	AND MEM_ID = ?			");
			//query.append("	AND MEM_PW = ?			");
			ps = conn.prepareStatement(query.toString());
			
			int psIdx = 1;
			ps.setString(psIdx++, mem.getMemPw());
			ps.setString(psIdx++, mem.getMemId());
			//ps.setString(psIdx++, mem.getMemPw());
			
			updatedRowCnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (ps != null) { try { ps.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
		return updatedRowCnt;
	}

	@Override
	public int deleteMember(MemberVO mem) {
		int updatedRowCnt = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
			StringBuffer query = new StringBuffer();
			query.append("DELETE FROM				");
			query.append("	P2_MEMBER				");
			query.append("WHERE	1=1					");
			query.append("	AND MEM_ID = ?			");
			ps = conn.prepareStatement(query.toString());
			
			int psIdx = 1;
			ps.setString(psIdx++, mem.getMemId());
			
			updatedRowCnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (ps != null) { try { ps.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
		return updatedRowCnt;
	}

}
