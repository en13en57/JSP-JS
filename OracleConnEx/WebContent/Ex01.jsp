<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String username = "hr";
	String password = "123456";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, username, password);
	out.println("연결 성공 : " + conn + "<br>");
	conn.close();
%>
	
</body>
</html>