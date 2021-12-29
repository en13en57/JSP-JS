<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	jspPage : <%=name %> <br />
	name변수는 선언되지 않았으므로 사용 할 수 없다.
	 --%>
	pageContext영역의 Name : <%=pageContext.getAttribute("name") %> <br /> 
	request영역의 Name : <%=request.getAttribute("name") %> <br />
	session영역의 Name : <%=session.getAttribute("name") %> <br />
	application영역의 Name : <%=application.getAttribute("name") %> <br />
	<hr />
	EL로 출력 : ${name } <br /> <%-- 제일작은영역의 pageContext값이 나온다.(두사람) --%>
	pageContext영역의 Name : ${pageScope.name} <br />
	request영역의 Name : ${requestScope.name } <br />
	session영역의 Name : ${sessionScope.name} <br />
	application영역의 Name : ${applicationScope.name} <br />
</body>
</html>