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
	<%-- java의 switch를 대신하는 JSPL에 c:choose 가 있다 --%>
	<c:if test="${not empty param.num1 and not empty param.num2  }">
		<c:choose>
			<c:when test="${param.num1>param.num2 }">
				큰값 : ${param.num1 } <br />
			</c:when>
			<c:when test="${param.num1<param.num2 }">
				큰값 : ${param.num2 } <br />
			</c:when>
			<c:otherwise>
				두수(${param.num2 })가 같습니다.
			</c:otherwise>		
		</c:choose>
	</c:if>
</body>
</html>