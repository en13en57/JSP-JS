<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 위치의 객체 선택</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("h2").eq(0).css('color','red'); // 첫번째 h2태그의 내용을 빨강색으로
		$("h2").eq(-1).css('color','blue'); // 뒤에서 첫번째 h2태그의 내용을 파랑색으로
		$("h2").first().css('background','yellow'); // 첫번째 h2태그의 배경을 노랑색으로
		$("h2").last().css('background','pink'); // 마지막번째 h2태그의 배경을 핑크색으로
		
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- 
	h2{나는 작은 제목 $$$}*10
	-->
	<h2>나는 작은 제목 001</h2>
	<h2>나는 작은 제목 002</h2>
	<h2>나는 작은 제목 003</h2>
	<h2>나는 작은 제목 004</h2>
	<h2>나는 작은 제목 005</h2>
	<h2>나는 작은 제목 006</h2>
	<h2>나는 작은 제목 007</h2>
	<h2>나는 작은 제목 008</h2>
	<h2>나는 작은 제목 009</h2>
	<h2>나는 작은 제목 010</h2>
</body>
</html>