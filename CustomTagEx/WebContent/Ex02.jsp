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
	<my:now/> <br />
	<%-- 속성의 값으로는 데이터, EL, 표현식 어떤것도 가능하다 --%>
	<my:header title="나는 제목 입니다."/> <br />
	<my:header title="${pageContext.request.remoteAddr }"/> <br />
	<my:header title='<%="제목" %>'/> <br />
	<%--
	required="true"이므로 title 속성을 지정하지 않으면 에러이다.
	<my:header /> <br />
	 --%>
	<hr />
	 
	<my:header title="나는 제목 입니다."/> <br />
	<my:header title="나는 제목 입니다." size="1"/> <br />
	<my:header title="나는 제목 입니다." size="2"/> <br />
	<my:header title="나는 제목 입니다." size="3"/> <br />
	<my:header title="나는 제목 입니다." size="13"/> <br />
</body>
</html>