<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL(JSP Standard Tag Library)</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>JSTL(JSP Standard Tag Library)</h1>
	<%-- 변수의 선언 --%>
	<%
		int i = 100;
		request.setAttribute("i", i); // 영역에 저장해야만 EL로 출력 가능하다
	%>
	i = ${i }  <br />
	<c:set var = "j" value = "100"/> <%-- 기본적으로 page 영역에 저장된다. --%>
	j = ${j } <br />
	<c:set var = "j" value = "123" scope="session"/> <%-- 기본적으로 [age 영역에 저장된다. --%>
	j = ${j } <br />
	j = ${sessionScope.j } <br />

</body>
</html>