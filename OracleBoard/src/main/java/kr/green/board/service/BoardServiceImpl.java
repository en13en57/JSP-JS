package kr.green.board.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.board.dao.BoardDAO;
import kr.green.board.dao.BoardDAOImpl;
import kr.green.board.mybatis.MybatisApp;
import kr.green.board.vo.BoardVO;
import kr.green.board.vo.PagingVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class BoardServiceImpl implements BoardService {
	private static BoardService instance = new BoardServiceImpl();
	private BoardServiceImpl() {;}
	public static BoardService getInstance() {
		return instance;
	}
	// 목록보기
	@Override
	public PagingVO<BoardVO> selectList(int currentPage, int pageSize, int blockSize) {
		log.debug("selectList 호출 : " + currentPage + ", " + pageSize + ", " + blockSize);
		PagingVO<BoardVO> pagingVO = null;
		SqlSession sqlSession = null;
		BoardDAO boardDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			boardDAO = BoardDAOImpl.getInstance();
			//------------------------------------------------------------
			int totalCount = boardDAO.selectCount(sqlSession);
			pagingVO = new PagingVO<BoardVO>(currentPage, pageSize, blockSize, totalCount);
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", pagingVO.getStartNo());
			map.put("endNo", pagingVO.getEndNo());
			
			List<BoardVO> list = boardDAO.selectList(sqlSession, map);
			pagingVO.setList(list);
			//------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		log.debug("selectList 리턴 :" + pagingVO);
		return pagingVO;
	}

	@Override
	public BoardVO selectByIdx(int idx, int mode) {
		log.debug("selectByIdx 호출 : " + idx + ", " + mode);
		BoardVO boardVO= null;
		SqlSession sqlSession = null;
		BoardDAO boardDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			boardDAO = BoardDAOImpl.getInstance();
			//------------------------------------------------------------
			boardVO = boardDAO.selectByIdx(sqlSession, idx);
			if(boardVO !=null && mode==1) {
				boardDAO.updateHit(sqlSession, idx);
				boardVO.setHit(boardVO.getHit()+1);
			}
			//------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		
		log.debug("selectByIdx 리턴 : " + boardVO);
		return boardVO;
	}

	@Override
	public void insert(BoardVO boardVO) {
		log.debug("insert 호출 : " + boardVO);
		SqlSession sqlSession = null;
		BoardDAO boardDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			boardDAO = BoardDAOImpl.getInstance();
			//------------------------------------------------------------
			if(boardVO!=null) {
				if(boardVO.getName()!=null) {
					if(boardVO.getPassword()!=null) {
						if(boardVO.getSubject()!=null) {
							if(boardVO.getContent()!=null){
								boardDAO.insert(sqlSession, boardVO);
							}
								
						}
								
					}
					
				}
			}
			//------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("insert 리턴");	
	}
	@Override
	public void update(BoardVO boardVO) {
		log.debug("update 호출 : " + boardVO);
		SqlSession sqlSession = null;
		BoardDAO boardDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			boardDAO = BoardDAOImpl.getInstance();
			//------------------------------------------------------------
			if(boardVO!=null) {
				BoardVO dbVO = boardDAO.selectByIdx(sqlSession, boardVO.getIdx());
				if(dbVO!=null && dbVO.getPassword().equals(boardVO.getPassword())) {
					boardDAO.update(sqlSession, boardVO);
				}
			}
			//------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("update 리턴");		
	}

	@Override
	public void delete(BoardVO boardVO) {
		log.debug("delete 호출 : " + boardVO);
		SqlSession sqlSession = null;
		BoardDAO boardDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			boardDAO = BoardDAOImpl.getInstance();
			//------------------------------------------------------------
			if(boardVO!=null) {
				BoardVO dbVO = boardDAO.selectByIdx(sqlSession, boardVO.getIdx());
				if(dbVO!=null && dbVO.getPassword().equals(boardVO.getPassword())) {
					boardDAO.delete(sqlSession, boardVO.getIdx());
				}
			}
			//------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("delete 리턴");		
	}
		
	
	
}
