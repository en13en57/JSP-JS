<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 복사(bind)</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('h1').bind("click", function(){
			alert($(this).html()); // 클릭하면 클릭한곳의 내용을 경고창으로 띄워라!
			
		});
		$('h1').bind("mouseover", function(){
			($(this).css('background','silver')); // 클릭하면 클릭한곳의 내용을 경고창으로 띄워라!
			
		});
		$('h1').bind("mouseout", function(){
			($(this).css('background','white')); // 클릭하면 클릭한곳의 내용을 경고창으로 띄워라!
			
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>나는 제목1 입니다.</h1>
	<h1>나는 제목2 입니다.</h1>
	<h1>나는 제목3 입니다.</h1>
	<h1>나는 제목4 입니다.</h1>
	<h1>나는 제목5 입니다.</h1>
</body>
</html>