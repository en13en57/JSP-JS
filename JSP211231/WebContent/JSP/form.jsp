<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>데이터 전송하기</h1>
	<form action="result1.jsp" method="post">
		이름 : <input type="text" name="name" /> <br />
		나이 : <input type="text" name="age"  max="100" min ="0" value ="20" /> <br />
		성별 : 
		<label> <input type="checkbox" value="true" name="gender" />남자</label>
		<label> <input type="checkbox" value="true" name="gender" />여자</label>
		<br />
		<input type="submit" value="전송"/>
	</form>
</body>
</html>