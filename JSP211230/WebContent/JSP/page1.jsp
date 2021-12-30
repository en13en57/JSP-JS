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
		<jsp:include page="left.jsp">
			<jsp:param value="main1-submemu1" name="menu"/>
			<jsp:param value="main1-submemu2" name="menu"/>
			<jsp:param value="main1-submemu3" name="menu"/>
		</jsp:include>
	</div>
	<div id="main">
		<jsp:include page="main1.jsp"></jsp:include>
	</div>
	<div id="bottom">
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
</html>