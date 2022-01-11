<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter()  함수</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 요소 선택자를 이용
		$("h2:odd").css('color','red');
		$("h2:even").css('color','blue');
		
		// filter함수를 이용해 보자
		$("h2")
		.filter(":odd").css('background','pink') // 홀수 선택해서 배경색 핑크색으로
		.end() // 선택 해제
		.filter(":even").css('background','skyblue'); // 짝수 선택해서 배경색 하늘색으로
		
		$("h2").filter(function(i){
			return (i%3==0); // 조건에 맞는것만 선택된다.
		}).css({ // 복수개를 바꿀려면 객체로 전달 가능하다.
			'background':'black',
			'color' : 'white'
		});
		
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