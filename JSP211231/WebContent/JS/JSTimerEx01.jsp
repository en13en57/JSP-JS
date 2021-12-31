<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){
		setInterval(function() {
			var date = new Date();
			var hh = date.getHours();
			var mm = date.getMinutes();
			var ss = date.getSeconds();
			
			document.getElementById("time").value = ( hh<10 ? "0"+hh : hh ) 
													+ ":" + ( mm<10 ? "0"+mm : mm )  
													+ ":" + ( ss<10 ? "0"+ss : ss ) ;
			document.title = ( hh<10 ? "0"+hh : hh ) 
							+ ":" + ( mm<10 ? "0"+mm : mm )  
							+ ":" + ( ss<10 ? "0"+ss : ss ) ; // 윈도우 타이틀 변경
		}, 1000);
		
		document.getElementById("btn1").onclick = function(){
			setTimeout(function() {
				document.getElementById("result1").innerText += "1초후 실행!!!"; 
			}, 5000);
		}
		var count = 0;
		document.getElementById("btn2").onclick = function(){
			var timer = setInterval(function() {
				document.getElementById("result2").innerText += "1초마다 실행!!!"; 
				if(++count==10){
					clearInterval(timer);
					return;
				}
			}, 1000);
		}
	}
</script>
<style type="text/css">
	#result1, #result2 {width: 300px; height: 200px; border: 1px solid gray; padding:5px;}
</style>
</head>
<body>
	현재 시간 : <input type="text" id="time" />
	
	<button id="btn1">1초후 1번실행하기</button><br />
	<div id="result1"></div>
	
	<button id="btn2">1초마다 1번실행하기</button><br />
	<div id="result2"></div>
</body>
</html>