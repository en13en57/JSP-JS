<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid")!=null){ // 로그인이 되어 있다면
		session.removeAttribute("userid"); // 세션에 저장된 아이디를 지우고 
	}
	response.sendRedirect("login.jsp"); // 로그인페이지로 간다.
%>