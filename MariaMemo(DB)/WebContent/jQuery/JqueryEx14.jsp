<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 조작</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 아래 글자들의 색상을 무지개 색으로 변경하시오
		var rainbow_color = ['red','orange', 'yellow', 'green', 'blue', 'navy', 'purple'];
		$("h1").each(function (i) {
			$(this).css('color',rainbow_color[i]);
		});
		
		$("hr").css('float','left');
		$("hr").each(function (i) {
			$(this).attr('color',rainbow_color[i]);
		});
	});
</script>
</head>
<body>
	<!-- 
	h1{나는 무지개색 제목입니다.}*7
	 -->
	<h1>나는 무지개색 제목입니다.</h1>
	<h1>나는 무지개색 제목입니다.</h1>
	<h1>나는 무지개색 제목입니다.</h1>
	<h1>나는 무지개색 제목입니다.</h1>
	<h1>나는 무지개색 제목입니다.</h1>
	<h1>나는 무지개색 제목입니다.</h1>
	<h1>나는 무지개색 제목입니다.</h1>
	<!-- 무지개색 선 -->
	<!-- div>hr[size="10" width="14%"]*7 -->
	<div>
		<hr size="10" width="14%" /><hr size="10" width="14%" /><hr size="10" width="14%" />
		<hr size="10" width="14%" /><hr size="10" width="14%" /><hr size="10" width="14%" />
		<hr size="10" width="14%" />
	</div>
</body>
</html>