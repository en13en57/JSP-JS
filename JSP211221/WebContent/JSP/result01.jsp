<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송된 값을 처리하는 파일</title>
<% 
	// POST전송일 경우 톰캣 9에서는 한글이 깨진다.
	// 그래서 데이터를 받기전에 인코딩 타입을 꼭 지정하여 주어야 한다.
	request.setCharacterEncoding("UTF-8");
	
	// 넘어온 데이터를 1개씩 받기
	// 무조건 String이다. 형변환해서 사용해야 함
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");

	// name속성의 값이 여러개라면 getParameter로 못받는다
	// 맨앞의 1개만 받는다.
	// String language = request.getParameter("language");

	// name속성의 값이 여러개라면 getParameter 배열로 받는다
	String[] language = request.getParameterValues("language");

%>

<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%=name %>씨 (<%=age %>살, <%=gender %>)
	행님이라 불러 ! <br />
	수강과목 : 
	<%
		if(language != null && language.length>0){
			for(String l : language){
				out.println(l + " ");
			}
		}
	%>
	<br />
</body>
</html>