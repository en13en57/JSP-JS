<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 조작</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("img").each(function(i, element) {
			// $(this).attr('src','../images/game_00' + (i+1) + ".png"); // 이렇게 하면 10번째 그림 엑박
			$(this).attr('src','../images/game_0' + (i+1<10 ? "0"+(i+1) : i+1) + ".png"); // 이렇게 하면  모두 나옴
			$(this).attr('alt','game_0' + (i+1<10 ? "0"+(i+1) : i+1) + ".png"); // 이렇게 하면  모두 나옴
			// 그림크기를 동일한 크기로 변경
			$(this).attr('width','100');
			$(this).attr('height','150');
			
			// 그림의 크기를 각각 다르게 점점 커지면서 나타나게 하고 싶다.
			$(this).attr('height', function(){ // 함수로 크기를 동적으로 변경이 가능하다.
				return (i+1)*50;
			}).attr('width', function(){
				return (i+1) * 33;
			});
			
			// 객체를 이용하여 한번에 여러개 속성을 변경 가능하다.
			$(this).attr({
				'title' : $(this).attr('alt'),
				'width': function(){
					return (i+1) * 45;
				},
				'border' : function(){
					return (i+1)*3;
				}
			});
			
			// 속성을 제거해보자
			// 지정된 테두리값을 지우자!!!
			$(this).removeAttr("alt");
			// 짝수번째의 그림의 테두리값을 지우자!!!
			if((i+1)%2==0){
				$(this).removeAttr("border");
			}
		});		
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<img src="" alt=""/>
	<img src="" alt="" />
	<img src="" alt="" />
	<img src="" alt="" />
	<img src="" alt="" />
	<img src="" alt="" />
	<img src="" alt="" />
	<img src="" alt="" />
	<img src="" alt="" />
	<img src="" alt="" />
</body>
</html>