<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>나는 <%=request.getRequestURL() %>입니다.</h1>
	<%
		// from에서 만든 데이터를 to에서 사용하려면 어떻게 해야할까?
		// request 영역에 저장만 하면된다.
		request.setAttribute("name", "한사람");
		request.setAttribute("age", 33);
		request.setAttribute("gender", "남");
	
	%>
	
	<jsp:forward page="to.jsp"/>
	
	<%
		// 포워드를 하면 주소가 변하지 않은 상태로 페이지가 이동된다. 같은 request영역이다.
		// JSP에서 포워드 시키는 3가지 방법
		// 1. jsp:forward 태그를 사용한다. 					  ==> 태그내에서 이동시
		// 2. pageContext.forward(이동 할 주소); 를 사용한다. ==> jsp파일이 코드내에서 이동시
		// 3. RequestDispatcher를 이용한 방법 				  ==> 서블릿에서 이동시
		//	  RequestDispatcher dispatcher = request.getRequestDispatcher("이동할 주소");
		//	  dispatcher.forward(request, response);
	%>
</body>
</html>