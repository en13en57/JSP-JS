<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// XMLHttpRequest 객체 선언
		var req = new XMLHttpRequest();
		// 호출 준비
		// req.open('GET','song.txt', false);
		req.open('GET','resultXML.jsp', false);
		// 호출
		req.send();
		// 결과받기
		alert(req.responseText);
		$("#box").html(req.responseText);
	});
</script>
<style type="text/css">
	div {border: 1px solid gray; padding: 10px;}
</style>
</head>
<body>
	<div id="box"></div>
</body>
</html>