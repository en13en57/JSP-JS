<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<%-- c:if : 조건문 --%>
	<c:if test="${empty param.num1 or empty param.num2  }">
		주소표시줄 뒤에 "?num1=숫자&num2=숫자" 형태로 실행해 보시기 바랍니다. <br />
	</c:if>
	<%-- JSPL에 else는 없다. --%>
	<c:if test="${not empty param.num1 and not empty param.num2  }">
		<c:if test="${param.num1>param.num2}">
			${param.num1 } 더 크다
		</c:if>
		<c:if test="${param.num1<param.num2}">
			${param.num2 } 더 크다
		</c:if>
		<c:if test="${param.num1==param.num2}">
			두개의 수는 같습니다.
		</c:if>
	</c:if>
</body>
</html>