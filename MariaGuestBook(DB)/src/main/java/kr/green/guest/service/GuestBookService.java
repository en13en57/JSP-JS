package kr.green.guest.service;

import java.sql.Connection;
import java.util.List;

import kr.green.guest.dao.GuestBookDAO;
import kr.green.guest.vo.GuestBookVO;
import kr.green.guest.vo.PagingVO;
import kr.green.jdbc.JDBCUtil;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class GuestBookService {
	//------------------------------------------------------------------
	private static GuestBookService instance = new GuestBookService();
	private GuestBookService() {};
	public static GuestBookService getInstance() {
		return instance;
	}
	//------------------------------------------------------------------
	// 로직 1개당 1개의 메서드
	// 1. 목록보기 -- 1페이지 분량의 글을 가져온다
	public PagingVO<GuestBookVO> selectList(int currentPage, int pageSize, int blockSize){
		log.debug("selectList 호출 : " + currentPage + ", " + pageSize + ", " + blockSize);
		PagingVO<GuestBookVO> pagingVO = null;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			dao=GuestBookDAO.getInstance();
			conn.setAutoCommit(false);
			//---------------------------------------------------------------------
			// 이 부분만 변경된다.
			int totalCount = dao.selectCount(conn); // 전체 개수 구하기
			pagingVO = new PagingVO<GuestBookVO>(currentPage, pageSize, blockSize, totalCount); // 페이지 계산 완료
			// 1페이지 분량의 글을 가져온다.
			if(totalCount>0) {
				List<GuestBookVO> list = dao.selectList(conn, pagingVO.getStartNo(), pagingVO.getPageSize());
				// 가져온 리스트를 pagingVO에 넣는다.
				pagingVO.setList(list);
			}
			//---------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		log.debug("selectList 리턴 : " + pagingVO);
		return pagingVO;
	}
	// 2. 1개얻기 (수정하거나 삭제하려면 필요)
	public GuestBookVO selectByIdx(int idx) {
		GuestBookVO vo = null;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			dao=GuestBookDAO.getInstance();
			conn.setAutoCommit(false);
			//---------------------------------------------------------------------
				// 이 부분만 변경된다.
			vo = dao.selectByIdx(conn, idx);
			//---------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return vo;
	}
	// 3. 저장하기
	public int insert(GuestBookVO vo) {
		log.debug("insert 호출 : " + vo);
		int count =0;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			dao=GuestBookDAO.getInstance();
			conn.setAutoCommit(false);
			//---------------------------------------------------------------------
				// 이 부분만 변경된다.
			if(vo!=null) { // 넘어온 데이터가 있다면, 
				if(vo.getName()!=null && vo.getName().trim().length()>0) { // 이름이 있다면
					if(vo.getPassword()!=null && vo.getPassword().trim().length()>0) { // 비번이 있다면
						if(vo.getContent()!=null && vo.getContent().trim().length()>0) { // 내용이 있다면
							count = dao.insert(conn, vo);
						}
					}
				}
			}
			//---------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		log.debug("insert 리턴 : " + count);
		return count;
	}
	// 4. 수정하기
	public int update(GuestBookVO vo) {
		int count =0;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			dao=GuestBookDAO.getInstance();
			conn.setAutoCommit(false);
			//---------------------------------------------------------------------
			// 이 부분만 변경된다.
			// 넘어온 데이터가 있으면서 DB에 저장된 비번이 일치하면 수정
			if(vo!=null) { // 넘어온 데이터가 있으면서
				if(dao.passwordCheck(conn, vo.getIdx(), vo.getPassword())==1) { // 비번이 일치하면
					dao.update(conn, vo);
				}
			}
			//---------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}
	// 5. 삭제하기
	public int delete(GuestBookVO vo) {
		int count =0;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			dao=GuestBookDAO.getInstance();
			conn.setAutoCommit(false);
			//---------------------------------------------------------------------
			// 이 부분만 변경된다.
			// 넘어온 데이터가 있으면서 DB에 저장된 비번이 일치하면 수정
			if(vo!=null) { // 넘어온 데이터가 있으면서
				if(dao.passwordCheck(conn, vo.getIdx(), vo.getPassword())==1) { // 비번이 일치하면
					dao.delete(conn, vo.getIdx());
				}
			}
			//---------------------------------------------------------------------
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
