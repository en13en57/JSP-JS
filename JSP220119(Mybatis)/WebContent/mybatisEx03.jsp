<%@page import="kr.green.mybatis.service.TestService"%>
<%@page import="kr.green.mybatis.vo.TestVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="kr.green.mybatis.jdbc.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<%
			request.setAttribute("today", TestService.getInstance().selectToday());
			request.setAttribute("result", TestService.getInstance().selectCalc(1, 2, 3));
			request.setAttribute("vo", TestService.getInstance().selectVO(11, 22, 33));
			request.setAttribute("map2", TestService.getInstance().selectMap(9, 8, 7));
	%>
	DB의 날짜 : <fmt:formatDate value="${today }" pattern="yyy-MM-dd hh:mm:ss"/> <br />
	계산 결과 : ${result } <br />
	VO결과    : ${vo } <br />
	map 결과  : ${map2 } <br />
	<hr />
	today : <fmt:formatDate value="${vo.today }" pattern="yy-MM-dd hh:mm:ss"/> <br />
	계산  : ${vo.result } <br />
	<hr />
	today : <fmt:formatDate value="${map2.today }" pattern="yy-MM-dd hh:mm:ss"/> <br />
	계산  : ${map2.result } <br />
	
	
</body>
</html>