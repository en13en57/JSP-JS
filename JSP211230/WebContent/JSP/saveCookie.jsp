<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키를 저장해보자!!!</h1>
	<%
		// 쿠키를 만든다.
		Cookie cookie1 = new Cookie("name",URLEncoder.encode("한사람","UTF-8"));
		cookie1.setMaxAge(60*60*24*7); // 유효기간 지정
		// cookie1.setDomain(".green.co.kr");
		cookie1.setPath("/JSP1230");
		Cookie cookie2 = new Cookie("age",URLEncoder.encode("23","UTF-8"));
		Cookie cookie3 = new Cookie("gender",URLEncoder.encode("여자","UTF-8"));
	
		// 쿠키를 저장한다.
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		response.addCookie(cookie3);
	%>
	
	
	<hr />
	<a href="readCookie.jsp">저장된 쿠키 확인하기</a>
</body>
</html>