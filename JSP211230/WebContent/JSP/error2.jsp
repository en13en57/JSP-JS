<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
에러가 발생했을 경우 처리 순서
1. 페이지 상단의 에러페이지를 찾는다.
2. web.xml에 지정한 예외타입을 찾는다.
3. web.xml에 지정한 에러 코드를 찾는다.
4. 에러 출력  
 --%>
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