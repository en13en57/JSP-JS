<%@page import="java.util.List"%>
<%@page import="kr.green.category.vo.CategoryVO"%>
<%@page import="kr.green.category.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/> <%-- 한글 깨짐 방지 --%>
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
	<%
		// 나중에 이 부분은 서비스클래스와 DAO클래스로 뺼것이다.
	SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 자동커밋 취소
	try{
		List<CategoryVO> list =  sqlSession.selectList("category.selectSeqList", vo);
		int count = 0;
		int level  = list.get(0).getLev();
		
		for(int i=1;i<list.size();i++){
			if(level>=list.get(i).getLev()) break;
			out.println(list.get(i) + "<br>");
			count++;		
		}
		out.println("나의 자식의 수 : " + count + "개<br>");
		sqlSession.commit();
	}catch(Exception e){
		sqlSession.rollback();
		e.printStackTrace();
	}finally{
		if(sqlSession!=null) sqlSession.close();
	}
	%>
</body>
</html>