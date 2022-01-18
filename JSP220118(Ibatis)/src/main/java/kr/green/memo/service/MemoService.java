package kr.green.memo.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.green.ibatis.IbatisApp;
import kr.green.memo.dao.MemoDAO;
import kr.green.memo.vo.MemoVO;
import kr.green.memo.vo.PagingVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemoService {
	// ---------------------------------------------------------
	// 싱글톤 클래스로 만들자
	private static MemoService instance = new MemoService();
	private MemoService() {}
	public static MemoService getInstance() {
		return instance;
	}
	// ---------------------------------------------------------
	// 1. 목록보기
	public PagingVO<MemoVO> selectList(int currentPage, int pageSize, int blockSize){
		log.debug("MemoService.selectList 호출 인수 : " + currentPage + ", " + pageSize + ", "+ blockSize);
		PagingVO<MemoVO> pagingVO = null;
		List<MemoVO> list = null;
		SqlMapClient mapClient = null;
		MemoDAO dao = MemoDAO.getInstance();
		try {
			mapClient = IbatisApp.getSqlMapClient();
			mapClient.startTransaction();
			//-----------------------------------------------------------------------------
			int totalCount = dao.selectCount(mapClient);
			pagingVO = new PagingVO<MemoVO>(currentPage, pageSize, blockSize, totalCount);
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", pagingVO.getStartNo());
			map.put("pageSize", pagingVO.getPageSize());
			list = dao.selectList(mapClient, map);
			pagingVO.setList(list);
			//-----------------------------------------------------------------------------
			mapClient.commitTransaction();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				mapClient.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		log.debug("MemoService.selectList 리턴 : " + pagingVO);
		return pagingVO;
	}
	// 2. 1개 얻기
	// 3. 저장하기
	public void insert(MemoVO vo) {
		log.debug("MemoService.insert 호출 인수 : " + vo);	
		SqlMapClient mapClient = null;
		MemoDAO dao = MemoDAO.getInstance();
		try {
			mapClient = IbatisApp.getSqlMapClient();
			mapClient.startTransaction();
			//-----------------------------------------------------------------------------
			if(vo!=null) { // 넘어온 값이 있을때
				if(vo.getName()!=null && vo.getName().trim().length()>0) { // 이름이 있을때
					if(vo.getPassword()!=null && vo.getPassword().trim().length()>0) { // 비번이 있을때
						if(vo.getContent()!=null && vo.getContent().trim().length()>0) { // 내용이 있을때
							dao.insert(mapClient, vo);
						}
					}
				}
			}
			//-----------------------------------------------------------------------------
			mapClient.commitTransaction();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				mapClient.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		log.debug("MemoService.insert 리턴 : ");	
	}
	// 4. 수정하기
	public void update(MemoVO vo) {
		log.debug("MemoService.update 호출 인수 : " + vo);	
		SqlMapClient mapClient = null;
		MemoDAO dao = MemoDAO.getInstance();
		try {
			mapClient = IbatisApp.getSqlMapClient();
			mapClient.startTransaction();
			//-----------------------------------------------------------------------------
			if(vo!=null) { // 넘어온 값이 있을때
				if(vo.getName()!=null && vo.getName().trim().length()>0) { // 이름이 있을때
					if(vo.getPassword()!=null && vo.getPassword().trim().length()>0) { // 비번이 있을때
						if(vo.getContent()!=null && vo.getContent().trim().length()>0) { // 내용이 있을때
							// 그냥 수정하는 것이 아니라 비번이 같을때만 수정하자
							// 해당 글번호의 글을 읽어온다.
							MemoVO dbVO = dao.selectByIdx(mapClient, vo.getIdx());
							// 읽어온 글번호가 있으면서 비번이 같을때만 수정을 한다. 
							if(dbVO!=null && dbVO.getPassword().equals(vo.getPassword())) {
								dao.update(mapClient, vo);
							}
						}
					}
				}
			}
			//-----------------------------------------------------------------------------
			mapClient.commitTransaction();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				mapClient.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		log.debug("MemoService.update 리턴 : ");	
	}
	// 5. 삭제하기
	public void delete(MemoVO vo) {
		log.debug("MemoService.delete 호출 인수 : " + vo);	
		SqlMapClient mapClient = null;
		MemoDAO dao = MemoDAO.getInstance();
		try {
			mapClient = IbatisApp.getSqlMapClient();
			mapClient.startTransaction();
			//-----------------------------------------------------------------------------
			if(vo!=null) { // 넘어온 값이 있을때
				if(vo.getName()!=null && vo.getName().trim().length()>0) { // 이름이 있을때
					if(vo.getPassword()!=null && vo.getPassword().trim().length()>0) { // 비번이 있을때
						if(vo.getContent()!=null && vo.getContent().trim().length()>0) { // 내용이 있을때
							// 그냥 삭제하는 것이 아니라 비번이 같을때만 삭제하자
							// 해당 글번호의 글을 읽어온다.
							MemoVO dbVO = dao.selectByIdx(mapClient, vo.getIdx());
							// 읽어온 글번호가 있으면서 비번이 같을때만 삭제를 한다. 
							if(dbVO!=null && dbVO.getPassword().equals(vo.getPassword())) {
								dao.delete(mapClient, vo.getIdx());
							}
						}
					}
				}
			}
			//-----------------------------------------------------------------------------
			mapClient.commitTransaction();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				mapClient.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		log.debug("MemoService.update 리턴 : ");	
	}
}
