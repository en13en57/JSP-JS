<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery프레임워크 충돌방지</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	// 이미 다른 자바스크립트 라이브러리를 사용하고 있는데 그 라이브러리의 접두어가 $라면
	// jquery에서 $와 충돌이 발생한다. 어떻게 해야 할까?
	
	$.noConflict(); // $접두어를 해제시킨다. 그럼 $대신 jQuery를 접두어로 사용해야 한다.
	
	jQuery(function(){
		alert('시작!!!!');
	});
	
	var jq = jQuery; // 접두어를 바꿔준다.
	
	jq(function(){
		alert('하하하 $대신 jq를 쓴다.');
	});
	
</script>
<style type="text/css">

</style>
</head>
<body>

</body>
</html>