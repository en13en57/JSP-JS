<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="kr.green.board.mybatis.MybatisApp"%>
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
	out.println("연결 성공 : " + sqlSession);
	sqlSession.close();
	%>
</body>
</html>