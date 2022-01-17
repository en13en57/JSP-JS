<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라메터 읽기</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h2>주소표시줄 뒤에 ?a=1&a=2&a=3&b=4&c=5를 붙여서 실행하시오</h2>
	<hr />
	<h1>파라메터읽기 1</h1>
	a:
	<%
		String[] a = request.getParameterValues("a");
		if(a!=null && a.length>0){
			for(String t : a){
				out.print(t+" ");
			}
		}
		out.print("<br>");
		out.println("b : " + request.getParameter("b") + "<br>");
		out.println("c : " + request.getParameter("c") + "<br>");
	%>
	<hr />
	<h1>파라메터 읽기 2</h1>
	a :
	<c:forEach var="t" items="${paramValues.a }"> 
		${t }	
	</c:forEach>
	<br />
	b : ${param.b } <br />
	c : ${param.c } <br />
	<hr />
	a : ${paramValues['a'][0] } ${paramValues['a'][1] } ${paramValues['a'][2] }<br />
	b : ${param['b'] } <br />
	c : ${param['c'] } <br />
	<hr />
	
</body>
</html>