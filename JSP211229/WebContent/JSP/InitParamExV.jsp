<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 내장객체</title>
<%
	// web.xml에 설정한 초기화 파라메터들을 읽어보자
	String dbUser = application.getInitParameter("dbUser");
	String dbPassword = application.getInitParameter("dbPassword");
	String dbName = application.getInitParameter("db");

	out. println("데이터베이스 이름 : " + dbName + "<br>");
	out. println("데이터베이스 사용자 아아디 : " + dbUser + "<br>");
	out. println("데이터베이스 사용자 비밀번호 : " + dbPassword + "<br><hr>");
	
	// 1번에 읽기
	Enumeration<String> names = application.getInitParameterNames();
	while(names.hasMoreElements()){
		String name = names.nextElement();
		out.println(name + " : " + application.getInitParameter(name) + "<br>");
	}
%>
<hr />
서버 절대경로 : <%=application.getRealPath("") %> <br />
서버 절대경로 : <%=application.getRealPath("/") %> <br />
서버 절대경로 : <%=application.getRealPath(".") %> <br />
서버 절대경로 : <%=application.getRealPath("data/data.json") %> <br />
</head>
<body>

</body>
</html>