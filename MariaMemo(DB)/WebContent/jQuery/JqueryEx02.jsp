<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요소의 반복</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("h1").each(function(i) {
			$(this).html("나는 제목"+(i+1)+" 입니다.");
		});

		$("h1").each(function(i) {
			if(i%2==0)
				$(this).css('color','red');
			else
				$(this).css('color','blue');
		});
		// 1, 4, 7, 10에 배경색을 핑크로 넣어라
		$("h1").each(function(i, elt) {
			if((i+1)%3==1)
				$(elt).css('background','pink');
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<h1></h1>
	<h1></h1>
	<h1></h1>
	<h1></h1>
	<h1></h1>
	<h1></h1>
	<h1></h1>
	<h1></h1>
	<h1></h1>
	<h1></h1>
</body>
</html>