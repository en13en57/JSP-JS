package kr.green.memo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import kr.green.jdbc.DBCPUtil;
import kr.green.memo.vo.MemoVO;

// SQL 명령어 1개당 1개의 메서드로 만든다.
// 객체를 1개만 만들어 재사용하기위해 싱글톤패턴으로 작성하자
// 트랜젝션을 처리하기 위해서 모든 메서드의 첫번째 인수는 Connection으로 하
public class MemoDAO {
	
	//--------------------------------------------------------------------------
	// 싱글톤 클래스로 만들자
	// 1) 자기 자신의 객체를 정적멤버로 가진다.
	private static MemoDAO instance = new MemoDAO();
	// 2) 밖에서 객체를 생성하지 못하도록 생성자를 private로 만든다.
	private MemoDAO() {}
	// 3) 만들어진 객체를 가져다 쓸 수 있도록 메서드 1개를 추가한다. getInstance()
	public static MemoDAO getInstance() {
		return instance;
	}
	//--------------------------------------------------------------------------
	// 1. 저장하기
	public int insert(Connection conn, MemoVO vo) throws SQLException {
		int count=0;
		String sql = "insert into memo (name,password,content,regdate,ip) values (?,?,?,now(),?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getName());		
		pstmt.setString(2, vo.getPassword());		
		pstmt.setString(3, vo.getContent());		
		pstmt.setString(4, vo.getIp());		
		count = pstmt.executeUpdate();
		DBCPUtil.close(pstmt);
		return count;
	}
	// 2. 수정하기
	public int update(Connection conn, MemoVO vo) throws SQLException {
		int count=0;
		String sql = "update memo set content=?, regdate=now(), ip=? where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getContent());		
		pstmt.setString(2, vo.getIp());		
		pstmt.setInt(3, vo.getIdx());		
		count = pstmt.executeUpdate();
		DBCPUtil.close(pstmt);
		return count;
	}
	
	// 3. 삭제하기
	public int delete(Connection conn, int idx) throws SQLException {
		int count=0;
		String sql = "delete from memo where idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);		
		count = pstmt.executeUpdate();
		DBCPUtil.close(pstmt);
		return count;
	}
	
	// 4. 조회하기 (모두 얻기)
	public List<MemoVO> selectList(Connection conn) throws SQLException{
		List<MemoVO> list = null;
		String sql = "select * from memo order by idx desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			list = new ArrayList<MemoVO>(); // 리스트 객체 생성
			do {
				MemoVO vo = new MemoVO(); // 레코드 1개당 글 1개이므로 VO객체 선언
				// 레코드에서 읽어서 VO를 채워준다.
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setPassword(rs.getString("password"));
				vo.setContent(rs.getString("content"));
				vo.setRegDate(rs.getDate("regDate"));
				vo.setIp(rs.getString("ip"));
				// 채워진 글 1개(vo)를 리스트에 넣는다.
				list.add(vo);
			}while(rs.next());
		}
		DBCPUtil.close(rs);
		DBCPUtil.close(stmt);
		return list;
	}
	// 5. 1개 얻기
	public MemoVO selectByIdx(Connection conn, int idx) throws SQLException{
		MemoVO vo = null;
		String sql = "select * from memo where idx=" + idx;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
				vo = new MemoVO(); // 레코드 1개당 글 1개이므로 VO객체 선언
				// 레코드에서 읽어서 VO를 채워준다.
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setPassword(rs.getString("password"));
				vo.setContent(rs.getString("content"));
				vo.setRegDate(rs.getDate("regDate"));
				vo.setIp(rs.getString("ip"));
				// 채워진 글 1개(vo)를 리스트에 넣는다.
		}
		DBCPUtil.close(rs);
		DBCPUtil.close(stmt);
		return vo;
	}
	// 6. 전체개수 얻기
	public int getTotalCount(Connection conn) throws SQLException {
		int totalCount = 0;
		String sql = "select count(*) from memo";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		totalCount = rs.getInt(1);
		DBCPUtil.close(rs);
		DBCPUtil.close(stmt);
		return totalCount;
	}
}
