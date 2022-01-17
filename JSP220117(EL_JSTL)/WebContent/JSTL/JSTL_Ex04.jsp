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
	<%-- c:remove : 변수 제거 --%>
	<c:set var="i" value="100"></c:set>
	<c:set var="i" value="200" scope="request"></c:set>
	<c:set var="i" value="300" scope="session"></c:set>
	
	I = ${i } <br />
	request I = ${requestScope.i } <br />
	session I = ${sessionScope.i } <br /><hr />
	
	<c:remove var="i" scope="request"/> <%-- request 영역의 변수 i삭제 --%>
	I = ${i } <br />
	request I = ${requestScope.i } <br />
	session I = ${sessionScope.i } <br /><hr />

	<c:remove var="i"/> <%-- 변수 i삭제 --%>
	I = ${i } <br />
	request I = ${requestScope.i } <br />
	session I = ${sessionScope.i } <br /><hr />
</body>
</html>