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
	<%-- 변수의 선언--%>
	<c:set var="i" value="0"/> <%--i=0;과 같다. --%>
	<c:forEach var="i" begin="1" end="100">		<%-- for(int i=1;i<100;i++){ --%>
		<c:set var="sum" value="${sum + i }"/>  <%-- sum += i; --%>
	</c:forEach>								<%-- } --%>
	1 ~ 100 까지의 합 : ${sum } <br />
</body>
</html>