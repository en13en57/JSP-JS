package kr.green.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.vo.BoardVO;

public class BoardDAOImpl implements BoardDAO {
	private static BoardDAO instance = new BoardDAOImpl();
	private BoardDAOImpl() {;}
	public static BoardDAO getInstance() {
		return instance;
	}
	
	
	
	@Override
	public int selectCount(SqlSession sqlsession) throws SQLException {
		return sqlsession.selectOne("board.selectCount");
	}

	@Override
	public BoardVO selectByIdx(SqlSession sqlSession, int idx) throws SQLException {
		return sqlSession.selectOne("board.selectByIdx", idx);
	}

	@Override
	public List<BoardVO> selectList(SqlSession sqlSession, HashMap<String, Integer> map) throws SQLException {
		return sqlSession.selectList("board.selectList", map);
	}

	@Override
	public void insert(SqlSession sqlSession, BoardVO boardVO) throws SQLException {
		sqlSession.insert("board.insert", boardVO);
		
	}

	@Override
	public void update(SqlSession sqlSession, BoardVO boardVO) throws SQLException {
		sqlSession.update("board.update", boardVO);
		
	}

	@Override
	public void delete(SqlSession sqlSession, int idx) throws SQLException {
		sqlSession.delete("board.delete", idx);
		
	}

	@Override
	public void updateHit(SqlSession sqlSession, int idx) throws SQLException {
		sqlSession.update("board.updateHit", idx);
		
	}

}
