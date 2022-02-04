<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>태그에서 제공한 변수 사용</title>
</head>
<body>
	<my:max2 var="max1" num2="500" num1="300">
	최대값 : ${max1 } <br />
	</my:max2>
	
	<%--사용안됨
	최대값 : ${maxNum } <br />
	 --%>

	<my:max2 var="max2" num2="500" num1="550">
	최대값 : ${max2 } <br />
	</my:max2>

	<hr />
	최대값 : ${max1 } <br />
	최대값 : ${max2 } <br />
	
</body>
</html>