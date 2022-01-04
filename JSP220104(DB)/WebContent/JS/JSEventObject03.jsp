<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 강제 발생</title>
<script type="text/javascript">
	window.onload = function(){
		// 눌러봐 1을 클릭하면 첫번째 숫자만 늘어난다.
		document.getElementById("btn1").onclick = function(){
			var obj = document.getElementById("counter1");
			obj.innerText = parseInt(obj.innerText)+1;
		}
		// 눌러봐 2를 클릭하면 두개 숫자가 같이 늘어난다.
		document.getElementById("btn2").onclick = function(){
		/*
			var obj = document.getElementById("counter1");
			obj.innerText = parseInt(obj.innerText)+1;
			*/
			// 이벤트 강제 발생!
			document.getElementById("btn1").click();
			
			var obj = document.getElementById("counter2");
			obj.innerText = parseInt(obj.innerText)+1;
		}
	};
</script>
<style type="text/css">
	div{
		border: 1px solid gray; padding:10pt; font-size: 40pt; margin: 10px;
		width: 150px; text-align: right;
	}
</style>
</head>
<body>
	<!-- 
	button[id='btn$']{눌러봐 $$}*2
	 -->
	<button id="btn1">눌러봐 01</button>
	<button id="btn2">눌러봐 02</button>
	<br />
	<hr />
	<div id="counter1">0</div>
	<div id="counter2">0</div>
</body>
</html>