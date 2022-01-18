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
		/*
		$("#userid").keyup(function() {
			//alert($(this).val());
			var value = $(this).val();
			if(value.length>3){ // 입력한값이 3자보다 클경우에만 처리하자
				// 위의 값을 Ajax로 전송해서 받은 결과를 아래의 div태그에 넣어주면된다.
				var req = new XMLHttpRequest();
				req.onreadystatechange = function(){
					if(req.readyState==4){ // 응답이 완료되면
						if(req.status==200){ // 정상적으로 응답이 되었다면
							var cnt = req.responseText*1; // 넘어온값을 *1해서 숫자로 바꾼다.
							if(cnt==1){
								$("#message").css('color','red').html('사용 불가능');
							}else{
								$("#message").css('color','blue').html('사용 가능');
							}
						}
					}
				}
				// 호출 준비
				req.open('GET','resultID.jsp?userid=' + value, true); 
				// 호출
				req.send();
			}else{
				$("#message").html(''); // 입력된 글자가 3자 이하면 메세지 지우기 
			}
		});
		*/
		$("#userid").keyup(function() {
			// alert($(this).val());
			var value = $(this).val();
			if(value.length>3){ // 입력한값이 3자보다 클경우에만 처리하자
				// Jquery를 이용한 Ajax호출
				// $.ajax("호출할 주소", 객체(옵션));
				/*
				$.ajax("resultID.jsp", {
					"data":{"userid":value},  // 넘겨줄 데이터
					"success":function(data){ // 성공했을때 실행할 함수
						if(data*1==1){
							$("#message").css('color','red').html('사용 불가능');
						}else{
							$("#message").css('color','blue').html('사용 가능');
						}						
					}
				});
				*/
				// $.ajax(객체(옵션));
				$.ajax({
					url     : "resultID.jsp",    // 호출할 주소
					type    : "POST",            // 호출 방법
					data    : {"userid":value},  // 넘겨줄 데이터
					success : function(data){     // 성공했을때 실행할 함수
						if(data*1==1){
							$("#message").css('color','red').html('사용 불가능');
						}else{
							$("#message").css('color','blue').html('사용 가능');
						}						
					},
					error : function(){
						alert('에러다 에러다!!!');
					}
				});
			}else{
				$("#message").html(''); // 입력된 글자가 3자 이하면 메세지 지우기
			}
		});
	});
</script>
</head>
<body>
	<input type="text" name="userid" id="userid" /> <span id="message"></span>
</body>
</html>