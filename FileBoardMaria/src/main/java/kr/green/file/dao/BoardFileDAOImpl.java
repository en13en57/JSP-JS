package kr.green.file.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.file.vo.BoardFileVO;

public class BoardFileDAOImpl implements BoardFileDAO{
	private static BoardFileDAO instance = new BoardFileDAOImpl();
	private BoardFileDAOImpl() {;}
	public static BoardFileDAO getInstance() {
		return instance;
	}
	
	@Override
	public List<BoardFileVO> selectByRef(SqlSession sqlSession, int ref) throws SQLException {
		return sqlSession.selectList("file.selectByRef", ref);
	}

	@Override
	public void insert(SqlSession sqlSession, BoardFileVO boardFileVO) throws SQLException {
		sqlSession.insert("file.insert", boardFileVO);
	}

	@Override
	public void delete(SqlSession sqlSession, int idx) throws SQLException {
		sqlSession.delete("file.delete", idx);
	}

}
