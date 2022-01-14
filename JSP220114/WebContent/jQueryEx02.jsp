<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 복사</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// $("div").append($("h1")); // h1태그를 찾아서 div 태그로 이동
		$("div").append($("h1").clone()); // h1태그를 찾아서 div 태그로 복사
	
	});
</script>
<style type="text/css">
	div {border: 1px solid gray; padding:10px;}
</style>
</head>
<body>
	<h1>나는 제목</h1>
	<hr /><div></div><hr />
</body>
</html>