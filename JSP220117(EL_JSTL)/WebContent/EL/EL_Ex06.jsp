<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키값 읽기</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>쿠키값 읽기 1</h1>
	<%
		response.addCookie(new Cookie("name","kimc"));
		response.addCookie(new Cookie("name1","kimc"));
		Cookie[] cookies =  request.getCookies();
		if(cookies!=null && cookies.length>0){
			for(Cookie c : cookies){
			out.println(c.getName() + " : " + c.getValue() + "<br>");
			}
		}
		
	%>
	<hr />
	<h1>쿠키값 읽기 2</h1>
	<c:forEach var="c" items="${pageContext.request.cookies }">
		${c.name } : ${c.value} <br />
	</c:forEach>
	<hr />

	<h1>쿠키값 1개씩 읽기</h1>
	${cookie['name']}.name : ${cookie['name']}.value <br />
	${cookie['name1']}.name : ${cookie['name1']}.value <br />
	${cookie.name1}.name : ${cookie.name1}.value <br />
	
	
	
</body>
</html>