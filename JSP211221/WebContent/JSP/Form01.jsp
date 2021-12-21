<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버에 데이터를 전송하기 위한 폼</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- 서버에서 받아서 값을 전송함 기본적으로 string -->
	<!--  기본값으로 메서드를 작성하지 않을 경우 get방식으로 넘어감 -->
	<!-- POST방식일 경우 한글이 깨지므로 처리하는 쪽에 request.setCharacterEncoding("UTF-8); 작성하여준다. -->
	<form action="result01.jsp" method="post">
		<!-- 폼태그에 name을 사용하여야 한다. -->
		이름 : <input type="text" name="name" /> <br />
		나이 : <input type="text" name="age" /> <br />
		성별 : 
		<%--radio에 value속성을 주지 않으면 값을 받을 수 없다. --%>
		<label><input type="radio" value="남자" name="gender"/>남자</label>
		<label><input type="radio" value="여자" name="gender" checked="checked"/>여자</label> <br />
		수강과목 :
		<label><input type="checkbox" name="language" value="HTML"/>HTML</label>
		<label><input type="checkbox" name="language" value="CSS"/>CSS</label>
		<label><input type="checkbox" name="language" value="JS"/>JS</label>
		<label><input type="checkbox" name="language" value="JAVA"/>JAVA</label>
		<label><input type="checkbox" name="language" value="JSP"/>JSP</label> <br />
		<input type="submit" value="보내기" />
	</form>
</body>
</html>