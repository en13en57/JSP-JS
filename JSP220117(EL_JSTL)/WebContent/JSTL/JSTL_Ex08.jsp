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
	<%-- c:catch : 예외처리 --%>
	<c:catch var="e">
		<%=10/0 %>
	</c:catch>
	<%-- 조건문과 같이해야 에러 처리가 완벽하다 --%>
	<c:if test="${not empty e }">
		에러 발생 : ${e } <br />
		에러 메세지 : ${e.message } <br />
	</c:if>
</body>
</html>