<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 이 페이지에서 에러가 발생한다면 다음에 지정한 페이지로 보내라!!! --%>
<%@ page errorPage="/error/error.jsp" %> <%-- 여러개 에러페이지 지정시 제일 우선권을 가진다. --%>
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
	10/0 = <%=10/0 %> <br />
</body>
</html>