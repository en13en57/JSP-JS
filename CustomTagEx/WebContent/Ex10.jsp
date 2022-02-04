<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 태그를 제거해주는 태그</title>
</head>
<body>
	<jsp:useBean id="today" class="java.util.Date" scope="page"/>
	${today } <br />
	<hr />
	<my:removeHTML trim="true">
		현재 <b>시간</b> : ${today }입니다. <u>하하하하</u>
	</my:removeHTML>
	<hr />
	<my:removeHTML trim="true" length="30">
		현재 <b>시간</b> : ${today }입니다. <u>하하하하</u>
	</my:removeHTML>
	<hr />
	<my:removeHTML trim="true" length="30" trail="...">
		현재 <b>시간</b> : ${today }입니다. <u>하하하하</u>
	</my:removeHTML>
</body>
</html>