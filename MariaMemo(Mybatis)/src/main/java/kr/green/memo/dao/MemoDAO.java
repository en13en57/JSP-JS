package kr.green.memo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.memo.vo.MemoVO;

public interface MemoDAO {
	int selectCount(SqlSession sqlSession);
	MemoVO selectByIdx(SqlSession sqlSession, int idx);
	List<MemoVO> selectList(SqlSession sqlSession, HashMap<String, Integer> map);
	void insert(SqlSession sqlSession, MemoVO memoVO);
	void update(SqlSession sqlSession, MemoVO memoVO);
	void delete(SqlSession sqlSession, int idx);
}
