package kr.green.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.vo.BoardVO;

public interface BoardDAO {
	// 1. 개수세기
	int selectCount(SqlSession sqlSession);
	// 2. 1개 얻기
	BoardVO selectByIdx(SqlSession sqlSession, int idx);
	// 3. 1페이지 얻기
	List<BoardVO> selectList(SqlSession sqlSession, HashMap<String, Integer> map);
	// 4. 저장
	void insert(SqlSession sqlSession, BoardVO boardVO);
	// 5. 수정
	void update(SqlSession sqlSession, BoardVO boardVO);
	// 6. 삭제
	void delete(SqlSession sqlSession, int idx);
	// 7. 조회수 증가
	void hitIncrement(SqlSession sqlSession, int idx);
	// 8. 비번검사
	int passwordCheck(SqlSession sqlSession, HashMap<String, String> map);
	
	
}
