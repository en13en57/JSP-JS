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
<title>EL에서 Set 사용</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		Set<String> set = new HashSet<String>(Arrays.asList("한놈, 두식이, 석삼, 너구리, 오징어".split(",")));
		request.setAttribute("set", set);
	%>
	<h1>EL로 Set 출력</h1>
	${set } <br />
	크기 : ${fn:length(set) }개
	<hr />
	<c:forEach var="name" items="${set }">
		${name } <br />
	</c:forEach>
</body>
</html>