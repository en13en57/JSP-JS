<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<my:header title="별점주기"/>
	<hr />
	한사람 : <my:star/><br />
	두사람 : <my:star size="10"/><br />
	세사람 : <my:star size="5"/><br />
	네사람 : <my:star size="8"/><br />
	오사람 : <my:star size="16"/><br />
</body>
</html>