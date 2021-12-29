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
	<h1>나는 <%=request.getRequestURL() %>입니다.</h1>	
	<h1>나는 ${pageContext.request.requestURL } 입니다.</h1>	
	<%-- 같은 request영역이므로 받는것 없이 바로 사용이 가능하다. --%>
	${name }(${age }세, ${gender })
</body>
</html>