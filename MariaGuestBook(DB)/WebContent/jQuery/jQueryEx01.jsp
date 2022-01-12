<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체의 내부 검사</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function () {
		// 일반 태그안의 내용 얻어오기
		var box1 = $("#box1").text(); // 텍스트로 얻어오기
		//$("#box2").html("<h1>" + box1 + "</h1>"); // html 태그를 인식하도록 넣어주기
		$("#box2").text("<h1>" + box1 + "</h1>"); // html 태그를 인식하도록 넣어주기

		// 폼태그의 내용 얻어오기
		var str = $("#input1").val();
		// 폼태그의 내용 변경하기
		$("#input2").val("ㅋㅋㅋㅋㅋㅋㅋㅋ");
		
		alert(str);
	});
</script>
<style type="text/css">
	div{
		width: 200px; height: 200px; padding: 5px; border: 1px solid gray; margin: 10px;
	}
</style>
</head>
<body>
	<div id="box1">하하하하하하</div>
	<div id="box2"></div>
	<input type="text" id="input1" value="호호호호"/>
	<input type="text" id="input2"/>
</body>
</html>