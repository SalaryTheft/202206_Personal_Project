package com.privacy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.privacy.vo.BoardVO;
import com.privacy.vo.SearchVO;

public class BoardDAOQuery implements BoardDAO {

    @Override
    public List<BoardVO> getBoardList(SearchVO searchVO) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM (										");
            query.append("SELECT A.*, ROWNUM AS RNUM FROM (						");

            query.append("SELECT												");
            query.append("	BO_NO,												");
            query.append("	BO_TITLE,											");
            query.append("	BO_WRITER,											");
            query.append("	BO_CONTENT,											");
            query.append("	BO_CATEGORY,										");
            query.append("	TO_CHAR(BO_REG_DATE, 'MM-dd HH24:MI') AS BO_REG_DATE,	");
            query.append("	TO_CHAR(BO_MOD_DATE, 'MM-dd HH24:MI') AS BO_MOD_DATE,	");
            query.append("	BO_DEL_YN											");
            query.append("FROM													");
            query.append("	P2_BOARD											");
            if (searchVO.getCategory() != null && !("".equals(searchVO.getCategory()))) {
                query.append("WHERE	BO_CATEGORY = ?								");
            }
            query.append("ORDER BY												");
            query.append("	BO_NO DESC											");

            query.append(") A ) WHERE RNUM BETWEEN ? AND ?						");
            ps = conn.prepareStatement(query.toString());

            int psIdx = 1;
            if (searchVO.getCategory() != null && !("".equals(searchVO.getCategory()))) {
                ps.setString(psIdx++, searchVO.getCategory());
            }
            ps.setInt(psIdx++, searchVO.getFirstRow());
            ps.setInt(psIdx++, searchVO.getLastRow());
            rs = ps.executeQuery();

            List<BoardVO> boList = new ArrayList<BoardVO>();
            while (rs.next()) {
                BoardVO bo = new BoardVO();
                bo.setBoNo(rs.getInt("BO_NO"));
                bo.setBoTitle(rs.getString("BO_TITLE"));
                bo.setBoWriter(rs.getString("BO_WRITER"));
                bo.setBoContent(rs.getString("BO_CONTENT"));
                bo.setBoCategory(rs.getString("BO_CATEGORY"));
                bo.setBoRegDate(rs.getString("BO_REG_DATE"));
                bo.setBoModDate(rs.getString("BO_MOD_DATE"));
                bo.setBoDelYn(rs.getString("BO_DEL_YN"));
                boList.add(bo);
            }
            return boList;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @Override
    public int getTotalRowCount(SearchVO searchVO) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
            StringBuffer query = new StringBuffer();
            query.append("SELECT					");
            query.append("	COUNT(*) AS ROWCNT		");
            query.append("FROM						");
            query.append("	P2_BOARD				");
            if (searchVO.getCategory() != null && !("".equals(searchVO.getCategory()))) {
                query.append("WHERE	BO_CATEGORY = ?								");
            }
            ps = conn.prepareStatement(query.toString());
            int psIdx = 1;
            if (searchVO.getCategory() != null && !("".equals(searchVO.getCategory()))) {
                ps.setString(psIdx++, searchVO.getCategory());
            }

            rs = ps.executeQuery();

            int result = 0;
            while (rs.next()) {
                result = rs.getInt("ROWCNT");
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return 0;
    }

    @Override
    public BoardVO getBoard(int boNo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
            StringBuffer query = new StringBuffer();
            query.append("SELECT												");
            query.append("	BO_NO,												");
            query.append("	BO_TITLE,											");
            query.append("	BO_WRITER,											");
            query.append("	BO_CONTENT,											");
            query.append("	BO_CATEGORY,										");
            query.append("	TO_CHAR(BO_REG_DATE, 'MM-dd HH24:MI') AS BO_REG_DATE,	");
            query.append("	TO_CHAR(BO_MOD_DATE, 'MM-dd HH24:MI') AS BO_MOD_DATE,	");
            query.append("	BO_DEL_YN											");
            query.append("FROM													");
            query.append("	P2_BOARD											");
            query.append("WHERE	1=1												");
            query.append("	AND BO_NO  = ?										");
            ps = conn.prepareStatement(query.toString());

            int psIdx = 1;
            ps.setInt(psIdx++, boNo);
            rs = ps.executeQuery();

            while (rs.next()) {
                BoardVO bo = new BoardVO();
                bo.setBoNo(rs.getInt("BO_NO"));
                bo.setBoTitle(rs.getString("BO_TITLE"));
                bo.setBoWriter(rs.getString("BO_WRITER"));
                bo.setBoContent(rs.getString("BO_CONTENT"));
                bo.setBoCategory(rs.getString("BO_CATEGORY"));
                bo.setBoRegDate(rs.getString("BO_REG_DATE"));
                bo.setBoModDate(rs.getString("BO_MOD_DATE"));
                bo.setBoDelYn(rs.getString("BO_DEL_YN"));
                return bo;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @Override
    public int updateBoard(BoardVO bo) {
        int updatedRowCnt = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
            StringBuffer query = new StringBuffer();
            query.append("UPDATE					");
            query.append("	P2_BOARD				");
            query.append("SET						");
            query.append("	BO_TITLE = ?,			");
            query.append("	BO_CONTENT = ?,			");
            query.append("	BO_CATEGORY = ?,		");
            query.append("	BO_MOD_DATE = SYSDATE	");
            query.append("WHERE	1=1					");
            query.append("	AND BO_NO = ?			");
            ps = conn.prepareStatement(query.toString());

            int psIdx = 1;
            ps.setString(psIdx++, bo.getBoTitle());
            ps.setString(psIdx++, bo.getBoContent());
            ps.setString(psIdx++, bo.getBoCategory());
            ps.setInt(psIdx++, bo.getBoNo());
            updatedRowCnt = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return updatedRowCnt;
    }

    @Override
    public int deleteBoard(BoardVO bo) {
        int updatedRowCnt = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
            StringBuffer query = new StringBuffer();
            query.append("UPDATE								");
            query.append("	P2_BOARD							");
            query.append("SET									");
            query.append("	BO_TITLE = '삭제된 게시물',	");
            query.append("	BO_CONTENT = '삭제된 게시물입니다.',					");
            query.append("	BO_MOD_DATE = SYSDATE,				");
            query.append("	BO_DEL_YN = 'Y'						");
            query.append("WHERE	1=1								");
            query.append("	AND BO_NO = ?						");
            ps = conn.prepareStatement(query.toString());

            int psIdx = 1;
            ps.setInt(psIdx++, bo.getBoNo());
            updatedRowCnt = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return updatedRowCnt;
    }

    @Override
    public int insertBoard(BoardVO bo) {
        int updatedRowCnt = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:project02");
            StringBuffer query = new StringBuffer();
            query.append("INSERT INTO				");
            query.append("	P2_BOARD(				");
            query.append("		BO_NO,				");
            query.append("		BO_TITLE,			");
            query.append("		BO_WRITER,			");
            query.append("		BO_CONTENT,			");
            query.append("		BO_CATEGORY			");
            query.append("	)						");
            query.append("VALUES(					");
            query.append("	SEQ_P2_BOARD.NEXTVAL,	");
            query.append("	?, ?, ?, ?				");
            query.append(")							");
            ps = conn.prepareStatement(query.toString());

            int psIdx = 1;
            ps.setString(psIdx++, bo.getBoTitle());
            ps.setString(psIdx++, bo.getBoWriter());
            ps.setString(psIdx++, bo.getBoContent());
            ps.setString(psIdx++, bo.getBoCategory());

            updatedRowCnt = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return updatedRowCnt;
    }

}
