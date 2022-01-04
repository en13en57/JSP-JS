<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 개인용 DB사용법
	Connection conn =  null;
	Statement  stmt = null;
	ResultSet  rs = null;
	String driverClass = "org.sqlite.JDBC";
	String url = "jdbc:sqlite:" + application.getRealPath("DB/bible.db");
	String user = "";
	String password = "";
	try{
		Class.forName(driverClass);
		conn = DriverManager.getConnection(url);
		out.println("연결 성공 : " + conn + "<br>");
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from bible");
		if(rs.next()){
			do{
				out.println(rs.getInt("chapter") + "-" + rs.getString("subchap") + ". " );
				out.println(rs.getString("content") + "<br>" );
			}while(rs.next());
		}
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
	}catch(SQLException e){
		;
	}finally{
		try{
			if(rs!=null) rs.close();
		}catch(SQLException e){
			;
		}
		try{
			if(stmt!=null) stmt.close();
		}catch(SQLException e){
			;
		}
		try{
			if(conn!=null) conn.close();
		}catch(SQLException e){
			;
		}
	}
%>