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
	<%-- 
	파일의 내용이 이자리로 복사되어 삽입된다. 코드를 포함할때 사용 
	여러페이지에 공통으로 들어가는 코드를 별도로 만들어 놓고 포함해서 쓴다. 
	--%>
	<%@ include file="code.jsp" %>
	<h1>나는 세번째 페이지 입니다.</h1>
	<h1>이름 : <%=name %>(<%=age %>세)</h1>
</body>
</html>