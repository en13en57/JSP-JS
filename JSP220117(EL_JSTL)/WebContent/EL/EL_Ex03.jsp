<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기화 파라메터 모두 읽기</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>초기화 파라메터 모두 읽기 - 예전 방법</h1>
	<%
		Enumeration<String> names = application.getInitParameterNames();
		while(names.hasMoreElements()){
			String name = names.nextElement();
			String value = application.getInitParameter(name);
			out.println(name + " : " + value + "<br>");
		}
	%>
	<hr />
	
	<h1>초기화 파라메터 모두 읽기 - EL을 사용한 방법</h1>
	<%-- pageContext.servletContext == application --%>
	<c:set var="names" value="${pageContext.servletContext.initParameterNames }"/>
	<c:forEach var="name" items="${names }">
		${name } : ${initParam[name] } <br />
	</c:forEach>
	<hr />
	

</body>
</html>