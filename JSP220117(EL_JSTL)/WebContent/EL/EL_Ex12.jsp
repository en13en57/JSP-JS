<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashSet"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 List 사용</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		List<String> list = Arrays.asList("한놈, 두식이, 석삼, 너구리, 오징어".split(","));
		request.setAttribute("list", list);
	%>
	<h1>EL로 List 출력</h1>
	${list } <br />
	크기 : ${fn:length(list) }개
	<hr />
	<c:forEach var="name" items="${list }">
		${name } <br />
	</c:forEach>
	<hr />
	<c:forEach var="i" begin="0" end="${fn:length(list)-1 }">
		list.get(${i }) : ${list[i] }<br />
	</c:forEach>
</body>
</html>