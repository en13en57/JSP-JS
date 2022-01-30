<%@page import="java.util.Date"%>
<%@page import="kr.green.file.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.io.InputStream"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession();
out.println("연결성공" + sqlSession);
Date date = sqlSession.selectOne("test.now");
request.setAttribute("now", date);
sqlSession.close();
%>
	<h1>db 날짜 : <fmt:formatDate value="${now }" pattern="yyyy-MM-dd일"/> </h1>
</body>
</html>