<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement  stmt = null;
	PreparedStatement pstmt = null;
	ResultSet  rs = null;
	
	try{
		conn = JDBCUtil.getConnection();
		System.out.println("연결 성공 : " + conn);
		//--------------------------------------------------------------------------------------------------
		// 이 부분만 변경하여 코딩을 하면된다. 나중에는 이부분을 짜증나니까 클래스로 뺀다!!!!

		//--------------------------------------------------------------------------------------------------
	}catch(Exception e){
		System.out.println("연결 실패 : " + e.getMessage());
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		JDBCUtil.close(pstmt);
		JDBCUtil.close(conn);
	}
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

</body>
</html>