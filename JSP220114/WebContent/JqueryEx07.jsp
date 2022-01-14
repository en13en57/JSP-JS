<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 이벤트 해제</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("button").first().click(function() {
			alert("나왔다!!!!");
		});
		$("button").eq(1).click(function() {
			alert("난 한번만 클릭됨!!");
			$(this).unbind("click"); // 이벤트 해제
		});
		$("button").last().one("click", function() { // one(이벤트이름, 함수) : 이벤트를 1번만 연결
			alert("난 한번만 클릭됨!!");
		});
	});
</script>
<style type="text/css">
	
</style>
</head>
<body>
	<button>나는 매번 경고창</button>
	<button>나는 단한번 경고창</button>
	<button>나는 단한번 경고창</button>
</body>
</html>