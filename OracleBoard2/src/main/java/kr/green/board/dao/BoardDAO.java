package kr.green.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.vo.BoardVO;

public interface BoardDAO {
	//	<!-- 1. 전체 개수 구하기 -->
	int selectCount(SqlSession sqlsession) throws SQLException;
	//	<!-- 2. 1개 글 구하기 -->
	BoardVO selectByIdx(SqlSession sqlSession, int idx) throws SQLException;
	//	<!-- 3. 1페이지 글 구하기 -->
	List<BoardVO> selectList(SqlSession sqlSession, HashMap<String, Integer> map) throws SQLException;
	//	<!-- 4. 저장하기 -->
	void insert(SqlSession sqlSession, BoardVO boardVO) throws SQLException;
	//	<!-- 5. 수정하기 -->
	void update(SqlSession sqlSession, BoardVO boardVO) throws SQLException;
	//	<!-- 6. 삭제하기 -->
	void delete(SqlSession sqlSession, int idx) throws SQLException;
	//	<!-- 6. 조회수 증가하기 -->
	void updateHit(SqlSession sqlSession, int idx) throws SQLException;
	
}
