<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배열의 사용</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		int[] ar = {11,22,33,44,55,66};
		request.setAttribute("ar", ar);
	%>
	<h1>EL로 배열 출력</h1>
	${ar[0] } ${ar[1] } <br />
	배열의 크기 : ${fn: length(ar)} <br />
 	<hr />
	<c:forEach var="i" items="${ar }">
		${i } <br />
	</c:forEach>
	<hr />
	<c:forEach var="i" begin="0" end="${fn: length(ar)-1}">
		ar[${i }] = ${ar[i] } <br />
	</c:forEach>
	<hr />
	<c:forEach var="i" begin="0" end="${fn: length(ar)-1}" step="2">
		ar[${i }] = ${ar[i] } <br />
	</c:forEach>
	<hr />
</body>
</html>