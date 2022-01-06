<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="kr.green.address.vo.AddressVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
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
		PreparedStatement  stmt = null;
		try{
			conn = JDBCUtil.getConnection();
			// --------------------------------------------------------------------------
			// 저장을 처리한다.
			String sql = "insert into address (name,birth,phone) values(?,?,?)";
			// PreparedStatement객체를 만들때 미완성 sql문을 넘겨서 만든다. 바뀌는 부분을 ?로 표시
			stmt = conn.prepareStatement(sql); 
			// ? 자리에 값을 채워 sql문을 완성한다.
			stmt.setString(1, vo.getName());
			stmt.setString(2, sdf.format(vo.getBirth()));
			stmt.setString(3, vo.getPhone());
			// 완성된 명령어를 실행한다.
			int count = stmt.executeUpdate();
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