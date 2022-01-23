<%@page import="kr.green.memo.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ibatis.common.resources.Resources"%>
<%@page import="java.io.InputStream"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession();
		
		out.println("연결성공 : " + sqlSession + "<br>");
		out.println("마리아날짜 : " + sqlSession.selectOne("test.now") + "<br>");
		
		sqlSession.close();
	%>
</body>
</html>