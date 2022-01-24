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
	<form method="POST" enctype="multipart/form-data" action="upload4.jsp">
		<%-- cos를 이용하여 여러개를 업로드 하려면 name속성값이 모두 달라야 합니다. --%>
		파일 1 : <input type="file" name="upfile1"><br />
		파일 2 : <input type="file" name="upfile2"><br />
		파일 3 : <input type="file" name="upfile3"><br />
		파일 4 : <input type="file" name="upfile4"><br />
		파일 5 : <input type="file" name="upfile5"><br />
		내용: <input type="text" name="note"><br /> <br /> 
		<input type="submit" value="업로드">
	</form>
</body>
</html>