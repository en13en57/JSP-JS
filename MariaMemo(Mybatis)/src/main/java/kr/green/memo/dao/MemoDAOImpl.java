package kr.green.memo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.memo.vo.MemoVO;

public class MemoDAOImpl implements MemoDAO {
	private static MemoDAO instance = new MemoDAOImpl();
	private MemoDAOImpl() {;}
	public static MemoDAO getInstance() {
		return instance;
	}
	
	
	@Override
	public int selectCount(SqlSession sqlSession) {
		return sqlSession.selectOne("memo.selectCount");
	}

	@Override
	public MemoVO selectByIdx(SqlSession sqlSession, int idx) {
		return sqlSession.selectOne("memo.selectByIdx",idx);
	}

	@Override
	public List<MemoVO> selectList(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectList("memo.selectList",map);
	}

	@Override
	public void insert(SqlSession sqlSession, MemoVO memoVO) {
		sqlSession.insert("memo.insert", memoVO);
	}

	@Override
	public void update(SqlSession sqlSession, MemoVO memoVO) {
		sqlSession.update("memo.update",memoVO);
	}

	@Override
	public void delete(SqlSession sqlSession, int idx) {
		sqlSession.delete("memo.delete",idx);
	}

}
