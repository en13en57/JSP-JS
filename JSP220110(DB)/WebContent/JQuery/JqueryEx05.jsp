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
	$(function() { 
		$("body > *").css('color','red'); // 자식 선택자 : 부모>자식
		
		$("body *").css('background-color','pink'); // 자손 선택자 : 부모 자식(공백으로 구분시)
	});

</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- 
	div>ul>li{아이템 $$$}*6
	 -->
	<div>
		<ul>
			<li>아이템 001</li>
			<li>아이템 002</li>
			<li>아이템 003</li>
			<li>아이템 004</li>
			<li>아이템 005</li>
			<li>아이템 006</li>
		</ul>
	</div>
	<hr />
	<ul>
		<li>아이템 001</li>
		<li>아이템 002</li>
		<li>아이템 003</li>
		<li>아이템 004</li>
		<li>아이템 005</li>
		<li>아이템 006</li>
	</ul>
</body>
</html>