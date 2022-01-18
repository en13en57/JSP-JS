package kr.green.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.green.board.vo.BoardVO;
import kr.green.jdbc.JDBCUtil;

public class BoardDAOImpl implements BoardDAO{
	//-------------------------------------------------------------------------
	private static BoardDAO instance = new BoardDAOImpl();
	private BoardDAOImpl() {;}
	public static BoardDAO getInstance() {
		return instance;
	}
	//-------------------------------------------------------------------------
	
	@Override
	public int selectCount(Connection conn) throws SQLException {
		int count=0;
		String sql = "select count(*) from board2";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		count = rs.getInt(1);
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		return count;
	}
	

	@Override
	public BoardVO selectByIdx(Connection conn, int idx) throws SQLException {
		BoardVO vo = null;
		String sql = "select * from board2 where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,idx);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			vo=new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setPassword(rs.getString("password"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setRegDate(rs.getTimestamp("regDate"));
				vo.setHit(rs.getInt("hit"));
				vo.setIp(rs.getString("ip"));
		}
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
		return vo;
	}

	@Override
	public List<BoardVO> selectList(Connection conn, int startNo, int pageSize) throws SQLException {
		List<BoardVO> list = null;
		String sql = "select * from board2 order by idx desc limit ?,?  ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startNo);
		pstmt.setInt(2, pageSize);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			list = new ArrayList<BoardVO>();
			do {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setPassword(rs.getString("password"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setRegDate(rs.getTimestamp("regDate"));
				vo.setHit(rs.getInt("hit"));
				vo.setIp(rs.getString("ip"));
				list.add(vo);
			}while(rs.next());
		}
		return list;
	}

	@Override
	public int insert(Connection conn, BoardVO vo) throws SQLException {
		int count = 0;
		String sql = "insert into board2(name, password, subject, content, ip) values (?, password(?), ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getPassword());
		pstmt.setString(3, vo.getSubject());
		pstmt.setString(4, vo.getContent());
		pstmt.setString(5, vo.getIp());
		count=pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		return count;
	}

	@Override
	public int update(Connection conn, BoardVO vo) throws SQLException {
		int count = 0;
		String sql = "update board2 set (subject=?, content=?, regDate=now(), ip=? where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getSubject());
		pstmt.setString(2, vo.getContent());
		pstmt.setString(3, vo.getIp());
		pstmt.setInt(4, vo.getIdx());
		count=pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		return count;
	}

	@Override
	public int delete(Connection conn, int idx) throws SQLException {
		int count=0;
		String sql = "delete from board2 where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		count=pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		return count;
	}

	@Override
	public int passwordCheck(Connection conn, int idx, String password) throws SQLException {
		int count=0;
		String sql = "select count(*) from board2 where idx=? and password=password(?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		count=rs.getInt(1);
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
		return count;
	}

	@Override
	public int incrementHit(Connection conn, int idx) throws SQLException {
		int count=0;
		String sql = "upadate board2 set hit = hut+1 where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		count=pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		return count;
	}

}
