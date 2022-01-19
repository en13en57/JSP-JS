package kr.green.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.vo.BoardVO;

public class BoardDAOImpl implements BoardDAO{
	private static BoardDAO instance = new BoardDAOImpl();
	private BoardDAOImpl() {;}
	public static BoardDAO getInstance() {
		return instance;
	}
	//-----------------------------------------------------
@Override
public int selectCount(SqlSession sqlSession) {
	return sqlSession.selectOne("board.selectCount");
	}
	
	@Override
	public BoardVO selectByIdx(SqlSession sqlSession, int idx) {
		return sqlSession.selectOne("board.selectByIdx", idx);
	}
	
	@Override
	public List<BoardVO> selectList(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectList("board.selectList", map);
	}
	
	@Override
	public void insert(SqlSession sqlSession, BoardVO boardVO) {
		sqlSession.insert("board.insert",boardVO);
	}
	
	@Override
	public void update(SqlSession sqlSession, BoardVO boardVO) {
		sqlSession.update("board.update",boardVO);
	}
	
	@Override
	public void delete(SqlSession sqlSession, int idx) {
		sqlSession.delete("board.delete",idx);
		
	}
	
	@Override
	public void hitIncrement(SqlSession sqlSession, int idx) {
		sqlSession.update("board.hitIncrement", idx);
	}
	
	@Override
	public int passwordCheck(SqlSession sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("board.passwordCheck", map);
	}
	
	}
