<%@page import="kr.green.session.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//----------------------------------------------------------------
	// 어떤 페이지에서 왔는지를 검사한다.
		String referer = request.getHeader("referer");
		System.out.println(referer);	
	//----------------------------------------------------------------




	// POST 전송이 아니면 폼으로 가라!!
	if(!request.getMethod().equals("POST")){
		// response.sendRedirect("login.jsp");
		response.sendRedirect(referer);
		return;
	}
	// 넘어온값 받기!!!
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");

	// DB에서 읽어서 로그인 처리를 해줘야 하지만 그냥 아이디와 비번이 같으면
	// 로그인 된것으로 하자!!
	if(userid!=null && userid.equals(password)){
		// 로그인된 회원의 모든 정보를 세션에 저장한다.
		MemberVO vo = new MemberVO(userid, password,"관리자"); 
		session.setAttribute("member", vo); // 세션에 저장
		
		out.println("<script>alert('로그인 성공!!!');</script>");
	}else{
		out.println("<script>alert('로그인 실패!!!');</script>");
		out.println("<script>location.href='login.jsp';</script>");
	}
	// 로그인이 되었을때
	response.sendRedirect(referer);
	
%>
