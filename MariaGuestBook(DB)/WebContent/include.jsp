<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 모든 페이지 상단에 공통으로 들어가는 코드는 별도로 만들어서 포함하면 편리하다.
	request.setCharacterEncoding("UTF-8");
	// 페이지 번호 받기/페이지 사이즈 받기/블록사이즈 받기/글번호 받기/모드(저장/수정/삭제 구분) 받기
	
	// 페이지 번호 받기
	int currentPage = 1;
	try{
		currentPage = Integer.parseInt(request.getParameter("p"));
	}catch(Exception e) { ; }
	// 페이지 사이즈 받기
	int pageSize = 5;
	try{
		pageSize = Integer.parseInt(request.getParameter("s"));
	}catch(Exception e) { ; }
	// 블록 사이즈 받기
	int blockSize = 5;
	try{
		blockSize = Integer.parseInt(request.getParameter("b"));
	}catch(Exception e) { ; }
	// 글번호 받기
	int idx = 0;
	try{
		idx = Integer.parseInt(request.getParameter("idx"));
	}catch(Exception e) { ; }
	// 모드(저장(1)/수정(2)/삭제(3) 구분) 받기
	int mode = 0;
	try{
		mode = Integer.parseInt(request.getParameter("m"));
	}catch(Exception e) { ; }

%>