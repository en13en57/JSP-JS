<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 입력난에 숫자를 입력하면 자동으로 아래 DIV창에 천자문에서 그 데이터를 받아 출력하는 
		// 프로그램을 작성하시오!!!
		$("#idx").change(function() {
			//alert($(this).val());
			var value = $(this).val();
			/*
			// 위의 값을 Ajax로 전송해서 받은 결과를 아래의 div태그에 넣어주면된다.
			var req = new XMLHttpRequest();
			req.onreadystatechange = function(){
				if(req.readyState==4){ // 응답이 완료되면
					if(req.status==200){ // 정상적으로 응답이 되었다면
						var obj = JSON.parse(req.responseText);
						var result = "<h2>";
						result += obj.index + ". " + obj.h + "(" + obj.k + ")";
						result += "</h2>";
						$("div").html(result);
					}
				}
			}
			// 호출 준비
			req.open('GET','resultHanja.jsp?idx=' + value, true); 
			// 호출
			req.send();
			*/
			// 결과값이 JSON객체이다.
			/*
			// $.getJSON(호출할주소, 전달할데이터객체, 성공시 함수);
			$.getJSON("resultHanja.jsp", {"idx":value}, function(data) {
				var result = "<h2>";
				result += data.index + ". " + data.h + "(" + data.k + ")";
				result += "</h2>";
				$("div").html(result);
			});
			*/
			// $.getJSON(객체);
			$.getJSON({
				url : "resultHanja.jsp",
				data :  {"idx":value},
				success : function(data) {
					var result = "<h2>";
					result += data.index + ". " + data.h + "(" + data.k + ")";
					result += "</h2>";
					$("div").html(result);
				}
			});
		});
	});
</script>
<style type="text/css">
	div {width: 200px;height: 80px; padding:5px; border: 1px solid gray;}
</style>
</head>
<body>
	
	<input type="number" id="idx" name="idx" min="1" max="1000"/>
	<br /><hr />
	<div></div>
</body>
</html>