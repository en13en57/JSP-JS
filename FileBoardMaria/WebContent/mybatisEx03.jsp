<%@page import="java.util.Date"%>
<%@page import="kr.green.file.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession();
	out.println("연결 성공 : " + sqlSession + "<br>");
	Date date = sqlSession.selectOne("test.now");
	request.setAttribute("now", date);
	sqlSession.close();
	%>
	<h1>DB날짜 : <fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일(E요일) hh:mm:ss"/> </h1>
</body>
</html>