<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 연습</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
</style>
</head>
<body>
	<!-- 파일의 내용을 전송하기 위해서는 반드시  enctype="multipart/form-data"를 써줘야 한다. -->
	<form method="POST" enctype="multipart/form-data" action="upload5.jsp">
		파일: <input type="file" name="upfile"><br />
		내용: <input type="text" name="note"><br /> <br /> 
		<input type="submit" value="업로드">
	</form>
</body>
</html>