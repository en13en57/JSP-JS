<%@page import="java.util.Locale"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<%-- timeZone : 시간대 변경 --%>
	<jsp:useBean id="date" class="java.util.Date"/>
	<c:set var="num" value="123456789.6789"/>
	
	<fmt:formatDate value="${date }" type="date" dateStyle="full"/><br />
	<fmt:formatDate value="${date }" type="time" dateStyle="full"/><br />
	<hr />		
	<%-- fmt:timeZone : 태그 안에서만 유효 --%>
	<%-- fmt:setTimeZone : 선언 이후 유효 --%>
	<fmt:timeZone value="America/New_York">
		<fmt:formatDate value="${date }" type="date" dateStyle="full"/><br />
		<fmt:formatDate value="${date }" type="time" dateStyle="full"/><br />
		<hr />
	</fmt:timeZone>

	<fmt:timeZone value="Asia/Hong_Kong">
		<fmt:formatDate value="${date }" type="date" dateStyle="full"/><br />
		<fmt:formatDate value="${date }" type="time" dateStyle="full"/><br />
	</fmt:timeZone>
	
	
</body>
</html>