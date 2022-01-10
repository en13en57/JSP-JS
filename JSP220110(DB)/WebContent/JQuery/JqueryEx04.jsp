<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 다운 받지 않고 사용하려면 CDN을 이용하면 된다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() { // 맨 마지막에 실행됨
		$("*").css('color','red'); // 전체선택자(*) : 모든 글자를 빨간색으로
		$("h2").css('background-color', 'pink'); // 태그 선택자 (태그명)
		$("h1,h3").css('background-color', 'skyblue'); // 태그 선택자 (태그명)
		$("#box1").css('color', 'green'); // id선택자 ("#아이디명")
		$("#box3,#box5").css('color', 'blue'); // id선택자 ("#아이디명....")
		$(".block1").css('background-color','silver'); // 클래스선택자(".클래스 이름")
		$(".block2,.block3").css('background-color','yellow') // 클래스선택자(".클래스이름....")
		.css('font-size','18pt')
		.css('font-size','bold'); // 클래스선택자(".클래스이름....")
	});

</script>
<style type="text/css">
	* {color: blue;}
</style>
</head>
<body>
	<h1>Hello JQuery!</h1>
	<h2>Hello JQuery!</h2>
	<h3>Hello JQuery!</h3>
	<!-- 
	 span[class="block$"]{내용$$}*5
	 -->
	<span class="block1">내용01</span>
	<span class="block2">내용02</span>
	<span class="block1">내용03</span>
	<span class="block2">내용04</span>
	<span class="block1">내용05</span>
	<span class="block3">내용06</span>
	<!-- 
	div[id='box$']{$$나는 내용입니다.}*5
	 -->
	<div id="box1">01나는 내용입니다.</div>
	<div id="box2">02나는 내용입니다.</div>
	<div id="box3">03나는 내용입니다.</div>
	<div id="box4">04나는 내용입니다.</div>
	<div id="box5">05나는 내용입니다.</div>
</body>
</html>