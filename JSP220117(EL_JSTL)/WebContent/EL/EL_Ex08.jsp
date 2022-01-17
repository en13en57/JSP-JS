<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본객체 얻기</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		pageContext.setAttribute("name", "pageContext의 이름");
		request.setAttribute("name", "request의 이름");
		session.setAttribute("name", "session의 이름");
		application.setAttribute("name", "application의 이름");
	
	%>
	URL 절대 경로 : <%=application.getContextPath()%><br />
	접속자 IP : <%=request.getRemoteAddr() %><br />
	<hr />
	URL 절대 경로 : ${pageContext.servletContext.contextPath }<br />
	URL 절대 경로 : ${pageContext.request.contextPath }<br />
	접속자 IP : ${pageContext.request.remoteAddr }<br />
	<hr />
	이름 : ${name } <br /> <%-- 제일 적은 영역의 이름이 출력된다. --%>
	이름 : ${pageScope.name } <br />
	이름 : ${requestScope.name } <br />
	이름 : ${sessionScope.name } <br />
	이름 : ${applicationScope.name } <br />
	
</body>
</html>