<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 사용자가 만든 tld파일을 지정해주면 사용자가 만든 정적 메서드들을 사용 가능해진다. --%>
<%@ taglib prefix="my" uri="/my-function.tld" %>
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
<%-- 1. 자주 쓰는걸 static 메서드로 생성 --%>
<%-- 2. WEB-INF 밑에 tld 생성 --%>
<%-- 3. (내가 사용할 함수 이름 - 내가만든 클래스 풀패키지 이름 - 메서드 모양) 인수 2-3개 사용해도 됨. --%>
<%-- 4. web.xml 에 jsp-config 사용하여 (사용자 태그 등록) --%>
<%-- jsp 상단에 <%@ taglib prefix="my" uri="/my-function.tld" %>만들어야 사용 가능  --%>
	root 4의값은? : ${my:sqrt(4) } <br />
	난수 : ${my:random() } <br />
	난수 : ${my:random() } <br />
	난수 : ${my:random() } <br />
	
	<jsp:useBean id="today" class="java.util.Date"/>
	
	오늘 : ${today } <br />
	오늘 : ${my:now(today) } <br />
	오늘 : ${my:yymmdd(today) } <br />
	오늘 : ${my:mmdd(today) } <br />
	오늘 : ${my:hhmm(today) } <br />
	오늘 : ${my:hhmmss(today) } <br />
</body>
</html>