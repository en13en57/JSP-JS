<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// POST 전송이 아니면 폼으로 가라!!
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("login.jsp");
		return;
	}
	// 넘어온값 받기!!!
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String saveid = request.getParameter("saveid");

	// DB에서 읽어서 로그인 처리를 해줘야 하지만 그냥 아이디와 비번이 같으면
	// 로그인 된것으로 하자!!
	if(userid!=null && userid.equals(password)){
		session.setAttribute("userid", userid); // 세션에 저장
		out.println("<script>alert('로그인 성공!!!');</script>");
		// 아이디 자동저장 처리
		if(saveid!=null && saveid.equals("1")){ // 아이디를 쿠키에 저장해라
			Cookie cookie = new Cookie("userid", userid);
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}else{ // 쿠키를 지워라!!
			Cookie cookie = new Cookie("userid", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		response.sendRedirect("main.jsp");
	}else{
		out.println("<script>alert('로그인 실패!!!');</script>");
		out.println("<script>location.href='login.jsp';</script>");
		return;
	}
%>
