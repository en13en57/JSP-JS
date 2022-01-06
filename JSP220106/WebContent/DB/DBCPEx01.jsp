<%@page import="kr.green.jdbc.DBCPUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Connection Pool에서 연결자원을 얻어온다.
Context initContext = new InitialContext();
Context envContext  = (Context)initContext.lookup("java:/comp/env");
DataSource ds = (DataSource)envContext.lookup("jdbc/MariaDB");
Connection conn = ds.getConnection();
%>
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
	<h1>연결성공 : <%=conn%></h1>
	<% DBCPUtil.close(conn); // 자원을 Connection Pool로 반환한다. %>
</body>
</html>

