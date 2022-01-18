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
		$("#content").keyup(function() {
			//alert($(this).val());
			var value = $(this).val();
			
			// 위의 값을 Ajax로 전송해서 받은 결과를 아래의 div태그에 넣어주면된다.
			var req = new XMLHttpRequest();
			req.onreadystatechange = function(){
				if(req.readyState==4){ // 응답이 완료되면
					if(req.status==200){ // 정상적으로 응답이 되었다면
						var cnt = req.responseText*1; // 넘어온값을 *1해서 숫자로 바꾼다.
						if(cnt==1){
							alert("욕하면 못써요");
						}
					}
				}
			}
			// 호출 준비
			req.open('GET','resultText.jsp?word=' + value, true); 
			// 호출
			req.send();
		});
	});
</script>
</head>
<body>
	<textarea name="content" id="content" cols="60" rows="10"></textarea>
</body>
</html>