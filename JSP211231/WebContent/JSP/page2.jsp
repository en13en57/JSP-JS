<%@page import="kr.green.session.MemberVO"%>
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
	세션에 저장된값 : <%=session.getAttribute("msg") %> <br />
	세션에 저장된값 : ${msg } <br />
	<hr />
	<%
		// 객체를 받으려면 형변환해서 받아야 한다.
		MemberVO vo = (MemberVO)session.getAttribute("vo");
	
	%>
	<h2>표현식으로 출력</h2>
	아이디 : <%=vo.getUserID() %> <br /> 
	이름 :   <%=vo.getUserName() %><br /> 
	비번 :   <%=vo.getPassword() %><br /><hr /> 

	<h2>EL로 출력</h2>
	아이디 : ${vo.userID } <br /> 
	이름 :   ${vo.userName }<br /> 
	비번 :   ${vo.password }<br /><hr /> 
	
	<%
		// 세션 정보를 지워보자
		session.removeAttribute("vo");
	
	
	
	%>	
	
	<a href="page3.jsp">다른 페이지 가기</a>
</body>
</html>