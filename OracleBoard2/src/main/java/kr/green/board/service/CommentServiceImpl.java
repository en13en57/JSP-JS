package kr.green.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.dao.CommentDAO;
import kr.green.board.dao.CommentDAOImpl;
import kr.green.board.mybatis.MybatisApp;
import kr.green.board.vo.CommentVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class CommentServiceImpl implements CommentService {

	private static CommentService instance = new CommentServiceImpl();
	private CommentServiceImpl() {;}
	public static CommentService getInstance() {
		return instance;
	}
	@Override
	public int selectCount(int ref) {
		log.debug("selectCount 호출 : " + ref);
	
		int count=0;
		SqlSession sqlSession = null;
		CommentDAO commentDAO = null;
		
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			commentDAO = CommentDAOImpl.getInstance();
			//================================================================
			count = commentDAO.selectCount(sqlSession, ref);
			//================================================================
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		log.debug("selectCount 리턴 : " + count);
		return count;
	}

	@Override
	public List<CommentVO> selectList(int ref) {
		log.debug("selectList 호출 : " + ref);

		List<CommentVO> list = null;
		SqlSession sqlSession = null;
		CommentDAO commentDAO = null;
		
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			commentDAO = CommentDAOImpl.getInstance();
			//================================================================
			list = commentDAO.selectList(sqlSession, ref);
			//================================================================
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		log.debug("selectList 리턴 : " + list);
		return list;
	}

	@Override
	public void insert(CommentVO commentVO) {
		log.debug("insert 호출 : " + commentVO);

		SqlSession sqlSession = null;
		CommentDAO commentDAO = null;
		
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			commentDAO = CommentDAOImpl.getInstance();
			//================================================================
			if(commentVO != null) {
				commentDAO.insert(sqlSession, commentVO);
			}
			//================================================================
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}

	@Override
	public void update(CommentVO commentVO) {
		log.debug("update 호출 : " + commentVO);
		
		SqlSession sqlSession = null;
		CommentDAO commentDAO = null;
		
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			commentDAO = CommentDAOImpl.getInstance();
			//================================================================
			if(commentVO != null) {
				// DB에서 해당 글 번호의 글을 읽어비번이 일치할때만 처리
				CommentVO dbVO = commentDAO.selectByIdx(sqlSession, commentVO.getIdx());
				if(dbVO!=null && dbVO.getPassword().equals(commentVO.getPassword()));
					commentDAO.update(sqlSession, commentVO);
			}
			//================================================================
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}

	@Override
	public void deleteByIdx(CommentVO commentVO) {
		log.debug("deleteByIdx 호출 : " + commentVO);
		
		SqlSession sqlSession = null;
		CommentDAO commentDAO = null;
		
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			commentDAO = CommentDAOImpl.getInstance();
			//================================================================
			if(commentVO != null) {
				// DB에서 해당 글 번호의 글을 읽어비번이 일치할때만 처리
				CommentVO dbVO = commentDAO.selectByIdx(sqlSession, commentVO.getIdx());
				if(dbVO!=null && dbVO.getPassword().equals(commentVO.getPassword()));
					commentDAO.deleteByIdx(sqlSession, commentVO.getIdx());
			}
			//================================================================
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}

		
	

	@Override
	public void deleteByRef(int ref) {
		log.debug("deleteByRef 호출 : " + ref);
		
		SqlSession sqlSession = null;
		CommentDAO commentDAO = null;
		
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			commentDAO = CommentDAOImpl.getInstance();
			//================================================================
			commentDAO.deleteByRef(sqlSession, ref);
			//================================================================
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
	}

}
