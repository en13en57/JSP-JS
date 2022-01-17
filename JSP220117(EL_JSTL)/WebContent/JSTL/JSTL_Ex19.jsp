<%@page import="java.util.TimeZone"%>
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
	<%-- setTimeZone : 시간대 변경 --%>
	<jsp:useBean id="date" class="java.util.Date"/>
	<c:set var="tz" value="<%=TimeZone.getAvailableIDs() %>"/>
	<c:forEach var="t" items="${tz }">
		<fmt:setTimeZone value="${t }"/>
		<h2>${t }</h2>
		<fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/><br />
	</c:forEach>	
</body>
</html>