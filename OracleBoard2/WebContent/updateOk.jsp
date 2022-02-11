<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@page import="kr.green.board.service.BoardService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 공통코드 삽입 --%>

<%@ include file="include.jsp" %>

<%-- POST 전송이 아니면 목록으로 보낸다. --%>
<c:if test='${pageContext.request.method!="POST" }'>
	<c:redirect url="index.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 사용자 정의 자바스크립트 함수를 추가한다. --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
</head>
<body>
	<%-- 데이터 받기  --%>
	<jsp:useBean id="vo" class="kr.green.board.vo.BoardVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:setProperty property="ip" name="vo" value="${pageContext.request.remoteAddr }"/>
	
	<%
		switch(mode){
		case 1: // 저장
			BoardServiceImpl.getInstance().insert(vo);
			out.println("<script>");
			out.println("sendPost('index.jsp',{\"p\":1,\"s\":"+pageSize+",\"b\":"+blockSize+"})");
			out.println("</script>");
			break;
		case 2: // 수정
			BoardServiceImpl.getInstance().update(vo);
			out.println("<script>");
			out.println("sendPost('index.jsp',{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+",\"h\":0,\"idx\":"+idx+"})");
			out.println("</script>");
			break;
		case 3: // 삭제
			BoardServiceImpl.getInstance().delete(vo);
			out.println("<script>");
			out.println("sendPost('index.jsp',{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+"})");
			out.println("</script>");
			break;
		default:
			out.println("<script>");
			out.println("sendPost('index.jsp',{\"p\":1,\"s\":10,\"b\":10})");
			out.println("</script>");
			break;
		}
	%>

</body>
</html>