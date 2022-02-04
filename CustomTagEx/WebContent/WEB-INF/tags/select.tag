<%@tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="name"  required="true" %>
<%@tag dynamic-attributes="optionMap"%> <%-- 동적 속성 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- select 태그를 만들어주는 태그 --%>
<select name="${name}">
	<c:forEach var="option" items="${optionMap}">
		<option value="${option.value }">${option.key }</option>
	</c:forEach>
</select>