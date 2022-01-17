<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 여러개의 파일에 공통으로 사용되는 코드는 별도로 만들어놓고 필요시 포함해서 사용한다.
	// POST 정송시 한글개짐 방지
	request.setCharacterEncoding("UTF-8");
	
	// 현재 페이지번호 받기
	int currentPage = 1;
	try{
		currentPage = Integer.parseInt(request.getParameter("p"));
	}catch(Exception e){
		;
	}
	
	// 페이지 사이즈 받기
	int pageSize = 10;
	try{
		pageSize = Integer.parseInt(request.getParameter("s"));
	}catch(Exception e){
		;
	}
	
	// 페이지 개수 받기
	int blockSize = 1;
	try{
		blockSize = Integer.parseInt(request.getParameter("b"));
	}catch(Exception e){
		;
	}
	
	// 글번호 받기
	int idx = 0;
	try{
		idx = Integer.parseInt(request.getParameter("idx"));
	}catch(Exception e){
		;
	}
	
	// 수정(2)/삭제(3)/저장(1) 인지를 구분하는 값 받기
	int mode = 0;
	try{
		mode = Integer.parseInt(request.getParameter("m"));
	}catch(Exception e){
		;
	}
	
	// 조회수 증가여부를 판단하는 값 받기 (0 : 증가안함 , 1 : 증가)
	int incHit = 0;
	try{
		incHit = Integer.parseInt(request.getParameter("h"));
	}catch(Exception e){
		;
	}
	
	request.setAttribute("p", currentPage);
	request.setAttribute("s", pageSize);
	request.setAttribute("b", blockSize);
	request.setAttribute("idx", idx);
	request.setAttribute("m", mode);
	request.setAttribute("h", incHit);
%>
