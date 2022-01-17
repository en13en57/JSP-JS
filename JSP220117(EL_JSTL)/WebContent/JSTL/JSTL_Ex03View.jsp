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
	<%-- 자바코드와 출력코드를 분리하는 방법 --%>
	<%-- 자바코드 하나도 없이 출력만 담당하게 한다. --%>
	<c:forEach var="name" items="${ar }">
		${name } <br />
	</c:forEach>

</body>
</html>