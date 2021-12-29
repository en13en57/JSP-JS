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
	pageContext.setAttribute("name", "두사람(pageContext)"); // 현재 페이지에서만 유효
	request.setAttribute("name", "세사람(request)"); // request영역에서 유효
	session.setAttribute("name", "네사람(session)"); // 브라우별로 유효
	application.setAttribute("name", "오사람(application)"); // 애플리케이션 전체 영역에 유효
	
	pageContext.forward("view.jsp"); // 현재의 데이터를 가지고 view.jsp페이지로 가라 
	// ==> 두개의 파일은 request영역을 공유한다. 
%>
	
</body>
</html>