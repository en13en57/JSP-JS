<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체의 생성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function (){
		$("#btn1").click(function(){
			$("<h2></h2>").text("제목 1").appendTo("#box1"); // 태그가 만들어 box1에 추가
		});
		// 위 아래가 같음
		$("#btn2").click(function(){
			$("<h2>제목 2</h2>").appendTo("#box2"); 
		});
		// 이미지 추가 하기
		var count = 0;
		$("#btn3").click(function(){
			if(count<=10){
				++count;
				$("<img/>").attr({'src':'../images/game_0' + (count<10 ? "0"+count : count ) + ".png",
					'width' : 100,
					'height' : 100
				}).appendTo("body");
			}else{
				alert('그림이 10장밖에 없네요!')
			}
		});
	});	
</script>
<style type="text/css">
	div {
		width: 200px; height: 200px; padding: 5px; border: 1px solid gray; margin: 10px;
		overflow: hidden;
	}
</style>
</head>
<body>
	<button id="btn1">객체 생성 1</button>
	<button id="btn2">객체 생성 2</button>
	<button id="btn3">이미지 추가 하기</button>
	<br /><hr />
	<div id="box1">
	
	</div>
	<div id="box2">
	
	</div>
</body>
</html>