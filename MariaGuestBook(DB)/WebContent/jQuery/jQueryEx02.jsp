<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체의 내부 검사</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function (){
		$("#appendStar").click(function(){
			var content = $("h1").eq(0).text();
			content = content + "★";
			$("h1").eq(0).text(content)
		});
		
		$("#prependStar").click(function(){
			var content = $("h1").eq(1).text();
			content = "★" + content;
			$("h1").eq(1).text(content)
		});
		
		$("#star").click(function(){
			var content = $("h1").eq(2).text();
			content = "★" + content + "★";
			$("h1").eq(2).text(content)
		});
		
		$("#btn1").click(function(){
			var content = $("h1").eq(0).text();
			if(content.charAt(content.length-1)=='★')
				content = content.substr(0,content.length-1);
			$("h1").eq(0).text(content)
		});
		
		$("#btn2").click(function(){
			var content = $("h1").eq(1).text();
			if(content.charAt(0)=='★')
				content = content.substring(1);
			$("h1").eq(1).text(content)
		});
		
		$("#btn3").click(function(){
			var content = $("h1").eq(2).text();
			if(content.charAt(0)=='★'){
				content = content.substring(1);
				content = content.substr(0,content.length-1);
			}
			$("h1").eq(2).text(content)
		});
	});	
</script>
<style type="text/css">
	div {
		width: 20px; height: 200px; padding: 5px; border: 1px solid gray; margin: 10px;
	}
</style>
</head>
<body>
	<button id= "appendStar">뒤에 별 추가하기</button>
	<button id= "prependStar">앞에 별 추가하기</button>
	<button id= "star">앞뒤로 별 추가하기</button>
	<br /><hr />
	<button id= "btn1">뒤에 별 지우기</button>
	<button id= "btn2">앞에 별 지우기</button>
	<button id= "btn3">앞뒤로 별 지우기</button>
	<br /><hr />
	<h1>나는 제목 01</h1>
	<h1>나는 제목 02</h1>
	<h1>나는 제목 03</h1>

</body>
</html>