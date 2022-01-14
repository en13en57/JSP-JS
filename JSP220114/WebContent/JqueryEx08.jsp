<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 이벤트 해제</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var len = 0;
		$("div").html((50-len) + "글자").css('fontSize','20pt');
		$("textarea").keyup(function() {
			var len = $(this).val().length;
			$("div").html((50-len) + "글자")
			if(len<=50){
				$("div").css('color','black');
			}else{
				$("div").css('color','red');
			}
		});
	});
</script>
<style type="text/css">
	
</style>
</head>
<body>
	<!-- 입력되는 글자수를 세어 50부터 꺼꾸로 감소하다 50자를 넘으면 빨간색으로 음수로 표시하는 기능 구현  -->
	<div>??글자</div>
	<textarea name="content" id="content" cols="30" rows="10"></textarea>
</body>
</html>