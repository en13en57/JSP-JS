<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 조작</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 내용 숨기기를 누르면 아래의 내용이 사라지며 내용보기로 바뀐다.
		// 내용 보기를 누르면 아래의 내용이 나타나며 내용숨기기로 바뀐다.
		/*
		$("#titleBox").click(function() {
			if($(this).html()=="내용보기"){
				$(this).html("내용숨기기");
				$("#contentBox").css("display",'block');
			}else{
				$(this).html("내용보기");
				$("#contentBox").css("display",'none');
			}
		});
		*/
		
		$("#titleBox").click(function() {
			if($(this).html()=="내용보기"){
				$(this).html("내용숨기기");
				$("#contentBox").show('slow');
			}else{
				$(this).html("내용보기");
				$("#contentBox").hide('slow');
			}
		});
		
		/*
		// display와 visibility의 차이점 : display는 공간도 사라진다. visibility는 공간이 유지됨
		$("#titleBox").click(function() {
			if($(this).html()=="내용보기"){
				$(this).html("내용숨기기");
				$("#contentBox").css("visibility",'visible');
			}else{
				$(this).html("내용보기");
				$("#contentBox").css("visibility",'hidden');
			}
		});
		*/
	});
</script>
<style type="text/css">
#outerBox {
	width: 200px;
	border: 1px solid gray;
	padding: 10px;
}

#titleBox {
	width: 90%;
	border: 1px solid gray;
	padding: 10px;
	background-color: silver;
	cursor: pointer;
}

#contentBox {
	width: 90%;
	border: 1px solid gray;
	padding: 10px;
}
</style>
</head>
<body>
	<div id="outerBox">
		<div id="titleBox">내용숨기기</div>
		<div id="contentBox">
			내용이 어쩌구 저쩌구 <br /> 내용이 어쩌구 저쩌구 <br /> 내용이 어쩌구 저쩌구 <br /> 내용이 어쩌구
			저쩌구 <br /> 내용이 어쩌구 저쩌구 <br />
		</div>
	</div>
</body>
</html>