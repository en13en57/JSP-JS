<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginModel" method="post">
		사용자 아이디 : <input type="text" name="userID" required="required" placeholder="사용자 아이디" /> <br />
		사용자 비밀번호 : <input type="password" name="password" required="required" placeholder="사용자 비밀번호" /> <br />
		<input type="submit" value="로그인하기" />
	</form>
</body>
</html>