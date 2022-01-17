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
	<%-- c:import : 페이지 포함 --%>
	<h1>하하하하하하하하</h1>
	<hr />
	<div>
		<%--
		<c:import url="https://m.naver.com"/>	
		 --%>
		 <c:import url="https://m.search.naver.com/search.naver">
		 	<c:param name="query" value="JSTL"/>
		 </c:import>
	</div>
	<hr />
	<h1>호호호호호호호호</h1>
</body>
</html>