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
		$("#btn2").click(function() {
			alert("눌렀냐2");
			$("#box2").hide();
		});
	});

	window.onload = function() {
		document.getElementById("btn1").onclick = function() {
			alert("눌렀냐1");
			document.getElementById("box1").style.display = 'none';
		}
	}
</script>
<style type="text/css">
div {
	width: 200px;
	height: 150px;
	padding: 5px;
	border: 1px solid gray;
	margin: 10px;
	float: left;
}
</style>
</head>
<body>
	<h1>Hello JQuery!</h1>
	<button id="btn1">눌러줘</button>
	<button id="btn2">눌러줘</button>
	<br />
	<hr />
	<div id="box1">내가 아직도 보이니1</div>
	<div id="box2">내가 아직도 보이니2</div>

</body>
</html>