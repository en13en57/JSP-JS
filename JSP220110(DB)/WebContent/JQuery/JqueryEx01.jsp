<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Jquery를 사용하기 위해서 라이브러리를 로드한다 -->
<script type="text/javascript" src="../node_modules/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">	
	// 순수 자바스크립트로 문서를 로딩후 실행시키고 싶다.
	window.onload = function(){
		alert('모두 읽었습니다. 순수 자바스크립트코드1');
	} // 재정의 했으므로 먼저 선언한 함수는 무시!
	window.onload = function(){
		alert('모두 읽었습니다. 순수 자바스크립트코드2');
	}
	// Jquery를 이용한 방법 : 문서를 로딩 후 실행 시키고 싶다.
	$(document).ready(function(){
		alert('모두 읽었습니다. Jquery1');
	});
	
	$(document).ready(function(){
		alert('모두 읽었습니다. Jquery2');
	});
	// 위의 내용을 줄여서 쓰면 다음과 같이 간단해진다.
	$(function(){
		alert('모두 읽었습니다. Jquery3');
	});
	
</script>
<style type="text/css">

</style>
</head>
<body>

</body>
</html>