<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 속성을 아래와 같이 전달이 가능하게 하려면 태그에 fragment="true" 를 써주면 된다.  --%>
	<my:line size="30">
		<jsp:attribute name="linechar">
			*~
		</jsp:attribute>
	</my:line>
</body>
</html>