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
	<jsp:useBean id="vo" class="kr.green.board.vo.CommentVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:setProperty property="ip" name="vo" value="${pageContext.request.remoteAddr }"/>
	<%-- idx가 원본의 글번호로 받아졌다. 원본의 글번호는 나의 ref값이어야한다. --%>
	<jsp:setProperty property="ref" name="vo" value="${idx }"/>
	<!-- 나의 idx는 cidx로 넘어왔다. -->
	<jsp:setProperty property="idx" name="vo" value="${param.cidx }"/>
	
	<%-- 모든 값에따라 저장/수정/삭제 서비스 클래스를 불러서 처리하면 된다. --%>
	<%
		String query = "";
		int count = 0;
		switch(mode){
		case 1:
				// 저장
				BoardServiceImpl.getInstance().commentInsert(vo);
			break;
		case 2:
				// 수정
				BoardServiceImpl.getInstance().commentUpdate(vo);
			break;
		case 3:
				// 삭제
				BoardServiceImpl.getInstance().commentDelete(vo);
			break;
		}
		out.println("<script>sendPOST(\"view.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+",\"idx\":"+idx+",\"h\":0})</script>");
		out.println("<script>location.href='"+query+"'</script>");	
	
	
	%>

</body>
</html>