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
		// H1 태그에 스타일에 저장한 클래스를 적용시고 싶다. 어떻게 해야 할까?
		// addClass(클래스이름), removeClass(클래스이름)	
		// 아래의 5개 클래스를 h1태그에 반복해서 적용시켜보시오
		$("h1").addClass(function(i) {
			return "bg" + (i%5+1); // 클래스 이름을 만들어서 리턴해주면된다.
		});
		// 2, 5, 8번째 적용된 클래스를 제거해 보세요
		$("h1").removeClass(function(i) {
			return ((i+1)%3==2) ? "bg" + (i%5+1) : ""; // 클래스 이름을 만들어서 리턴해주면된다.
		});
	});
</script>
<style type="text/css">
	.bg1 {background-color: yellow;}
	.bg2 {background-color: silver;}
	.bg3 {background-color: purple;}
	.bg4 {background-color: pink;}
	.bg5 {background-color: skyblue;}
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