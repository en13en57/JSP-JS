package kr.green.memo.service;

import java.sql.Connection;
import java.util.List;

import kr.green.jdbc.JDBCUtil;
import kr.green.memo.dao.MemoDAO;
import kr.green.memo.vo.MemoVO;
import kr.green.memo.vo.PagingVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class MemoService {
	// -------------------------------------------------
	// 싱글톤 클래스 만들자 객체를 1개만 만들어서 재활용
	private static MemoService instance = new MemoService();
	private MemoService() {}
	public static MemoService getInstance() {
		return instance;
	}
	//--------------------------------------------------
	// 1. 목록보기
	public PagingVO<MemoVO> selectList(int currentPage, int pageSize, int blockSize){
		log.debug("MemoService.selectList 호출 인수 : " + currentPage + ", " + pageSize + ", " + blockSize);
		PagingVO<MemoVO> pagingVO = null;
		List<MemoVO> list = null;
		Connection conn = null;
		MemoDAO dao = MemoDAO.getInstance();
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			// -------------------------------------------------------------------------
			int totalCount = dao.selectCount(conn);
			pagingVO = new PagingVO<MemoVO>(currentPage,pageSize,blockSize,totalCount);
			list = dao.selectList(conn, pagingVO.getStartNo(), pagingVO.getPageSize());
			pagingVO.setList(list);
			// -------------------------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		log.debug("MemoService.selectList 리턴 : " + list);
		return pagingVO;
	}
	
	// 2. 1개얻기
	// 3. 저장하기
	// 4. 수정하기
	// 5. 삭제하기
}
