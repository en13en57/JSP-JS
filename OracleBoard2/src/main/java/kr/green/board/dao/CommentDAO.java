package kr.green.board.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.vo.CommentVO;

public interface CommentDAO {
	
	//	<!-- 1. 지정 번호의 댓글 몇개? -->
	int selectCount(SqlSession sqlSession, int ref) throws SQLException;
	
	//	<!-- 2. 지정 번호의 모든 댓글 얻기 -->
	List<CommentVO> selectList(SqlSession sqlSession, int ref) throws SQLException;
	
	//	<!-- 3. 댓글 저장 -->
	void insert(SqlSession sqlSession, CommentVO commentVO) throws SQLException;
	
	//	<!-- 4. 댓글 수정 -->
	void update(SqlSession sqlSession, CommentVO commentVO) throws SQLException;
	
	//	<!-- 5. 댓글 삭제 -->
	void deleteByIdx(SqlSession sqlSession, int idx) throws SQLException;

	//	<!-- 6. 지정 번호의 모든 댓글 삭제 -->
	void deleteByRef(SqlSession sqlSession, int ref) throws SQLException;

	//	<!-- 7. 지정 번호의 댓글 얻기 -->
	CommentVO selectByIdx(SqlSession sqlSession, int idx) throws SQLException;
}
