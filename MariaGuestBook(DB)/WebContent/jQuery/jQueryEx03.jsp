<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체의 제거</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function (){
		$("#btn1").click(function(){
			$("#box1 > h2").last().remove(); // 선택된 객체 제거
		});
		$("#btn2").click(function(){ // 선택된 객체의 자식들 모두 제거 
			$("#box2").empty();
		});
	});	
</script>
<style type="text/css">
	div {
		width: 200px; height: 200px; padding: 5px; border: 1px solid gray; margin: 10px;
	}
</style>
</head>
<body>
	<button id="btn1">box1안의 h2태그 1개씩 지우기</button>
	<button id="btn2">box2의 안에내용 몽땅 지우기</button>
	<br /><hr />
	<div id="box1">
		<h2 id="head1">나는 작은 제목 01</h2>
		<h2 id="head2">나는 작은 제목 02</h2>
		<h2 id="head3">나는 작은 제목 03</h2>
		<h2 id="head4">나는 작은 제목 04</h2>
	</div>
	<div id="box2">
		<h2 id="head01">나는 작은 제목 01</h2>
		<h2 id="head02">나는 작은 제목 02</h2>
		<h2 id="head03">나는 작은 제목 03</h2>
		<h2 id="head04">나는 작은 제목 04</h2>		
	</div>
</body>
</html>