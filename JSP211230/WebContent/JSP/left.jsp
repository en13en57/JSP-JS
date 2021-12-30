<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나는 왼쪽
	<hr />
	<%
		request.setCharacterEncoding("UTF-8");
		String[] menu = request.getParameterValues("menu");
		if(menu!=null && menu.length>0){
			for(String m : menu){
				out.println("<a href='#'>" + URLDecoder.decode(m,"UTF-8") + "</a><br>");
			}
		}
	%>
</body>
</html>