<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
		// 모든 값을 맵으로 받아보자
		Map<String,String[]> map = request.getParameterMap();
		for(String key : map.keySet()){
			out.println(key + " : ");
			String[] values = map.get(key);
			if(values!=null && values.length>0){
				for(String value : values)
					out.println(value + " ");
				out.println("<br/>");
			}
		}
		
	%>
</body>
</html>