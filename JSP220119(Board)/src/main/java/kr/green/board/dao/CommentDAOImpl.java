package kr.green.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.vo.CommentVO;

public class CommentDAOImpl implements CommentDAO {
	private static CommentDAO instance = new CommentDAOImpl();
	private CommentDAOImpl() {;}
	public static CommentDAO getInstance() {
		return instance;
	}
	//-----------------------------------------------------
	
	@Override
	public int selectCount(SqlSession sqlSession, int ref) {
		return sqlSession.selectOne("comment.selectCount", ref);
	}

	@Override
	public List<CommentVO> selectList(SqlSession sqlSession, int ref) {
		return sqlSession.selectList("comment.selectList", ref);
	}

	@Override
	public void insert(SqlSession sqlSession, CommentVO commentVO) {
		sqlSession.insert("comment.insert", commentVO);
	}

	@Override
	public void update(SqlSession sqlSession, CommentVO commentVO) {
		sqlSession.update("comment.update", commentVO);
		
	}

	@Override
	public void delete(SqlSession sqlSession, int idx) {
		sqlSession.delete("comment.delete", idx);
		
	}

	@Override
	public void deleteByRef(SqlSession sqlSession, int ref) {
		sqlSession.delete("comment.insert", ref);
		
	}

	@Override
	public int passwordCheck(SqlSession sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("comment.passwordCheck", map);
	}

}
