<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>저장된 모든 쿠키를 읽어 보자!!!</h1>
	<%
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null && cookies.length>0){
			for(Cookie cookie :cookies){
				out.println(cookie.getName() + " : " 
			                + URLDecoder.decode(cookie.getValue(), "UTF-8") + " : " 
						    + cookie.getPath() 
						    + cookie.getMaxAge() + "<br>");
			}
		}
	
	%>
</body>
</html>