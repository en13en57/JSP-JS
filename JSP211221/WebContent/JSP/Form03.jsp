<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버에 데이터를 전송하기 위한 폼</title>
</head>
<body>
	<form action="result03.jsp" method="post">
		이름 : <input type="text" name="name" /> <br />
		나이 : <input type="text" name="age" /> <br />
		성별 : 
		<%-- radio에 value속성을 주지 않으면 값을 받을 수 없다. --%>
		<label><input type="radio" value="남자" name="gender"/> 남자</label> 
		<label><input type="radio" value="여자" name="gender" checked="checked"/> 여자</label>  <br />
		수강과목 : 
		<label><input type="checkbox" name="language" value="HTML" />HTML</label>
		<label><input type="checkbox" name="language" value="CSS" />CSS</label>
		<label><input type="checkbox" name="language" value="JS" />JS</label>
		<label><input type="checkbox" name="language" value="JAVA" />JAVA</label>
		<label><input type="checkbox" name="language" value="JSP" />JSP</label> <br />
		<input type="submit" value="보내기" />
	</form>
</body>
</html>