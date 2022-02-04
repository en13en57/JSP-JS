<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 지금까지의 select 태그 만드는 방법 --%>
	<select name="language">
		<option value="HTML">html</option>
		<option value="CSS">css</option>
		<option value="JAVA">java</option>
		<option value="JSP">jsp</option>
	</select>
	<hr />
	
	<!-- 사용자가 만든 select태그를 사용하는 방법 -->
	<my:select name="language" html="HTML" css="CSS" java="JAVA" jsp="JSP" python="PYTHON"/>
</body>
</html>