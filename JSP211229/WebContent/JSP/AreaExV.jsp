<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	// 이렇게 5개 영역에 데이터를 저장할 수 있다.
	String name = "한사람";
	pageContext.setAttribute("name", "두사람(pageContext)");
	request.setAttribute("name", "세사람(request)");
	session.setAttribute("name", "네사람(session)");
	application.setAttribute("name", "오사람(application)");
	
%>

	jspPage : <%=name %> <br />
	<%-- 각각의 영역에 저장된 변수값 읽기 --%>
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