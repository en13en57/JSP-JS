package kr.green.category.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.category.dao.CategoryDAO;
import kr.green.category.dao.CategoryDAOImpl;
import kr.green.category.mybatis.MybatisApp;
import kr.green.category.vo.CategoryVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class CategoryServiceImpl implements CategoryService{
	private static CategoryService instance = new CategoryServiceImpl();
	private CategoryServiceImpl() {}
	public static CategoryService getInstance() {
		return instance;
	}
	//---------------------------------------------------------------
	@Override
	public void insert(CategoryVO categoryVO) {
		log.debug("insert 호출 : " + categoryVO);
		SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 자동커밋 취소
		CategoryDAO categoryDAO = null;
		try{
			categoryDAO = CategoryDAOImpl.getInstance();
			categoryDAO.insert(sqlSession, categoryVO);
			categoryDAO.updateRef(sqlSession);
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();
		}finally{
			if(sqlSession!=null) sqlSession.close();
		}				
		log.debug("insert 리턴 : ");		
	}
	@Override
	public void reply(CategoryVO categoryVO) {
		log.debug("reply 호출 : " + categoryVO);
		SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 자동커밋 취소
		CategoryDAO categoryDAO = null;
		try{
			categoryDAO = CategoryDAOImpl.getInstance();
			// 나의 sql보다 큰 seq값은 1씩 증가시킨다.
			categoryDAO.updateSeq(sqlSession, categoryVO);
			// seq +1 하고 lev +1해줘야한다.
			categoryVO.setSeq(categoryVO.getSeq()+1);
			categoryVO.setLev(categoryVO.getLev()+1);
			// 댓글 저장
			categoryDAO.reply(sqlSession, categoryVO);
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();
		}finally{
			if(sqlSession!=null) sqlSession.close();
		}		
		log.debug("reply 리턴 : ");
	}
	@Override
	public void update(CategoryVO categoryVO) {
		log.debug("update 호출 : " + categoryVO);
		SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 자동커밋 취소
		CategoryDAO categoryDAO = null;
		try{
			categoryDAO = CategoryDAOImpl.getInstance();
			categoryDAO.update(sqlSession, categoryVO);
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();
		}finally{
			if(sqlSession!=null) sqlSession.close();
		}		
		log.debug("update 리턴 : ");
	}
	@Override
	public void delete(CategoryVO categoryVO) {
		log.debug("delete 호출 : " + categoryVO);
		SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 자동커밋 취소
		CategoryDAO categoryDAO = null;
		try{
			categoryDAO = CategoryDAOImpl.getInstance();
			
			CategoryVO vo = categoryDAO.selectByIdx(sqlSession, categoryVO.getIdx());
			// 나의 자식 개수를 알아내는 쿼리가 필요하다.........
			List<CategoryVO> list =  categoryDAO.selectSeqList(sqlSession, vo); // ref가같으며 seq값이 큰값을 모두
			int childCount = 0; // 자식의 개수
			if(list!=null){
				int level  = list.get(0).getLev(); // 0번이 나이므로 0번의 레벨
				for(int i=1;i<list.size();i++){
					if(level>=list.get(i).getLev()) break; // 레벨이 나의 레벨보다 적거나 같으면 탈출
					childCount++; // 자식개수 증가		
				}
			}
			if(childCount==0){ // 나의 자식이 없으면 진짜로 DB에서 삭제를 한다.
				categoryDAO.delete(sqlSession, vo);
			}else{ // 나의 자식이 있으면 "삭제"표시를 하고
				vo.setDel("N");
				categoryDAO.updateDel(sqlSession, vo);
			}
			
			// 전체 레코드를 돌면서 해야한다.
			// del의 값이 'N'이면서 자식이 없는 항목은 완전삭제하는 코드를 추가해주어야 
			// 정리가 된다.
			List<CategoryVO> delList = categoryDAO.selectDelList(sqlSession);
			if(delList!=null) {
				for(CategoryVO delVO : delList) {
					// 나의 자식 개수를 알아내는 쿼리가 필요하다.........
					List<CategoryVO> list2 =  categoryDAO.selectSeqList(sqlSession, delVO); // ref가같으며 seq값이 큰값을 모두
					childCount = 0; // 자식의 개수
					if(list2!=null){
						int level  = list2.get(0).getLev(); // 0번이 나이므로 0번의 레벨
						for(int i=1;i<list2.size();i++){
							if(level>=list2.get(i).getLev()) break; // 레벨이 나의 레벨보다 적거나 같으면 탈출
							childCount++; // 자식개수 증가		
						}
					}
					if(childCount==0){ // 나의 자식이 없으면 진짜로 DB에서 삭제를 한다.
						categoryDAO.delete(sqlSession, delVO);
					}
				}
			}
			
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();
		}finally{
			if(sqlSession!=null) sqlSession.close();
		}		
		log.debug("delete 리턴 : ");
	}
	@Override
	public List<CategoryVO> selectList() {
		log.debug("selectList 호출 : ");
		List<CategoryVO> list = null;
		SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 자동커밋 취소
		CategoryDAO categoryDAO = null;
		try{
			categoryDAO = CategoryDAOImpl.getInstance();
			list = categoryDAO.selectList(sqlSession);
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();
		}finally{
			if(sqlSession!=null) sqlSession.close();
		}		
		log.debug("selectList 리턴 : " + list);
		return list;
	}
}
