<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int currentPage = 1;
	try{
		currentPage = Integer.parseInt(request.getParameter("p"));
	}catch(Exception e){
		;
	}
	int pageSize = 10;
	try{
		pageSize = Integer.parseInt(request.getParameter("s"));
	}catch(Exception e){
		;
	}
	int blockSize = 10;
	try{
		blockSize = Integer.parseInt(request.getParameter("b"));
	}catch(Exception e){
		;
	}
	int idx = 0;
	try{
		idx = Integer.parseInt(request.getParameter("idx"));
	}catch(Exception e){
		;
	}
	int mode = 0;
	try{
		mode = Integer.parseInt(request.getParameter("m"));
	}catch(Exception e){
		;
	}
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
	
	request.setAttribute("newLine", "\n");
	request.setAttribute("br", "<br>");
%>