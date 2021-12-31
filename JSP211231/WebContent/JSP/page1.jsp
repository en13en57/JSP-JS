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
	<%
		// 세션에 값을 저장해보자
		session.setAttribute("msg", "저장이 되었을까?");
		
		// 객체를 만들어 저장하면 편리하다.
		MemberVO vo = new MemberVO("admin", "1234", "최고관리자");
		session.setAttribute("vo", vo);
		
	%>
	
	<a href="page2.jsp">다른페이지 가기!</a>
</body>
</html>