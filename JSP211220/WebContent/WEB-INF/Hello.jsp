<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP(Java Server Page)!!!</h1>
	<hr />
	<h2>현재는 2021년 12월 20일 12시 21분 38초 입니다.</h2>
	<hr />
	<h2>현재는 <%=new Date().toLocaleString() %> 입니다.</h2>
</body>
</html>