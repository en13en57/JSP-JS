<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기화 파라메터 읽기</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>초기화 파라메터 읽기 - 예전 방법</h1>
	<%
		String dbUser = application.getInitParameter("dbUser");
		String dbPassword = application.getInitParameter("dbPassword");
	%>
	DB 사용자 : <%=dbUser %> <br />
	DB 비밀번호 : <%=dbPassword %> <br />
	<hr />
		
	<h1>초기화 파라메터 읽기 - EL을 사용한 방법</h1>
	DB 사용자 : ${initParam.dbUser } <br />
	DB 비밀번호 : ${initParam.dbPassword } <br />
	<hr />
	<h1>초기화 파라메터 읽기 - EL/JSTL을 사용한 방법</h1>
	<%-- 변수를 선언하고 값을 넣는다 : JSTL을 사용하려면 상단에 taglib디렉티브를 추가해야한다. --%>
	<c:set var="user" value="${initParam.dbUser }"/>
	<c:set var="password" value="${initParam.dbPassword }"/>
	DB 사용자 : ${user } <br />
	DB 비밀번호 : ${password } <br />
	<br />
		
</body>
</html>