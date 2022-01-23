<%@page import="kr.green.memo.service.MemoServiceImpl"%>
<%@page import="kr.green.memo.dao.MemoDAOImpl"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vo" class="kr.green.memo.vo.MemoVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:setProperty property="ip" name="vo" value="${pageContext.request.remoteAddr }"/>
	
	<%
	// 데이터가 올바르면 서비스 클래스를 호출하여 수정하고
	MemoServiceImpl.getInstance().update(vo);

	// 리스트로 돌아간다.
	response.sendRedirect("memoList.jsp?p=" + currentPage + "&s=" + pageSize + "&b=" + blockSize);
	%>
	

</body>
</html>