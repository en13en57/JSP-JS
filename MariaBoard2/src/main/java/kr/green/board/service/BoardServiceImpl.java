package kr.green.board.service;

import java.sql.Connection;
import java.util.List;

import kr.green.board.dao.BoardDAO;
import kr.green.board.dao.BoardDAOImpl;
import kr.green.board.vo.BoardVO;
import kr.green.board.vo.PagingVO;
import kr.green.jdbc.JDBCUtil;

public class BoardServiceImpl implements BoardService {
	//-----------------------------------------------------------------------------
	private static BoardService instance = new BoardServiceImpl();
	private BoardServiceImpl() {;}
	public static BoardService getInstance(){
		return instance;
	}
	//-----------------------------------------------------------------------------
	
	@Override
	public PagingVO<BoardVO> selectList(int currentPage, int pageSize, int blockSize) {
		PagingVO<BoardVO> pagingVO = null;
		Connection conn = null;
		BoardDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = BoardDAOImpl.getInstance();
			//----------------------------------------------------------------------
			int totalCount=dao.selectCount(conn);
			pagingVO = new PagingVO<BoardVO>(currentPage, pageSize, blockSize, totalCount);
			List<BoardVO> list = dao.selectList(conn, pagingVO.getStartNo(), pagingVO.getPageSize());
			pagingVO.setList(list);
			//----------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return pagingVO;
	}

	@Override
	public BoardVO selectByIdx(int idx, boolean isHit) {
		BoardVO vo = null;
		Connection conn = null;
		BoardDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = BoardDAOImpl.getInstance();
			//-------------------------------------------------------------------
			vo=dao.selectByIdx(conn, idx);
			if(vo!=null) {
				if(isHit) {
					dao.incrementHit(conn, idx);
					vo.setHit(vo.getHit());
				}
			}
			//-------------------------------------------------------------------
			conn.commit();
		}catch(Exception e){
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return vo;
	}

	@Override
	public int insert(BoardVO vo) {
		int count = 0;
		Connection conn = null;
		BoardDAO dao = null;
		try {
			conn=JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao=BoardDAOImpl.getInstance();
			//------------------------------------------------------------------
			if(vo!=null) {
				count=dao.insert(conn, vo);
			}
			//------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}

	@Override
	public int update(BoardVO vo) {
		int count = 0;
		Connection conn = null;
		BoardDAO dao = null;
		try {
			conn=JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao=BoardDAOImpl.getInstance();
			//------------------------------------------------------------------
			if(vo!=null) {
				if(dao.passwordCheck(conn, vo.getIdx(), vo.getPassword())==1) {
					count=dao.update(conn, vo);
				}
			}
			//------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}

	@Override
	public int delete(BoardVO vo) {
		int count = 0;
		Connection conn = null;
		BoardDAO dao = null;
		try {
			conn=JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao=BoardDAOImpl.getInstance();
			//------------------------------------------------------------------
			if(vo!=null) {
				if(dao.passwordCheck(conn, vo.getIdx(), vo.getPassword())==1) {
					count=dao.delete(conn, vo.getIdx());
				}
			}
			//------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}

}
