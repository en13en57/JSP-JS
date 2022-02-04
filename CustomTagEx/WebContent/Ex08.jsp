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
	<my:max var="max1" num2="500" num1="300">첫번째 태그</my:max>
	최대값 : ${max1 } <br />
	
	<%--사용안됨
	최대값 : ${maxNum } <br />
	 --%>

	<my:max var="max2" num2="500" num1="550">두번째 태그</my:max>
	최대값 : ${max2 } <br />
	<hr />
	최대값 : ${max1 } <br />
	최대값 : ${max2 } <br />
	
</body>
</html>