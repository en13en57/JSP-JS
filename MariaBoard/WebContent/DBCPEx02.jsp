<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
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
		Connection conn = JDBCUtil.getConnection();
			//out.println("연결 성공 : " + conn);
			conn.close();
	%>
</body>
</html>