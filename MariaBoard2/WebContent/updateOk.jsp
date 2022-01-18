<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<%
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vo" class="kr.green.board.vo.BoardVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:setProperty property="ip" name="vo" value="${pageContext.request.remoteAddr }"/>
	<%
		String query = "";
		int count = 0;
		switch(mode){
		case 1:
			count = BoardServiceImpl.getInstance().insert(vo);
			if(count==0){
				out.println("<script>alert('저장실패')</script>");
				query = "index.jsp?p=" + currentPage + "&s=" + pageSize + "&b=" + blockSize;
			}else{
				out.println("<script>alert('저장성공')</script>");
				query = "index.jsp?p=1&s=" + pageSize + "&b=" + blockSize;
			}
			break;
		case 2:
			count = BoardServiceImpl.getInstance().update(vo);
			if(count==0){
				out.println("<script>alert('수정실패')</script>");
				query = "update.jsp?p=" + currentPage + "&s=" + pageSize + "&b=" + blockSize + "&idx=" + idx + "&h=0";
			}else{
				out.println("<script>alert('수정성공')</script>");
				query = "view.jsp?p=" + currentPage + "&s=" + pageSize + "&b=" + blockSize + "&idx=" + idx + "&h=0";
			}
			
			break;
		case 3:
			count = BoardServiceImpl.getInstance().delete(vo);
			if(count==0){
				out.println("<script>alert('삭제실패')</script>");
				query = "delete.jsp?p=" + currentPage + "&s=" + pageSize + "&b=" + blockSize + "&idx=" + idx + "&h=0";
			}else{
				out.println("<script>alert('삭제성공')</script>");
				query = "index.jsp?p=" + currentPage + "&s=" + pageSize + "&b=" + blockSize + "&idx=" + idx + "&h=0";
			}
			
			break;
		}
		
		out.println("<script>location.href='"+query+"'</script>");	
	
	
	%>

</body>
</html>