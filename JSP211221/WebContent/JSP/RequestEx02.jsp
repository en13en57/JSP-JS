<%@page import="java.lang.reflect.Method"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		// 지정 클래스의 모든 메서드를 얻어낸다.
		Method[] methods = HttpServletRequest.class.getMethods();
		// 출력
		for(Method m : methods) {
			out.println(m.getName() + " : " + m.getParameters().length + "<br />");
		}
	
	
	%>

</body>
</html>