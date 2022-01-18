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
						// XML로 받았을때 처리하는 방법
						var xml = req.responseXML;
						// alert(typeof(xml));
						var result = "<ol>";
						$(xml).find("food").each(function(i, element) {
							result += "<li>";
							result += $(this).find("name").text();
							result += "(" + $(this).find("price").text() + ")";
							result += "</li>";
						});
						result += "</ol>"
						
						$("div").html(result);
					}
				}
			}
			// 호출 준비
			req.open('GET','resultXML2.jsp', true); 
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
	<button>XML로 받기</button>
	<br /><hr />
	<div></div>
</body>
</html>