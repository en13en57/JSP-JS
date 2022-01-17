<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		for(int i=1; i<10; i++){
			out.println("[<a href='?p=" + i + "&s=" + pageSize + "&b=" + blockSize + "'>" + i + "</a>]");
		}
	%>
	<br />
	<hr />
	현재 페이지 : ${p } <br />
	페이지 사이즈: ${s } <br />
	블록 사이즈 : ${b } <br />
	
	<c:forEach var="i" begin="11" end="20">
		[<a href="#" onclick="sendPost('?',{'p':${i},'s':${s },'b':${b }})">${i }</a>]
	</c:forEach>
	
</body>
</html>