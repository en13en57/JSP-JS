<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("button").first().click(function() {
			// XMLHttpRequest 객체 선언
			var req = new XMLHttpRequest();
			// 콜백함수 지정 : 응답 상태에따라 처리할 함수를 지정한다.
			req.onreadystatechange = function(){
				if(req.readyState==4){ // 응답이 완료되면
					if(req.status==200){ // 정상적으로 응답이 되었다면
						// 결과받기
						$("div").first().html("<h1> " + req.responseText + " </h1>");
					}
				}
			}
			// 호출 준비
			req.open('GET','result.jsp?type=1', true); 
			// 호출
			req.send();
		});
		$("button").last().click(function() {
			// XMLHttpRequest 객체 선언
			var req = new XMLHttpRequest();
			// 콜백함수 지정 : 응답 상태에따라 처리할 함수를 지정한다.
			req.onreadystatechange = function(){
				if(req.readyState==4){ // 응답이 완료되면
					if(req.status==200){ // 정상적으로 응답이 되었다면
						// 결과받기
						$("div").first().html("<h1 style='color:red'> " + req.responseText + " </h1>");
					}
				}
			}
			// 호출 준비
			req.open('GET','result.jsp?type=33', true); 
			// 호출
			req.send();
		});
		
		$("button").eq(1).click(function() {
			// XMLHttpRequest 객체 선언
			var req = new XMLHttpRequest();
			// 콜백함수 지정 : 응답 상태에따라 처리할 함수를 지정한다.
			req.onreadystatechange = function(){
				if(req.readyState==4){ // 응답이 완료되면
					if(req.status==200){ // 정상적으로 응답이 되었다면
						// 결과받기
						$("div").first().html("<h1 style='color:green'> " + req.responseText + " </h1>");
					}
				}
			}
			// 호출 준비
			req.open('POST','result.jsp?type=2&name=박문수', true); 
			// 호출
			req.send(); 
		});
		
		
	});
</script>
<style type="text/css">
	div {width: 600px;height: 150px; padding:19px; border: 1px solid gray;}
</style>
</head>
<body>
	<button>날짜얻기</button>
	<button>인사하기</button>
	<button>알수없는 명령</button> <br />
	<hr />
	<div></div>
</body>
</html>