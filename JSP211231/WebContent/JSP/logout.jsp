<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//----------------------------------------------------------------
	// 어떤 페이지에서 왔는지를 검사한다.
		String referer = request.getHeader("referer");
		System.out.println(referer);	
	//----------------------------------------------------------------
		
	session.removeAttribute("member"); // 세션에 저장된 회원정보를 지우고 
	
	response.sendRedirect(referer); // 이전페이지로 간다.
%>