<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더값 1개씩 읽기</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	Host : <%=request.getHeader("host") %> <br />
	user-agent : <%=request.getHeader("user-agent") %> <br />
	<hr />
	Host : ${header.host } <br />
	Host : ${header['host'] } <br />
	user-agent : ${header.user-agent } <br /> <%-- 0출력: -를 빼기로 계산 --%>
	user-agent : ${header['user-agent'] } <br />
</body>
</html>