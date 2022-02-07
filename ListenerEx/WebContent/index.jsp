<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>리스너 연습</h1>
	<h2>현재 접속자수 : ${applicationScope.count }명</h2>
	
	<%
		session.setAttribute("userid", "admin");	
	
	%>
</body>
</html>