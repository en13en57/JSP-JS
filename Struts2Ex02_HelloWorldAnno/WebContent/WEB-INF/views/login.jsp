<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login" method="post">
			사용자 아이디 : <input type="text" name="name" id="name" required="required" placeholder="사용자 아이디"/> <br />
			사용자 비밀번호 <input type="password" name="password" id="password" required="required" placeholder="사용자 비밀번호"/>
		<input type="submit" value="로그인하기" />
	</form>
	<hr />
		<form action="login2" method="post">
			사용자 아이디 : <input type="text" name="name" id="name" required="required" placeholder="사용자 아이디"/> <br />
			사용자 비밀번호 <input type="password" name="password" id="password" required="required" placeholder="사용자 비밀번호"/>
		<input type="submit" value="로그인하기" />
	</form>
</body>
</html>