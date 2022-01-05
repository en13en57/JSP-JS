<%@page import="java.util.Date"%>
<%@page import="kr.green.address.vo.AddressVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 데이터 받고
	<jsp:useBean id="vo" class="kr.green.address.vo.AddressVO"/>
	<jsp:setProperty property="*" name="vo"/>
	Date타입 때문에 jsp:useBean으로 못 받았다.
	 --%>
	<%
	AddressVO vo = new AddressVO();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	vo.setName(request.getParameter("name"));
	// 문자로 받아 날짜로 변환하여 VO에 넣기
	String t = request.getParameter("birth");
	Date birth = sdf.parse(t);
	vo.setBirth(birth);
	vo.setPhone(request.getParameter("phone"));		
	
	// 여기에서 DB에 저장하고
	Connection conn = null;
	Statement  stmt = null;
	try{
		conn = JDBCUtil.getConnection();
		// --------------------------------------------------------------------------
		// 저장을 처리한다.
		String sql = "insert into address (name,birth,phone) values(";
		sql += "'" + vo.getName() + "',";
		sql += "'" + sdf.format(vo.getBirth()) + "',";
		sql += "'" + vo.getPhone() + "'";
		sql += ")";
		System.out.println(sql);
		stmt = conn.createStatement();
		int count = stmt.executeUpdate(sql);
		System.out.println(count + "개 저장 완료!!!");
		// --------------------------------------------------------------------------
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(stmt);
		JDBCUtil.close(conn);
	}		
	// 리스트로 간다.
	response.sendRedirect("addressList.jsp");
	%>
</body>
</html>