<%@page import="kr.green.jdbc.DBCPUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
Statement  stmt = null;
PreparedStatement pstmt = null;
ResultSet  rs = null;

try{
	conn = DBCPUtil.getDBCP();
	System.out.println("연결 성공 : " + conn);
	// 1. 트랜젝션을 처리하기 위해 자동커밋을 취소한다.
	conn.setAutoCommit(false);
	//--------------------------------------------------------------------------------------------------
	// 이부분만 바뀐다.	
	String sql = "select * from test order by idx desc";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table { width: 400px; margin: auto;}
	th { background-color: silver; border: 1px solid gray; padding:5px;}
	td { border: 1px solid gray; padding:5px; text-align: center;}
</style>
</head>
<body>
	<%--
	<h1>연결성공 : <%=conn%></h1>
	--%>
	<table border="1">
		<tr>
			<th width="10%">No</th>
			<th>이름</th>
		</tr>
	<%
	if(rs.next()){
		do{
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getInt("idx"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("name"));
			out.println("</td>");
			out.println("</tr>");
		}while(rs.next());
	}else{
		out.println("<tr><td>데이터가 존재하지 않아요!!</td></tr>");
	}
	%>
	</table>
</body>
</html>
<%
	//--------------------------------------------------------------------------------------------------
	// 2. 모든 명령이 에러가 없이 실행 되었다면 DB에 적용시키자.
	conn.commit();
}catch(Exception e){
	// 3. 여러개 명령어 중에서 1개라도 에러가 발생하면 실행한 명령 모두를 취소하자!!!
	DBCPUtil.rollback(conn);
	System.out.println("연결 실패 : " + e.getMessage());
	e.printStackTrace();
}finally{
	DBCPUtil.close(rs);
	DBCPUtil.close(stmt);
	DBCPUtil.close(pstmt);
	DBCPUtil.close(conn);
}
%>


