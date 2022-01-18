<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// XMLHttpRequest 객체 선언
		var req = new XMLHttpRequest();
		// 콜백함수 지정 : 응답 상태에따라 처리할 함수를 지정한다.
		req.onreadystatechange = function(){
			if(req.readyState==4){ // 응답이 완료되면
				if(req.status==200){ // 정상적으로 응답이 되었다면
					// 결과받기
					alert(typeof(req.responseXML));
					$("#box").text(req.responseText);
				}esle{
					alert("에러다!!!!");
				}
			}
		}
		// 호출 준비
		// req.open('GET','song.txt', false);
		req.open('GET','resultXML.jsp', true); // 세번째 인수가 true이면 비동기식 호출 : 백그라운드실행
		// 호출
		req.send();
	});
</script>
<style type="text/css">
	div {border: 1px solid gray; padding: 10px;}
</style>
</head>
<body>
	<div id="box"></div>
</body>
</html>