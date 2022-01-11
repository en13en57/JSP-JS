<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 문서 객체의 특징 판별 : is()</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("h1").each(function(i, element) { // h1태그 반복
			if($(this).is(".select")){ // h1태그에 클래스 이름이 select를 가진놈만
				$(this).css('background','orange');
			}
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- 
	h1[class='select']{나는 제목 $$$}*10
	-->
	<h1 class="select">나는 제목 001</h1>
	<h1 class="select">나는 제목 002</h1>
	<h1 >나는 제목 003</h1>
	<h1 class="select">나는 제목 004</h1>
	<h1 class="select">나는 제목 005</h1>
	<h1 >나는 제목 006</h1>
	<h1 class="select">나는 제목 007</h1>
	<h1 >나는 제목 008</h1>
	<h1 >나는 제목 009</h1>
	<h1 class="select">나는 제목 010</h1>
</body>
</html>