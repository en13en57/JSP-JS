<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="false"%>
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
	<%
		// 헤더에 값을 추가해보자!!!
		response.addHeader("name", "kimc");
		response.addIntHeader("age", 34);
		response.addDateHeader("regDate", new Date().getTime());
	%>

	<h1>모든 Header값을 읽어서 출력해 보자!!!</h1>
	<%
		// 모든 헤더의 이름을 알아낸다.
		Enumeration<String> headerNames = request.getHeaderNames();
	
		while(headerNames.hasMoreElements()){
			// 이름 얻기
			String headerName = headerNames.nextElement();
			out.println(headerName + " : ");
			// 헤더의 값을 알아내자!!!
			Enumeration<String> values = request.getHeaders(headerName);
			while(values.hasMoreElements()){
				String value = values.nextElement();				
				out.println(value);
				out.println("<br>");
			}
			out.println("<br><hr>");
		}
		
	%>
	<h1>개별적으로 하나씩 읽어보자</h1>
	ua-cpu : <%=request.getHeader("ua-cpu") %> <br />
	user-agent : <%=request.getHeader("user-agent") %> <br />
	name : <%=request.getHeader("name") %> <br />
	age : <%=request.getIntHeader("age") %> <br />
</body>
</html>