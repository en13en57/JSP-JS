<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.green.address.vo.AddressVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	List<AddressVO> list = null;
	try{
		conn = JDBCUtil.getConnection();
		// ----------------------------------------------------------------------
		String sql = "select * from address";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql); 
		if(rs.next()){
	// 데이터가 있다면 리스트 객체를 만든다.
	list = new ArrayList<>();
	do{
		// 레코드 1개당 VO객체 1개
		AddressVO vo = new AddressVO();
		vo.setIdx(rs.getInt("idx"));
		vo.setName(rs.getString("name"));
		vo.setBirth(rs.getDate("birth"));
		vo.setPhone(rs.getString("phone"));
		// 리스트에 vo를 넣는다.
		list.add(vo);
	}while(rs.next());
		}
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
	<h1>Address테이블의 내용</h1>
	<% 
		if(list==null){
			out.println("데이터 없다");
		}else{
			for(AddressVO vo : list){
				out.println(vo + "<br>");
			}
		}
	%>
	<hr />
	<button onclick="location.href='insertForm.jsp'">데이터 입력하기</button>
</body>
</html>