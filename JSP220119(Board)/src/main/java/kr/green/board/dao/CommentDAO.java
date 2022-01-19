package kr.green.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.vo.CommentVO;

public interface CommentDAO {
	// 1. (?)글의 댓글이 (?)개인가 /전체 댓글이 아님
	int selectCount(SqlSession sqlSession, int ref);
	// 2. (?)글의 댓글 목록
	List<CommentVO> selectList(SqlSession sqlSession, int ref);
	// 3. 저장
	void insert(SqlSession sqlSession, CommentVO commentVO);
	// 4. 수정
	void update(SqlSession sqlSession, CommentVO commentVO);
	// 5. 삭제
	void delete(SqlSession sqlSession, int idx);
	// 6. (?)글의 댓글 모두 삭제
	void deleteByRef(SqlSession sqlSession, int ref);
	// 7. 비번검사
	int passwordCheck(SqlSession sqlSession, HashMap<String, String> map);
	
	
}
