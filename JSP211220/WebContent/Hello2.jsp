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
		// WEB-INF폴더는 URL로는 접근이 불가능 하지만  프로그램 상으로 접근이 가능하다
		pageContext.forward("WEB-INF/View/Hello.jsp");
	%>
</body>
</html>