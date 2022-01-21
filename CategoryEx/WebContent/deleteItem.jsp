<%@page import="java.util.HashMap"%>
<%@page import="kr.green.category.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.green.category.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/> <%-- 한글 깨짐 방지 --%>
<c:if test="${pageContext.request.method != 'POST' }"> <%-- POST전송만 처리 --%>
	<c:redirect url="listTest.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 데이터 받기 --%>
	<jsp:useBean id="vo" class="kr.green.category.vo.CategoryVO"/>
	<jsp:setProperty property="*" name="vo"/>
	${vo } <br />
	<%
		// 나중에 이 부분은 서비스 클래스와 DAO 클래스로 나뉨	
	SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 오토커밋 취소
	try{
		// 나의 자식이 있으면 "삭제" 표시를 하고
		// 나의 자식이 없으면 DB에서 삭제한다.
		// ---> 나의 자식 개수를 알아내는 쿼리가 필요하다
		
		// 해당 글 번호의 글을 가져온다.
		vo = sqlSession.selectOne("category.selectByIdx",vo.getIdx());
		
		List<CategoryVO> list = sqlSession.selectList("category.selectSeqList",vo); // 항목 수정
		int childcount=0;
		if(list != null){
			
		int level=list.get(0).getLev();
		for(int i=1;i<list.size();i++){
			if(level>=list.get(i).getLev()) break;
			out.println(list.get(i) + "<br>");
			childcount++;			
		}
		
		if(childcount==0){ // 자식이 없다면 그냥 지운다
			sqlSession.delete("category.delete",vo); // 항목 삭제
		}else{ // 나의 자식이 있으면 "삭제"표시를 하고
			vo.setDel("N");
			sqlSession.update("category.updateDel",vo);
		}
		
		// 전체 레코드를 돌면서 해야 한다.
		// del값이 'N'이면서 자식이 없는 항목은 완전 삭제 하는 코드를 추가해주어야한다.
		// 정리가 된다.
		
		
		
	}
		sqlSession.commit();
	}catch(Exception e){
		sqlSession.rollback();
		e.printStackTrace();
	}finally{
		if(sqlSession!=null) sqlSession.close();
	}
	
	// 목록으로 다시 가기
	response.sendRedirect("listTest.jsp");
	
	%>
</body>
</html>