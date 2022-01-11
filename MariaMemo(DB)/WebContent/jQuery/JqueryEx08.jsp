<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter()  함수</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 짝수번째는 빨강 홀수번째는 파랑으로 만들고 싶다.
		// 과연 됐을까?
		$("h2")
		.filter(":even").css('color','red')		 // 짝수번째 선택
		.filter(":odd").css('color','blue');	 // 짝수번째 중 홀수 번째	

		$("h2")
		.filter(":even").css('background','pink')		 // 짝수번째 선택
		.end() // 이전 필터 종료
		.filter(":odd").css('background','skyblue');	 // 홀수번째 선택	
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