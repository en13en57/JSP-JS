<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){
		document.title = '나는 제목 !'; // 브라우저 제목 변경 코드
		// 문서 객체에서 마우스가 이동하면
		document.onmousemove = function(e){
			document.title = "마우스 좌표(" + (e['x']) + ", " + (e['y'])+")";
		}
	};
</script>
<style type="text/css">

</style>
</head>
<body>
하하하하하
</body>
</html>