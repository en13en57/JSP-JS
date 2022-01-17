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
	<%-- 날짜를 원하는 형식으로 축력하기 --%>
	<jsp:useBean id="today" class="java.util.Date"/>
	
	${today } <hr />
	<fmt:formatDate value="${today }"/> <hr />
	<br />
	<fmt:formatDate value="${today }" type="date"/> <hr />
	<fmt:formatDate value="${today }" type="time"/> <hr />
	<fmt:formatDate value="${today }" type="both"/> <hr />
	<br />
	<fmt:formatDate value="${today }" type="date" dateStyle="full"/> <hr />
	<fmt:formatDate value="${today }" type="date" dateStyle="long"/> <hr />
	<fmt:formatDate value="${today }" type="date" dateStyle="medium"/> <hr />
	<fmt:formatDate value="${today }" type="date" dateStyle="short"/> <hr />
	<br />
	<fmt:formatDate value="${today }" type="time" timeStyle="full"/> <hr />
	<fmt:formatDate value="${today }" type="time" timeStyle="long"/> <hr />
	<fmt:formatDate value="${today }" type="time" timeStyle="medium"/> <hr />
	<fmt:formatDate value="${today }" type="time" timeStyle="short"/> <hr />
	<br />
	<fmt:formatDate value="${today }" type="both" dateStyle="short" timeStyle="short"/> <hr />
	<br />
	<%-- 사용자가 지정한 형식으로 --%>
	<fmt:formatDate value="${today }" pattern="MM-dd(E) hh:mm:ss"/>
	<br />
	<%-- 변수에 저장 --%>
	<fmt:formatDate var="date" value="${today }" pattern="MM-dd(E) hh:mm:ss"/>
	${date }
	
</body>
</html>