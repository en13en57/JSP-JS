package kr.green.memo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.green.jdbc.JDBCUtil;
import kr.green.memo.vo.MemoVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class MemoDAO {
	//---------------------------------------------------------
	// 싱글톤 클래스로 만들자
	private static MemoDAO instance = new MemoDAO();
	private MemoDAO() {}
	public static MemoDAO getInstance() {
		return instance;
	}
	//---------------------------------------------------------
	// 1. SQL명령어 1개당 1개의 메서드로 만든다.
	// 2. 첫번째 인수는 무조건 Connection이다. 왜? 트랜젝션 처리를 위해서!!!
	
	// 1) 전체 개수 세기를 위한 메서드 -- 목록보기에서 페이지 계산에 필요
	public int selectCount(Connection conn) throws SQLException {
		log.debug("MemoDAO.selectCount 호출");
		int totalCount = 0;
		String sql = "select count(*) from memo";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		totalCount = rs.getInt(1);
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		log.debug("MemoDAO.selectCount 리턴값 : " + totalCount);
		return totalCount;
	}
	
	// 2) 한페이지 분량의 글을 얻어오는 메서드 -- 1페이지 목록 출력에 필요
	public List<MemoVO> selectList(Connection conn, int startNo,int pageSize) throws SQLException{
		log.debug("MemoDAO.selectList 호출 : 인수 - " + startNo + ", " + pageSize );
		List<MemoVO> list = null;
		String sql = "select * from memo order by idx desc limit ?,?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startNo);
		pstmt.setInt(2, pageSize);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			list = new ArrayList<MemoVO>(); // 내용이 있으면 객체 생성
			do {
				MemoVO memoVO = new MemoVO();
				// VO를 채운다.
				memoVO.setIdx(rs.getInt("idx"));
				memoVO.setName(rs.getString("name"));
				memoVO.setPassword(rs.getString("password"));
				memoVO.setContent(rs.getString("content"));
				memoVO.setRegDate(rs.getTimestamp("regDate"));
				memoVO.setIp(rs.getString("ip"));
				// VO를 리스트에 추가한다.
				list.add(memoVO);
			}while(rs.next());
		}
		log.debug("MemoDAO.selectList 리턴값 : " + list);
		return list;
	}
	
	// 3) 1개의 글을 읽어오는 메서드 -- 수정/삭제에 필요
	public MemoVO selectByIdx(Connection conn, int idx) throws SQLException {
		log.debug("MemoDAO.selectByIdx 호출 : 인수 - " + idx);
		MemoVO memoVO = null;
		String sql = "select * from memo where idx=" + idx;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			memoVO = new MemoVO();
			// VO를 채운다.
			memoVO.setIdx(rs.getInt("idx"));
			memoVO.setName(rs.getString("name"));
			memoVO.setPassword(rs.getString("password"));
			memoVO.setContent(rs.getString("content"));
			memoVO.setRegDate(rs.getTimestamp("regDate"));
			memoVO.setIp(rs.getString("ip"));
		}
		log.debug("MemoDAO.selectByIdx 리턴 : " + memoVO);
		return memoVO;
	}
	// 4) 1개의 글을 저장하는 메서드
	public int insert(Connection conn, MemoVO vo) throws SQLException {
		log.debug("MemoDAO.insert 호출 : 인수 - " + vo);
		int count = 0;
		String sql = "insert into memo (name,password,content,regDate,ip) values (?,?,?,now(),?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getPassword());
		pstmt.setString(3, vo.getContent());
		pstmt.setString(4, vo.getIp());
		count = pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		log.debug("MemoDAO.insert 리턴값 : " + count);
		return count;
	}

	// 5) 1개의 글을 수정하는 메서드
	public int update(Connection conn, MemoVO vo) throws SQLException {
		log.debug("MemoDAO.update 호출 : 인수 - " + vo);
		int count = 0;
		String sql = "update memo set content=?, regDate = now(), ip=? where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getContent());
		pstmt.setString(2, vo.getIp());
		pstmt.setInt(3, vo.getIdx());
		count = pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		log.debug("MemoDAO.update 리턴값 : " + count);
		return count;
	}
	
	// 6) 1개의 글을 삭제하는 메서드
	public int delete(Connection conn, int idx) throws SQLException {
		log.debug("MemoDAO.delete 호출 : 인수 - " + idx);
		int count = 0;
		String sql = "delete from memo where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		count = pstmt.executeUpdate();
		JDBCUtil.close(pstmt);
		log.debug("MemoDAO.delete 리턴값 : " + count);
		return count;
	}
	
}
