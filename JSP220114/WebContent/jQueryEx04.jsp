<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 이벤트 연결(bind)</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('h1').bind({ // 객체로 전달해서 이벤트 3개를 한번에 지정
		"click":function() {
			alert($(this).html()); // 클릭하면 클릭한 곳의 내용을 경고창으로 띄워라!!
		},
		"mouseover": function() {
			$(this).css('background','silver');
		},
		"mouseout": function() {
			$(this).css('background','white');
		}
	});
});
</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>나는 제목1 입니다.</h1>
	<h1>나는 제목2 입니다.</h1>
	<h1>나는 제목3 입니다.</h1>
	<h1>나는 제목4 입니다.</h1>
	<h1>나는 제목5 입니다.</h1>
</body>
</html>