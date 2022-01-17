<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL(JSP Standard Tag Library)</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>JSTL(JSP Standard Tag Library)</h1>
	<%-- 자바코드와 출력코드를 분리하는 방법 --%>
	<%
		String ar[] = "한놈, 두식이, 석삼, 너구리, 오징어".split(","); // 결과를 처리하고
		request.setAttribute("ar", ar); // 처리 결과를 영역에 저장한다.
		pageContext.forward("JSTL_Ex03View.jsp"); // 보여주는 페이지로 포워딩을 시킨다.
	
	%>


</body>
</html>