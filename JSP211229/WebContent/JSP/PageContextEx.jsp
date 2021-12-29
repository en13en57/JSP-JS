<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContext 내장 객체</title>
</head>
<body>
	<%
		// 내장 객체를 얻을때 사용한다. 
		// JSP페이지 내에서는 거의 사용할 필요가없다. 
		// EL(표현언어)에는 request객체가 없다. JSP 내장 객체를 사용하려면 pageContext를 이용하여 사용해야 한다.
		ServletRequest req = pageContext.getRequest();
		if(req.equals(request)){
			out.println("같다<br>");
		}else{
			out.println("다르다<br>");
		}
		
		JspWriter out2 = pageContext.getOut();
		out.println("하하하하 출력이 될까요? <br>");
		out.println("하하하하 출력이 될까요? <br>");
	%>
	사용자 IP : <%=request.getRemoteAddr() %> <br />
	사용자 IP : <%=req.getRemoteAddr() %> <br />
	<%-- EL을 이용한 사용자 IP를 출력 --%>
	사용자 IP : ${pageContext.request.remoteAddr } <br />
</body>
</html>