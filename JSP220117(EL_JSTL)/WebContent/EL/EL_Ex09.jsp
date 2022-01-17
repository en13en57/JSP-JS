<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<c:set var="a" value="13" scope="request"/>
	<c:set var="b" value="27" scope="session"/>
	<c:set var="c" value="69"/>
	a=${a } <br />
	b=${b } <br />
	c=${c } <br />
	<hr />
	a=${requestScope.a } <br />
	b=${sessionScope.b } <br />
	c=${pageScope.c } <br />
	<hr />
	${a } + ${b } = ${a + b } <br />
	${a } - ${b } = ${a - b } <br />
	${a } * ${b } = ${a * b } <br />
	${a } / ${b } = ${a / b } <br /> <%-- 정수/정수 = 실수 --%>
	${a } div ${b } = ${a div b } <br /> <%-- 정수/정수 = 실수 --%>
	${a } % ${b } = ${a % b } <br />
	${a } mod ${b } = ${a mod b } <br />
	<hr />
	${a } == ${b } = ${a == b } <br />
	${a } eq ${b } = ${a eq b } <br />
	${a } != ${b } = ${a != b } <br />
	${a } ne ${b } = ${a ne b } <br />
	<hr />
	${a } > ${b } = ${a > b } <br />
	${a } gt ${b } = ${a gt b } <br />
	${a } >= ${b } = ${a >= b } <br />
	${a } ge ${b } = ${a ge b } <br />
	<hr />
	${a } < ${b } = ${a < b } <br />
	${a } lt ${b } = ${a lt b } <br />
	${a } <= ${b } = ${a <= b } <br />
	${a } le ${b } = ${a le b } <br />
	<hr />
	! ${a }==${b } = ${!(a==b) } <br />
	not ${a }==${b } = ${not (a==b) } <br />
	${a } > ${b } && ${b } < ${c } = ${a>b && b<c } <br />
	${a } > ${b } and ${b } < ${c } = ${a>b and b<c } <br />
	${a } < ${b } || ${b } < ${c } = ${a>b || b<c } <br />
	${a } < ${b } or ${b } < ${c } = ${a>b or b<c } <br />
	<hr />
	empty ${a } = ${empty a } <br />
	empty ${d } = ${empty d } <br />
	
</body>
</html>