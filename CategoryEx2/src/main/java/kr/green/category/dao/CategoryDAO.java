package kr.green.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.category.vo.CategoryVO;

public interface CategoryDAO {
	List<CategoryVO> selectList(SqlSession sqlSession);
	void insert(SqlSession sqlSession, CategoryVO categoryVO);
	void updateRef(SqlSession sqlSession);
	void updateSeq(SqlSession sqlSession, CategoryVO categoryVO);
	void reply(SqlSession sqlSession, CategoryVO categoryVO);
	void update(SqlSession sqlSession, CategoryVO categoryVO);
	void delete(SqlSession sqlSession, CategoryVO categoryVO);
	List<CategoryVO> selectSeqList(SqlSession sqlSession, CategoryVO categoryVO);
	void updateDel(SqlSession sqlSession, CategoryVO categoryVO);
	CategoryVO selectByIdx(SqlSession sqlSession, int idx);
	List<CategoryVO> selectDelList(SqlSession sqlSession);
}
