<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="var" required="true" rtexprvalue="false"%>
<%@ attribute name="num1" required="true" type="java.lang.Integer"%>
<%@ attribute name="num2" required="true" type="java.lang.Integer"%>
<%-- 속성 var로 넘어온 값의 별명을 maxNum으로 사용하는데 태그 종료후에 그 변수를 사용할 수 있다. --%>
<%@ variable alias="maxNum" name-from-attribute="var" variable-class="java.lang.Integer" scope="AT_BEGIN"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 이후에 maxNum을 이용하여 처리하면 불러준 곳에서는 변수명이 var속성에 지정한값을 변수로 사용하면 된다. --%>
<c:choose>
	<c:when test="${num1>num2 }">
		<c:set var="maxNum" value="${num1 }"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="maxNum" value="${num2 }"></c:set>
	</c:otherwise>
</c:choose>
