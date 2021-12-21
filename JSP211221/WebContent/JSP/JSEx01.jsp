<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트 연습</title>
<script type="text/javascript">
	// 입력을 받아보자
	name = prompt("이름?", "홍길동"); // 입력창
	alert(name + "씨 반가워요!!"); // 경고창
	
	age = prompt("나이를 입력하세요 ?" , 0);
	alert("내년에는 "+ (age*1 + 1) + "살이네요!"); // 숫자(문자열*1) 하면 숫자로 자동 형변환된다.
	
	// 확인/취소를 받아보자!	
	if(confirm("정말 끝내시겠습니까?")){ // 확인창
		self.close(); // 나를 닫는다. 창이 닫힌다
	}
</script>
<style type="text/css">

</style>
</head>
<body>

</body>
</html>