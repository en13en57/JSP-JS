package kr.green.memo.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.memo.dao.MemoDAO;
import kr.green.memo.dao.MemoDAOImpl;
import kr.green.memo.mybatis.MybatisApp;
import kr.green.memo.vo.MemoVO;
import kr.green.memo.vo.PagingVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemoServiceImpl implements MemoService {
	private static MemoService instance = new MemoServiceImpl();
	private MemoServiceImpl() {;}
	public static MemoService getInstance() {
		return instance;
	}

	@Override
	public PagingVO<MemoVO> selectList(int currentPage, int pageSize, int blockSize) {
		log.debug("selctList 호출 : " +  currentPage + pageSize + blockSize);
		PagingVO<MemoVO> pagingVO = null;
		List<MemoVO> list = null;
		SqlSession sqlSession = null;
		MemoDAO dao = MemoDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			
			int totalCount = dao.selectCount(sqlSession);
			pagingVO = new PagingVO<MemoVO>(totalCount, currentPage, pageSize, blockSize);
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", pagingVO.getStartNo());
			map.put("pageSize", pagingVO.getPageSize());
			list = dao.selectList(sqlSession, map);
			pagingVO.setList(list);
			
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		log.debug("selctList 리턴 : " +  pagingVO);
		return pagingVO;
	}

	@Override
	public MemoVO selcetByIdx(int idx) {
		log.debug("selectByIdx 호출 : " +  idx);
		MemoVO memoVO = null;
		SqlSession sqlSession = null;
		MemoDAO dao = null;
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			
			
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		log.debug("selectByIdx 리턴 : " +  memoVO);
		return memoVO;
	}

	@Override
	public void insert(MemoVO memoVO) {
		log.debug("insert 호출 : " +  memoVO);
		SqlSession sqlSession = null;
		MemoDAO dao = MemoDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			
			if(memoVO!=null) { // 넘어온 값이 있을때
				if(memoVO.getName()!=null && memoVO.getName().trim().length()>0) { // 이름이 있을때
					if(memoVO.getPassword()!=null && memoVO.getPassword().trim().length()>0) { // 비번이 있을때
						if(memoVO.getContent()!=null && memoVO.getContent().trim().length()>0) { // 내용이 있을때
							dao.insert(sqlSession, memoVO);
						}
					}
				}
			}
			
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		log.debug("insert 리턴 : " +  memoVO);
		
	}

	@Override
	public void update(MemoVO memoVO) {
		log.debug("update 호출 : " +  memoVO);
		SqlSession sqlSession = null;
		MemoDAO dao = MemoDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			if(memoVO!=null) { // 넘어온 값이 있을때
				if(memoVO.getName()!=null && memoVO.getName().trim().length()>0) { // 이름이 있을때
					if(memoVO.getPassword()!=null && memoVO.getPassword().trim().length()>0) { // 비번이 있을때
						if(memoVO.getContent()!=null && memoVO.getContent().trim().length()>0) { // 내용이 있을때
							// 그냥 수정하는 것이 아니라 비번이 같을때만 수정하자
							// 해당 글번호의 글을 읽어온다.
							MemoVO dbVO = dao.selectByIdx(sqlSession, memoVO.getIdx());
							// 읽어온 글번호가 있으면서 비번이 같을때만 수정을 한다. 
							if(dbVO!=null && dbVO.getPassword().equals(memoVO.getPassword())) {
								dao.update(sqlSession, memoVO);
							}
						}
					}
				}
			}
			
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		log.debug("update 리턴 : " +  memoVO);

		
	}

	@Override
	public void delete(MemoVO memoVO) {
		log.debug("delete 호출 : " +  memoVO);
		SqlSession sqlSession = null;
		MemoDAO dao = MemoDAOImpl.getInstance();
		try {
			sqlSession=MybatisApp.getSqlSessionFactory().openSession(false);
			if(memoVO!=null) { // 넘어온 값이 있을때
				if(memoVO.getName()!=null && memoVO.getName().trim().length()>0) { // 이름이 있을때
					if(memoVO.getPassword()!=null && memoVO.getPassword().trim().length()>0) { // 비번이 있을때
						if(memoVO.getContent()!=null && memoVO.getContent().trim().length()>0) { // 내용이 있을때
							// 그냥 삭제하는 것이 아니라 비번이 같을때만 삭제하자
							// 해당 글번호의 글을 읽어온다.
							MemoVO dbVO = dao.selectByIdx(sqlSession, memoVO.getIdx());
							// 읽어온 글번호가 있으면서 비번이 같을때만 삭제를 한다. 
							if(dbVO!=null && dbVO.getPassword().equals(memoVO.getPassword())) {
								dao.delete(sqlSession, memoVO.getIdx());
							}
						}
					}
				}
			}
			
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		log.debug("delete 리턴 : " +  memoVO);

		
	}

}
