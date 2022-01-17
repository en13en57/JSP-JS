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
	<%-- 숫자를 원하는 형식으로 출력하기 --%>
	<c:set var="n" value="123456789.56789"/>

	${n } <br /><hr />
	<%-- 천단위마다, / 소수이하 3자리 --%>
	<fmt:formatNumber value="${n }"/> <br /><hr />
	
	<%-- 천단위마다, 생략 --%>
	<fmt:formatNumber value="${n }" groupingUsed="false"/> <br /><hr />
	
	<%-- 원하는 모양으로 출력 --%>
	<fmt:formatNumber value="${n }" pattern="0.00"/> <br />
	<fmt:formatNumber value="${n }" pattern="0,000.0"/> <br /><hr />
	
	<fmt:formatNumber value="${n }" pattern="#.##"/> <br />
	<fmt:formatNumber value="${n }" pattern="#,###.#"/> <br /><hr />
	
	<%-- 0과 #의 차이 : 0은 반드시 그 자리수 까지 --%>
	<fmt:formatNumber value="1234.4" pattern="#,###.##"/> <br />
	<fmt:formatNumber value="1234.4" pattern="0,000.00"/> <br />
	
	<%-- 형식 변경 --%>
	<fmt:formatNumber value="0.3" type="percent"/><br /><hr />
	
	<%-- 통화형태 --%>
	<fmt:formatNumber value="12600" type="currency"/><br /><hr />
	<%-- 화폐 단위 --%>
	<fmt:formatNumber value="12600" type="currency" currencySymbol="$"/><br /><hr />
	<fmt:formatNumber var="num" value="12600" type="currency" currencySymbol="$"/><br />
	${num }
			
</body>
</html>