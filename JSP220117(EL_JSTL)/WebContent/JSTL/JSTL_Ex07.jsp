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
	<%-- c:forEach : 반복문 --%>
	<c:forEach var="i" begin="10" end="20">
		${i }.<span style="font-size: ${i }pt;">야호</span><br />
	</c:forEach>
	<hr />
	<c:forEach var="i" begin="10" end="20" step="3">
		${i }.<span style="font-size: ${i }pt;">야호</span><br />
	</c:forEach>
	<hr />
	<c:forEach var="i" begin="10" end="20" varStatus="vs">
		${vs.count }-${vs.index }<span style="font-size: ${i }pt;">야호</span><br />
	</c:forEach>
	<hr />
	
	<%
		String ar[] = "한놈, 두식이, 석삼, 너구리, 오징어, 육개장, 칠면조, 팔불출, 구공탕, 십장생".split(","); // 결과를 처리하고
		request.setAttribute("ar", ar); // 처리 결과를 영역에 저장한다.
	%>
	<%-- Collection 처리는 items속성을 사용한다. --%>
	<c:forEach var="i" varStatus="vs" items="${ar }">
		${vs.count }-${vs.index }.${i }<br />
	</c:forEach>
	<hr />
	<%-- Collection 처리에 begin, end를 쓰면 일부만 처리 가능하다. --%>
	<c:forEach var="i" varStatus="vs" items="${ar }" begin="3" end="7">
		${vs.count }-${vs.index }.${i }<br />
	</c:forEach>
	<hr />

	<%-- Collection 처리에 begin, end를 쓰면 일부만 처리 가능하다. --%>
	<c:forEach var="i" varStatus="vs" items="${ar }" begin="3" end="7" step="2">
		${vs.count }-${vs.index }.${i }<br />
	</c:forEach>
	<hr />
	<%-- 문자열을 구분자로 구분하여 반복해준다. --%>
	<c:forTokens var="name" items="한놈, 두식이, 석삼, 너구리, 오징어, 육개장, 칠면조, 팔불출, 구공탕, 십장생" delims=",">
		${name } <br />
	</c:forTokens>
	<hr />
	<%-- 문자열을 여러개의 구분자로 구분하여 반복해준다. --%>
	<c:forTokens var="name" items="한놈, 두식이- 석삼. 너구리. 오징어- 육개장, 칠면조, 팔불출, 구공탕, 십장생" delims=",.-">
		${name } <br />
	</c:forTokens>
</body>
</html>