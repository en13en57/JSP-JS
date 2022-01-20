<%@page import="kr.green.board.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
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
	<%
		SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession();
		out.println("오라클 마이바티스 연동 : " + sqlSession + "<br>");
		out.println("오라클 날짜: " + sqlSession.selectOne("test.now") + "<br>");
		sqlSession.close();
	%>
</body>
</html>