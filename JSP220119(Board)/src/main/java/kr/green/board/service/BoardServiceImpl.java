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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(BoardVO boardvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(BoardVO boardvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(BoardVO boardvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void commentInsert(CommentVO commentvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void commentUpdate(CommentVO commentvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void commentDelete(CommentVO commentvo) {
		// TODO Auto-generated method stub
		
	}
	
}
