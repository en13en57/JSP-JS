<%@page import="kr.green.category.service.CategoryServiceImpl"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/> <%-- 한글 깨짐 방지 --%>
<%-- POST전송만 처리 --%>
<c:if test="${pageContext.request.method != 'POST' }"> 
	<c:redirect url="listTest.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 데이터 받기 --%>
	<jsp:useBean id="vo" class="kr.green.category.vo.CategoryVO"/>
	<jsp:setProperty property="*" name="vo"/>
	<%
	// 삭제하기
	CategoryServiceImpl.getInstance().delete(vo);
	// 목록으로 다시가기
	response.sendRedirect("index.jsp");
	%>
</body>
</html>