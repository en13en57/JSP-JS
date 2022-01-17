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
	<%-- c:url : url 주소를 만들어 준다. --%>
	<h1>하하하하하하하하</h1>
	<hr />
	<div>
		<c:url var="url" value="https://m.search.naver.com/search.naver">
			<c:param name="query" value="JSTL"></c:param>
			<c:param name="query" value="한글"></c:param>
		</c:url>
		${url }
		<hr />
		<c:import url="${url }"/>
	</div>
	<hr />
	<h1>호호호호호호호호</h1>
</body>
</html>