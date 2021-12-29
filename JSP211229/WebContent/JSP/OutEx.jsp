<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Out 내장객체</title>
</head>
<body>
	<h1>Out 내장객체는 주로 화면에 출력할 때 사용</h1>
	<%
		// 점수를 받아 60점이상 합격 미만 불합격을 출력하고싶다.
		int score = 0;
		try{
			score = Integer.parseInt(request.getParameter("score"));
		}catch(Exception e){
			;	
		}
	%>
	<%-- 지금까지는 아래처럼 했다... --%>
	<% if(score>=60){ %>
		<%=score %>점으로 합격<br />
	<% }else{ %>
		<%=score %>점으로 불합격<br />
	<% } %>
	
	<%-- 이때 out내장 객체를 사용하면 조금 편리해진다. --%>
	<%
		if(score>=60){
			out.println(score+"점으로 합격<br>");			
		}else{
			out.println(score+"점으로 불합격<br>");			
		}
	%>
</body>
</html>