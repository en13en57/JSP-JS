<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 이벤트 연결(bind)</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
		$(function(){
			// 나이에는 숫자만 입력되야 한다 라고 할때 지금까지 확인
		
			$("button").bind("click",function(){ // 버튼을 클릭하면
				if(isNaN($("#age").val())){
					alert('나이는 숫자만 입력 가능 합니다.');
					$("#age").val("");
					$("#age").focus();
				}
			});
			
			// 나이를 입력하고 옆칸으로 갔을때 숫자 검사를 하고싶다.
			$("#age").bind("blur", function(){
				//alert($(this).val());
				if(isNaN($(this).val())){
					alert('나이는 숫자만 입력 가능합니다.');
					$(this).val("");
					$(this).focus();
				}
			});
			// 입력되는 순간 숫자검사를 하고싶다.
			
			$("#age").bind("keyup", function(){
				//alert($(this).val()); // 값
				if(isNaN($(this).val())){ // 값이 숫자가 아니라면
					alert('나이는 숫자만 입력 가능합니다.'); // 경고
					$(this).val(value.substring(0,value.length-1)); // 맨뒤 1글자 지우고
					$(this).focus(); // 커서를 보낸다
				}
			});
			
			
		});
</script>
<style type="text/css">

</style>
</head>
<body>
	나이 : <input type="text" id="age" name="age"/>
	이름 : <input type="text" id="name" name="name"/>
	<button>확인</button>
</body>
</html>