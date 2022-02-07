<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- 내가 쓴 제목의 앞뒤로 -= =- 붙여서 제목으로 사용하겠다. --%>
<title> -= <sitemesh:write property='title'/> =- </title>
<%-- 내가 쓴 헤더의 모든 내용이 이 자리에 들어와라 --%>
<sitemesh:write property='head'/>
<style type="text/css">
	#footer{
		padding: 10px; font-size: 13pt; background-color: silver; border: 1px solid gray; margin-top: 15px;
		text-align: center;
	}
</style>
</head>
<body>
<h1>상단</h1>
<hr />
<%-- 이 자리에 내가 쓴 본문의 내용이 나타나라 --%>
<sitemesh:write property='body'/>
<div id="footer">저작권이 어쩌구 저쩌구...</div>
</body>
</html>