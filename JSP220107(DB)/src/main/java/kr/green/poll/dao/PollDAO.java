package kr.green.poll.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.green.jdbc.JDBCUtil;
import kr.green.poll.vo.PollVO;

public class PollDAO {
	//-----------------------------------------------------------------------
	// 싱글톤 패턴으로 만들자
	// 1. 자기 자신의 객체를 정적 멥버로 가진다.
	private static PollDAO instance = new PollDAO();
	// 2. 밖에서 객체를 생성하지 못하도록 생성자를 private으로 만든다.
	private PollDAO() {}
	// 3. 만들어져 있는 객체를 사용하도록 만든다.
	public static PollDAO getInstance() {
		return instance;
	}
	//-----------------------------------------------------------------------
	// 1. 새로운 투표등록 
	public void insert(Connection conn, PollVO vo) throws SQLException {
		String sql = "insert into poll (subject,item,count,startDate,endDate) values (?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getSubject());
		pstmt.setString(2, vo.getItem());
		pstmt.setString(3, vo.getCount());
		pstmt.setString(4, vo.getStartDate());
		pstmt.setString(5, vo.getEndDate());
		pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
	}
	// 2. 1개투표 읽기  -- 투표폼
	public PollVO selectByIdx(Connection conn, int idx) throws SQLException {
		PollVO vo = null;
		String sql = "select * from poll where idx=" + idx;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			vo = new PollVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setSubject(rs.getString("subject"));
			vo.setItem(rs.getString("item"));
			vo.setCount(rs.getString("count"));
			vo.setStartDate(rs.getString("startDate"));
			vo.setEndDate(rs.getString("endDate"));
			vo.setComment(rs.getString("comment"));
		}
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		return vo;
	}
	// 3. 모든 투표보기 -- 목록
	public List<PollVO> selectList(Connection conn) throws SQLException{
		List<PollVO> list = null;
		String sql = "select * from poll order by idx desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			list = new ArrayList<PollVO>();
			do {
				PollVO vo = new PollVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setItem(rs.getString("item"));
				vo.setCount(rs.getString("count"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setEndDate(rs.getString("endDate"));
				vo.setComment(rs.getString("comment"));
				
				list.add(vo);
			}while(rs.next());
		}
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		return list;
	}
	// 4. 투표수 증가하기 
	public void update(Connection conn, PollVO vo) throws SQLException {
		String sql = "update poll set count=? where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getCount());
		pstmt.setInt(2, vo.getIdx());
		pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
	}
}
