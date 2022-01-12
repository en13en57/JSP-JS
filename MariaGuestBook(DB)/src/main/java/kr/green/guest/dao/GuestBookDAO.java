package kr.green.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.green.guest.vo.GuestBookVO;
import kr.green.jdbc.JDBCUtil;

public class GuestBookDAO {
	// --------------------------------------------------------------
	// 싱글톤 패턴으로 만들자
	// 1. 자기 자신의 객체를 정적멤버로 가진다.
	private static GuestBookDAO instance = new GuestBookDAO();

	// 2. 밖에서 객체를 생성하지 못하도록 생성자를 private으로 만든다.
	private GuestBookDAO() {
	}

	// 3. 밖에서 객체를 얻는 메서드를 만든다.
	public static GuestBookDAO getInstance() {
		return instance;
	}
	// --------------------------------------------------------------
	// 1) SQL명령어 1개당 1개의 메서드로 만든다.
	// 2) 트랜젝션을 위해 첫번째 인수는 COnnection으로 넘겨 받는다.
	
	// 1. 개수세기
	public int selectCount(Connection conn) throws SQLException {
		int count = 0;
		// 사용할 SQL명령을 만든다.
		String sql = "select count(*) from guestbook";
		// 명령 객체를 만들어 미완성 SQL명령을 ?를 채워서 완성된 명령으로 만든다. 
		Statement stmt = conn.createStatement();
		// 결과를 얻어온다.
		ResultSet rs = stmt.executeQuery(sql);
		// 얻어온 결과를 리턴타입의 변수에 넣는다.
		if(rs.next()) { // 데이터가 있으면
			count = rs.getInt(1);
		}
		// 사용한 객체를 닫는다.
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		// 결과를 리턴한다.
		return count;
	}
	// 2. 1개 얻기
	public GuestBookVO selectByIdx(Connection conn, int idx) throws SQLException {
		GuestBookVO vo = null;
		// 사용할 SQL명령을 만든다.
		String sql = "select * from guestbook where idx=?";
		// 명령 객체를 만들어 미완성 SQL 명령을 ? 을 채워서 완성된 명령으로 만든다.
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs =pstmt.executeQuery();
		if(rs.next()) {
			vo= new GuestBookVO();
			// 레코드값을 vo에 채워준다.
			vo.setIdx(rs.getInt("idx"));
			vo.setName(rs.getString("name"));
			vo.setPassword(rs.getString("password"));
			vo.setContent(rs.getString("content"));
			vo.setRegDate(rs.getTimestamp("regDate"));
			vo.setIp(rs.getString("ip"));
		}
		// 사용한 객체를 닫는다.
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
		// 결과를 리턴한다.
		return vo;
	}
	// 3. 1페이지 얻기
	public List<GuestBookVO> selectList(Connection conn, int startNo, int pageSize) throws SQLException {
		// 리턴 타입의 변수를 만든다.
		List<GuestBookVO> list = null;
		// 사용할 SQL명령을 만든다.
		String sql = "select * from guestbook order by idx desc limit ?, ?";
		// 명령 객체를 만들어 미완성 SQL명령을 ?를 채워서 완성된 명령으로 만든다. 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startNo);
		pstmt.setInt(2, pageSize);
		// 결과를 얻어온다.
		ResultSet rs = pstmt.executeQuery();
		// 얻어온 결과를 리턴타입의 변수에 넣는다.
		if(rs.next()) { // 데이터가 있으면
			list = new ArrayList<GuestBookVO>(); // 리턴 타입 객체 선언
			do {
				GuestBookVO vo = new GuestBookVO(); // 레코드 1개당 1개의 글이다.
				// 레코드값을 vo에 채워준다.
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setPassword(rs.getString("password"));
				vo.setContent(rs.getString("content"));
				vo.setRegDate(rs.getTimestamp("regDate"));
				vo.setIp(rs.getString("ip"));
				
				list.add(vo); // 리스트에 추가
			}while(rs.next());
		}
		// 사용한 객체를 닫는다.
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
		// 결과를 리턴한다.
		return list;
	}
	// 4. 저장하기
	public int insert(Connection conn, GuestBookVO vo) throws SQLException {
		int count = 0;
		// 사용할 SQL명령을 만든다.
		String sql= "insert into guestbook (name,password,content,regDate,ip) values (?,password(?),?,now(),?)"; 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getPassword());
		pstmt.setString(3, vo.getContent());
		pstmt.setString(4, vo.getIp());
		// 결과를 얻어온다.
		// 얻어온 결과를 리턴타입의 변수에 넣는다.
		count = pstmt.executeUpdate();
		// 사용한 객체를 닫는다.
		JDBCUtil.close(pstmt);
		// 결과를 리턴한다.
		return count;
	}
	// 5. 수정하기
	public int update(Connection conn, GuestBookVO vo) throws SQLException {
		int count = 0;
		// 사용할할 SQL명령을 만든다.
		String sql= "update guestbook set content=?, regDate=now(), ip=? where idx=?"; 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getContent());
		pstmt.setString(2, vo.getIp());
		pstmt.setInt(3, vo.getIdx());
		// 결과를 얻어온다.
		// 얻어온 결과를 리턴타입의 변수에 넣는다.
		count = pstmt.executeUpdate();
		// 사용한 객체를 닫는다.
		JDBCUtil.close(pstmt);
		// 결과를 리턴한다.
		return count;
	}
	// 6. 삭제하기
	public int delete(Connection conn, int idx) throws SQLException {
		int count = 0;
		// 사용할할 SQL명령을 만든다.
		String sql= "delete from guestbook where idx=?"; 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		// 결과를 얻어온다.
		// 얻어온 결과를 리턴타입의 변수에 넣는다.
		count = pstmt.executeUpdate();
		// 사용한 객체를 닫는다.
		JDBCUtil.close(pstmt);
		// 결과를 리턴한다.
		
		return count;
	}
	// 7. 비번의 일치 여부를 알아내는 메서드
	public int passwordCheck(Connection conn, int idx, String password) throws SQLException {
		int count = 0;
		// 사용할할 SQL명령을 만든다.
		String sql= "select count(*) from guestbook where idx=? and password = password(?)"; 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.setString(2, password);
		// 결과를 얻어온다.
		// 얻어온 결과를 리턴타입의 변수에 넣는다.
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		count = rs.getInt(1);
		// 사용한 객체를 닫는다.
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
		// 결과를 리턴한다.
		
		return count;
	}
	
	
}
