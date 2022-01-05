<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int totalCount = 0;
	int sum = 0;
	try{
		conn = JDBCUtil.getConnection();
		// ----------------------------------------------------------------------
		String sql = "select count(*), sum(salary) from hr_employees";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql); 
		// 왜? if문을 안쓸까요?
		// 개수를 셀 경우 무조건 1개가 존재한다. 그러므로 없는 경우는 없다.
		// 그래서 if를 쓰지 않아도 에러가 발생할 소지가 없다.
		rs.next();
		totalCount = rs.getInt(1); // 필드명이 없으면 순서를 1부터 지정하여 읽기
		sum = rs.getInt(2);
		// ----------------------------------------------------------------------
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
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
	<h2>hr_employees 테이블의 레코드 수 : <%=totalCount %>개</h2>
	<h2>hr_employees 연봉 합계 <%=sum %>달러</h2>
</body>
</html>