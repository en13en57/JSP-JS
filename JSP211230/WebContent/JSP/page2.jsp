<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#top 	{ width: 100%; height: 100px; background-color: silver;}
	#left 	{ width: 30%; height: 600px; float: left; background-color: skyblue;}
	#main 	{ width: 70%; height: 600px;}
	#bottom { width: 100%; height: 100px;clear: both; background-color: pink;}
</style>
</head>
<body>
	<div id="top">
		<%-- jsp:innclude : 실행결과가 포함된다. --%>
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id="left">
		<% 
			// jsp 액션태그 내에서 자바코드를 쓰면 에러이다!!!!
			// 한글이나 특수 문자를 보낼때는 인코딩해서 보내라!!!!
			String menu1 = "main2-submemu1"+ URLEncoder.encode("한글","UTF-8");
			pageContext.setAttribute("menu1", menu1);
			String menu2 = "main2-submemu2"+ URLEncoder.encode("하하하","UTF-8");
			pageContext.setAttribute("menu2", menu2);
		%>
		<jsp:include page="left.jsp">
			<jsp:param value="${menu1}" name="menu"/>
			<jsp:param value="${menu2 }" name="menu"/>
		</jsp:include>
	</div>
	<div id="main">
		하하하하하 나는 2페이지!!!
	</div>
	<div id="bottom">
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
</html>