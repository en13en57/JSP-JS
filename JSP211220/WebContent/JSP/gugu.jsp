<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	<%
		int dan = 5;
	
		try{
		dan = Integer.parseInt(request.getParameter("dan"));
		}catch(Exception e){
			;
		}
		out.println("<h2>" + dan + "단</h2>");
		for(int i=1;i<=9;i++){
			out.println(dan + " * " + i + " = " + (i*dan) + "<br>" ); 
		}
	%>
</body>
</html>