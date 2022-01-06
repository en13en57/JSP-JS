<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // 여러개 넘어오는걸 받음
	
	try{
		conn = JDBCUtil.getConnection();
		System.out.println("연결 성공 : " + conn);
		// 이 부분만 변경하여 코딩.
		//------------------------------------------------------------------------------------------------------------
		// 테이블을 만들어보자!!
		// if not exists : 없으면 만들고 있으면 만들지 말아라! Oracle은 지원하지 않는다.
		String sql = "create table if not exists test(idx int primary key auto_increment, name varchar(50) not null)";
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		System.out.println("테이블 생성 완료 : " + result);
		
		// 테이블 목록을 확인해보자!
		sql = "show tables"; 
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			System.out.println("테이블 목록");
			do{
				System.out.println(rs.getString(1));
			}while(rs.next());
		}else{
			System.out.println("테이블 존재X");
		}
		//------------------------------------------------------------------------------------------------------------
	}catch(Exception e){
		System.out.println("연결 실패 : " + e.getMessage());
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
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

</body>
</html>