package kr.green.board.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kr.green.board.vo.BoardVO;

public interface BoardDAO {
	// 1. 전체개수 가져오기
	int selectCount(Connection conn) throws SQLException;
	// 2. 1개 가져오기
	BoardVO selectByIdx(Connection conn, int idx) throws SQLException;
	// 3. 1페이지 가져오기
	List<BoardVO> selectList(Connection conn, int startNo, int pageSize ) throws SQLException;
	// 4. 저장하기
	int insert(Connection conn, BoardVO vo) throws SQLException;
	// 5. 수정하기
	int update(Connection conn, BoardVO vo) throws SQLException;
	// 6. 삭제하기
	int delete(Connection conn, int idx) throws SQLException;
	// 7. 비밀번호 확인
	int passwordCheck(Connection conn, int idx, String password) throws SQLException;
	// 8. 조회수 증가 
	int incrementHit(Connection conn, int idx) throws SQLException;
}
