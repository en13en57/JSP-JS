<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="begin" required="true" type="java.lang.Integer"%>
<%@ attribute name="end" required="true" type="java.lang.Integer"%>
<%-- 변수를 선언하여 나를 사용하는 곳에서 이 변수를 사용 가능 하도록 한다. --%>
<%@ variable name-given="sum" variable-class="java.lang.Integer" scope="NESTED"%> <%-- scope="NESTED" : 태그 내에서만 사용 가능 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sum" value="0"/>
<c:forEach var="i" begin="${begin }" end="${end }">
	<c:set var="sum" value="${sum+i }"/>
</c:forEach>
<jsp:doBody/> <%-- 몸체의 내용이 실행되기 전에 태그 파일에서 정의한 변수 sum을 태그를 호출한 페이지에 전달 --%>
