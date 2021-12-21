<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 정보를 알아내기</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	접속 IP : <%=request.getRemoteAddr() %> <br />
	절대 경로 : <%=request.getRealPath(".") %> <br />
	요청 방법 : <%=request.getMethod() %> <br /><hr />
	
	getContextPath	: <%=request.getContextPath() %> <br />
	getRequestURI	: <%=request.getRequestURI() %> <br />
	getRequestURL	: <%=request.getRequestURL() %> <br />
	getQueryString	: <%=request.getQueryString() %> <br /><hr /><hr />



	
	getServerName	: <%=request.getServerName() %> <br />
	getServerPort	: <%=request.getServerPort() %> <br /><hr />
	
	getLocalAddr	: <%=request.getLocalAddr() %> <br />
	getLocalName	: <%=request.getLocalName() %> <br />
	getLocalPort	: <%=request.getLocalPort() %> <br />
	getLocale		: <%=request.getLocale() %> <br /><hr />
</body>
</html>