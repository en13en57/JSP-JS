package kr.green.board.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.vo.CommentVO;

public class CommentDAOImpl implements CommentDAO {
	
	private static CommentDAO instance = new CommentDAOImpl();
	private CommentDAOImpl() {;}
	public static CommentDAO getInstance() {
		return instance;
	}

	@Override
	public int selectCount(SqlSession sqlSession, int ref) throws SQLException {
		return sqlSession.selectOne("comment.selectCount", ref);
	}

	@Override
	public List<CommentVO> selectList(SqlSession sqlSession, int ref) throws SQLException {
		return sqlSession.selectList("comment.selectList", ref);
	}

	@Override
	public void insert(SqlSession sqlSession, CommentVO commentVO) throws SQLException {
		sqlSession.insert("comment.insert", commentVO);
		
	}

	@Override
	public void update(SqlSession sqlSession, CommentVO commentVO) throws SQLException {
		sqlSession.update("comment.update", commentVO);
		
	}

	@Override
	public void deleteByIdx(SqlSession sqlSession, int idx) throws SQLException {
		sqlSession.delete("comment.deleteByIdx", idx);
		
	}

	@Override
	public void deleteByRef(SqlSession sqlSession, int ref) throws SQLException {
		sqlSession.delete("comment.deleteByRef", ref);
		
	}
	@Override
	public CommentVO selectByIdx(SqlSession sqlSession, int idx) throws SQLException {
		return sqlSession.selectOne("comment.selectByIdx", idx);
	}

}
