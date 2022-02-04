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

	태그 전 : 1~100까지의 합 : ${sum } <br />
	<my:sum end="100" begin="1">
	태그 안 : 1~100까지의 합 : ${sum } <br />
	</my:sum>
	태그 후 : 1~100까지의 합 : ${sum } <br />
</body>
</html>