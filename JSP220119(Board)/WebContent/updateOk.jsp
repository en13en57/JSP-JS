<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>

<c:if test='${pageContext.request.method != "POST" }'>
	<c:redirect url="index.jsp"/>
</c:if>

<%@ include file="include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
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
			try{
				BoardServiceImpl.getInstance().insert(vo);
				// 성공하면 목록으로
				out.println("<script>sendPOST(\"index.jsp\",{\"p\":1,\"s\":"+pageSize+",\"b\":"+blockSize+"})</script>");
			}catch(Exception e){
				// 실패해도 목록으로
				out.println("<script>sendPOST(\"index.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+"})</script>");
			}
			break;
		case 2:
			try{
				BoardServiceImpl.getInstance().update(vo);
				// 성공하면 내용보기로
				out.println("<script>sendPOST(\"view.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+",\"idx\":"+idx+",\"h\":0})</script>");
			}catch(Exception e){
				// 실패하면 수정폼으로
				out.println("<script>sendPOST(\"update.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+",\"idx\":"+idx+",\"h\":0})</script>");
			}
			break;
		case 3:
			try{
				BoardServiceImpl.getInstance().delete(vo);
				// 성공하면 목록보기로
				out.println("<script>sendPOST(\"index.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+"})</script>");
			}catch(Exception e){
				// 실패하면 삭제폼으로
				out.println("<script>sendPOST(\"delete.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+",\"idx\":"+idx+",\"h\":0})</script>");
			}
			break;
		}
		
		out.println("<script>location.href='"+query+"'</script>");	
	
	
	%>

</body>
</html>