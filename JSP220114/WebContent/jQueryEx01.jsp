<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 복사</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 모든 그림 폭 높이 고정
		$("img").attr({
			"width":"150",
			"height" : "200"
		});
		setInterval(function() {
			$("img").first().appendTo("body"); // 맨 앞의 그림을 문서의 맨 뒤로 이동
		}, 1000) // 1초마다.
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<img src="images/game_001.png"/>
	<img src="images/game_002.png"/>
	<img src="images/game_003.png"/>
	<img src="images/game_004.png"/>
	<img src="images/game_005.png"/>
	<img src="images/game_006.png"/>
	<img src="images/game_007.png"/>
	<img src="images/game_008.png"/>
	<img src="images/game_009.png"/>
	<img src="images/game_010.png"/>
</body>
</html>