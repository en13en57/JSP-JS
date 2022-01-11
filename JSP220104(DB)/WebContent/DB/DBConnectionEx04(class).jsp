<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. 준비
	Connection conn =  null; // 연결 객체
	Statement  stmt = null;  // 명령 객체
	ResultSet  rs = null; 	 // 결과 객체
	String className = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/javadb";
	String user = "javauser";
	String password = "123456";
	try{
		// 3. 연결한다.
		conn = JDBCUtil.getConnection(className, url, user, password);
		out.println("연결 성공 : " + conn + "<br>");
		// 4. 사용한다
		stmt = conn.createStatement();
		
		// 저장하자 : select 이외의 명령은 executeUpdate로 실행하고 int로 받는다.
		int count = stmt.executeUpdate("insert into address values(0, '육사람', '1999-08-01', '010-2345-6789');");
		out.println(count + "개 저장 완료<br>");
	
		// 읽어보자 : select 명령만 executeQuery로 실행하고 ResultSet으로 받는다.
		rs = stmt.executeQuery("select * from address order by name desc");
		if(rs.next()){
	do{                // 타입에 맞추어서
		out.println(rs.getString("name") + ". " + rs.getString("phone") + "<br>");
	}while(rs.next());
		}else{
	out.println("데이터 없다 <br>");
		}
		
		// 삭제해보자
		count = stmt.executeUpdate("delete from address where name='육사람'");
		out.println(count + "개 삭제 완료<br>");
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
		// 5. 닫는다
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		JDBCUtil.close(conn);
	}
%>