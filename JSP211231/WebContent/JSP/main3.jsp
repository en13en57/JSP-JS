<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>상단</h1>
	
	<a href="main1.jsp">첫번째 메뉴</a>
	<a href="main2.jsp">두번째 메뉴</a>
	<a href="main3.jsp">세번째 메뉴</a>
	<hr />
	<h2>나는 세번째 페이지 입니다.</h2>
	<hr />
	
	<%-- 여기에 로그인 화면이 들어와야 한다. 로그인/로그아웃을 해도 해당페이지에서 이루어져야 한다. --%>
	<%@ include file="login.jsp" %>
	
	
	<hr />
	<h1>하단</h1>
</body>
</html>