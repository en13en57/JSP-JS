<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윈도우 객체</title>
<script type="text/javascript">
	window.onload = function(){
		
	
	}
	function getName(){
		// 원본 창에서 새창으로 넘기기
		var win = open('form2.jsp?msg=' + encodeURIComponent("메세지 입력!!!"));
		
	}
</script>
</head>
<body>
	<h1>새로운 창 열기</h1>
	이름 : <input type="text" id="name" name="name" disabled="disabled" />
	<button onclick="getName()">새창으로 입력 입력받기</button>
</body>
</html>