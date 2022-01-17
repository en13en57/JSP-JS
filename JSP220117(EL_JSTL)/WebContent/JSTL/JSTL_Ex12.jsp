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
	<%-- c:out : 값을 인코딩해서 출력해준다. --%>
	<%
		String str1 = "나의 이름은 <h1>한사람</h1>입니다.";
		request.setAttribute("m1", str1);
	%>
	<%=str1 %> <hr />
	<%
		String str2 = str1.replaceAll("<", "lt");
		out.println(str2 + "<hr>");
	%>
	${m1 } <hr />
	<c:out value="${m1 }"></c:out>
	<hr />
	<c:out value="${m1 }" escapeXml="true"></c:out>
	<hr />
	<c:out value="${m1 }" escapeXml="false"></c:out>
	<hr />
</body>
</html>