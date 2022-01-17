<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더값 모두 읽기</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>헤더값 모두 읽기 1</h1>
	<%
		Enumeration<String> headerNames =  request.getHeaderNames();
		while(headerNames.hasMoreElements()){
			String name = headerNames.nextElement();
			String value = request.getHeader(name);
			out.println(name + " : " + value + "<br>");
		}
	%>
	<hr />
	<h1>헤더값 모두 읽기 2</h1>
	<c:set var="names" value="${pageContext.request.headerNames }"/>
	<c:forEach var="name" items="${names }">
		${name } : ${header[name] } <br />
	</c:forEach>
	<hr />
</body>
</html>