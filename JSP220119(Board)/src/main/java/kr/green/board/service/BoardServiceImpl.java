package kr.green.board.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.dao.BoardDAO;
import kr.green.board.dao.BoardDAOImpl;
import kr.green.board.dao.CommentDAO;
import kr.green.board.dao.CommentDAOImpl;
import kr.green.board.mybatis.MybatisApp;
import kr.green.board.vo.BoardVO;
import kr.green.board.vo.CommentVO;
import kr.green.board.vo.PagingVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class BoardServiceImpl implements BoardService {
	private static BoardService instance = new BoardServiceImpl();
	private BoardServiceImpl(){;}
	public static BoardService getInstance() {
		return instance;
	}
	//-------------------------------------------------------------------------------
	
	@Override
	public PagingVO<BoardVO> selectList(int currentPage, int pageSize, int blockSize) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("selectList 호출 : " + currentPage + pageSize + blockSize  );
		PagingVO<BoardVO> pagingVO = null;
		//-------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		BoardDAO boardDAO = BoardDAOImpl.getInstance();
		CommentDAO commentDAO = CommentDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			//-------------------------------------------------------------------------------
			// 2. 바뀌는 부분 -- DAO를 호출하여 로직을 수행하는 부분
			int totalCount = boardDAO.selectCount(sqlSession); // 1) 전체 개수 구하고
			pagingVO = new PagingVO<BoardVO>(totalCount, currentPage, pageSize, blockSize); // 2) 페이지 계산하고
			// 3) 페이지 계산대로 글 얻어오기
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", pagingVO.getStartNo());
			map.put("pageSize", pagingVO.getPageSize());
			List<BoardVO> list = boardDAO.selectList(sqlSession, map);
			// 4) 각각의 글에 대하여 댓글의 개수를 얻어서 넣어준다.
			if(list!=null && list.size()>0) {
				for(BoardVO vo : list) {
					vo.setCommentCount(commentDAO.selectCount(sqlSession, vo.getIdx()));
				}
			}
			// 5) 글 목록을 pagingVO에 넣어주기
			pagingVO.setList(list);
			//-------------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		//-------------------------------------------------------------------------------
		// 3. 바뀌는부분 -- 하단의 로그와 리턴값
		log.debug("selectList 리턴 : " + pagingVO);
		return pagingVO;
	}

	@Override
	public BoardVO selectByIdx(int idx, boolean isHit) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("selectByIdx 호출 : " + idx + isHit );
		BoardVO boardVO = null;
		//-------------------------------------------------------------------------------
			SqlSession sqlSession = null;
			BoardDAO boardDAO = BoardDAOImpl.getInstance();
			CommentDAO commentDAO = CommentDAOImpl.getInstance();
			try {
				sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
				//-------------------------------------------------------------------------------
				// 2. 바뀌는 부분 -- DAO를 호출하여 로직을 수행하는 부분
					boardVO = boardDAO.selectByIdx(sqlSession, idx); // 1) 해당 글번호 글을 읽어오기
					if(boardVO !=null) { // 2) 읽은글이 존재 한다면
						if(isHit) { // 3) 참이면 조회수 증가한다.
							boardDAO.hitIncrement(sqlSession, idx);
							// 4) DB의 조회수는 증가되었지만 읽어온 글의 조회수는 그대로, 조회수를 증가시키자.
							boardVO.setHit(boardVO.getHit()+1);
						}
						// 5) 댓글을 읽어온다.
						List<CommentVO> list = commentDAO.selectList(sqlSession, boardVO.getIdx());
						boardVO.setCommentList(list);
					}
				//-------------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		//-------------------------------------------------------------------------------
		
		// 3. 바뀌는부분 -- 하단의 로그와 리턴값
		log.debug("selectByIdx 리턴 : ");
		return boardVO;
	}

	@Override
	public void insert(BoardVO boardVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("insert 호출 : " + boardVO );
		//-------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		BoardDAO boardDAO = BoardDAOImpl.getInstance();
		// CommentDAO commentDAO = CommentDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			//-------------------------------------------------------------------------------
			// 2. 바뀌는 부분 -- DAO를 호출하여 로직을 수행하는 부분
			if(boardVO!=null) {
				boardDAO.insert(sqlSession, boardVO);
			}
			//-------------------------------------------------------------------------------
		sqlSession.commit();
	}catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		if(sqlSession!=null) sqlSession.close();
	}
	//-------------------------------------------------------------------------------
	// 3. 바뀌는부분 -- 하단의 로그와 리턴값
	log.debug("insert 리턴 : ");
	}

	@Override
	public void update(BoardVO boardVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("update 호출 : " + boardVO );
		//-------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		BoardDAO boardDAO = BoardDAOImpl.getInstance();
		// CommentDAO commentDAO = CommentDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			//-------------------------------------------------------------------------------
			// 2. 바뀌는 부분 -- DAO를 호출하여 로직을 수행하는 부분
			if(boardVO!=null) {
				// 비번이 일치할때만 수정
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("idx", ""+boardVO.getIdx());
				map.put("password", ""+boardVO.getPassword());
				if(boardDAO.passwordCheck(sqlSession, map)==1) {
					boardDAO.update(sqlSession, boardVO);
				}
			}
			//-------------------------------------------------------------------------------
		sqlSession.commit();
	}catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		if(sqlSession!=null) sqlSession.close();
	}
	//-------------------------------------------------------------------------------
	// 3. 바뀌는부분 -- 하단의 로그와 리턴값
	log.debug("update 리턴 : ");
	}

	@Override
	public void delete(BoardVO boardVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("delete 호출 : " + boardVO );
		//-------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		BoardDAO boardDAO = BoardDAOImpl.getInstance();
		CommentDAO commentDAO = CommentDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			//-------------------------------------------------------------------------------
			// 2. 바뀌는 부분 -- DAO를 호출하여 로직을 수행하는 부분
			if(boardVO!=null) {
				// 비번이 일치할때만 수정
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("idx", ""+boardVO.getIdx());
				map.put("password", ""+boardVO.getPassword());
				if(boardDAO.passwordCheck(sqlSession, map)==1) {
					// 댓글을 모두 지워야 원본이 지워진다.
					// 모든 댓글 지우기
					commentDAO.deleteByRef(sqlSession, boardVO.getIdx());
					// 원본글 지우기
					boardDAO.delete(sqlSession, boardVO.getIdx());
					/*
					 * 만약 댓글에 저작권이 있어서 나에게 살제할 권한이 없다면
					 * 원본글의 제목이나 여분의 필드에 삭제 여부를 나타내도록 하여
					 * 목록을 가져올때 where절을 써서 삭제표시된 글들을 제외하면 된다.
					 * 
					 */
				}
			}
			//-------------------------------------------------------------------------------
		sqlSession.commit();
	}catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		if(sqlSession!=null) sqlSession.close();
	}
	//-------------------------------------------------------------------------------
	// 3. 바뀌는부분 -- 하단의 로그와 리턴값
	log.debug("delete 리턴 : ");
	}
		

	@Override
	public void commentInsert(CommentVO commentVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("commentInsert 호출 : " + commentVO );
		//-------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		CommentDAO commentDAO = CommentDAOImpl.getInstance();
		// CommentDAO commentDAO = CommentDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			//-------------------------------------------------------------------------------
			// 2. 바뀌는 부분 -- DAO를 호출하여 로직을 수행하는 부분
			if(commentVO!=null) {
				commentDAO.insert(sqlSession, commentVO);
			}
			//-------------------------------------------------------------------------------
		sqlSession.commit();
	}catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		if(sqlSession!=null) sqlSession.close();
	}
	//-------------------------------------------------------------------------------
	// 3. 바뀌는부분 -- 하단의 로그와 리턴값
	log.debug("commentInsert 리턴 : ");
	}

	@Override
	public void commentUpdate(CommentVO commentVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("commentUpdate 호출 : " + commentVO );
		//-------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		CommentDAO commentDAO = CommentDAOImpl.getInstance();
		// CommentDAO commentDAO = CommentDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			//-------------------------------------------------------------------------------
			// 2. 바뀌는 부분 -- DAO를 호출하여 로직을 수행하는 부분
			if(commentVO!=null) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("idx", ""+commentVO.getIdx());
				map.put("password", ""+commentVO.getPassword());
				if(commentDAO.passwordCheck(sqlSession, map)==1) {
					commentDAO.update(sqlSession, commentVO);
				}
			}
			//-------------------------------------------------------------------------------
		sqlSession.commit();
	}catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		if(sqlSession!=null) sqlSession.close();
	}
	//-------------------------------------------------------------------------------
	// 3. 바뀌는부분 -- 하단의 로그와 리턴값
	log.debug("commentUpdate 리턴 : ");
		
	}

	@Override
	public void commentDelete(CommentVO commentVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("commentDelete 호출 : " + commentVO );
		//-------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		CommentDAO commentDAO = CommentDAOImpl.getInstance();
		// CommentDAO commentDAO = CommentDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			//-------------------------------------------------------------------------------
			// 2. 바뀌는 부분 -- DAO를 호출하여 로직을 수행하는 부분
			if(commentVO!=null) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("idx", ""+commentVO.getIdx());
				map.put("password", ""+commentVO.getPassword());
				if(commentDAO.passwordCheck(sqlSession, map)==1) {
					commentDAO.delete(sqlSession, commentVO.getIdx());
				}
			}
			//-------------------------------------------------------------------------------
		sqlSession.commit();
	}catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		if(sqlSession!=null) sqlSession.close();
	}
	//-------------------------------------------------------------------------------
	// 3. 바뀌는부분 -- 하단의 로그와 리턴값
	log.debug("commentDelete 리턴 : ");
		
		
	}
	
}
