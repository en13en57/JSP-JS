<%@tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="linechar"  required="true" fragment="true" %>
<%@attribute name="size"  type="java.lang.Integer" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty size }">
	<c:set var="size" value="1"/>
</c:if>
<c:forEach var="i" begin="1" end="${size }">
	<jsp:invoke fragment="linechar"/> <%-- 직접 출력 --%>
</c:forEach>
<hr>
<jsp:invoke fragment="linechar" var="ch" scope="page"/> <%-- 변수에 저장 --%>
<c:forEach var="i" begin="1" end="${size }">
	${ch }
</c:forEach>