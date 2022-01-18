<%@ page contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8"/>
<%
	System.out.println(request.getMethod());
	System.out.println(request.getParameter("type"));
	System.out.println(request.getParameter("name"));
%>
<c:choose>
	<c:when test="${param.type==1 }">
		<jsp:useBean id="date" class="java.util.Date"/>
		<fmt:formatDate value="${date }" pattern="yyyy년 MM월 dd일 hh:mm:ss"/>
	</c:when>
	<c:when test="${param.type==2 }">
		<c:out value="${param.name }씨 반갑습니다."/>
	</c:when>
	<c:otherwise>
		<c:out value="알수 없는 명령입니다."/>
	</c:otherwise>
</c:choose>