<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체의 추가 선택 : add()</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("h1") // h1태그를 찾아
		.css('color','red') // 글자색을 빨강으로
		.add("h2") // h2태그를 추가해서 찾아
		.css({
			'background':'pink', // 배경색을 핑크로
			'float' : 'left'     // 블록 요소를 인라인요소로 만들어 줄바꿈 없이 옆으로 붙인다.
		}).filter("h1") // h1태그에만
		.css('clear','both');// float요소를 해제		
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- 
	(h1{큰제목 $$}+h2{작은제목 $$$})*4
	 -->
	<h1>큰제목 01</h1>
	<h2>작은제목 001</h2>
	<h1>큰제목 02</h1>
	<h2>작은제목 002</h2>
	<h1>큰제목 03</h1>
	<h2>작은제목 003</h2>
	<h1>큰제목 04</h1>
	<h2>작은제목 004</h2>
</body>
</html>