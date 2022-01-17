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
	<%-- 파라메터 받기 --%>
	받은 이름 : <%=request.getParameter("name") %> <br />
	받은 이름 : ${param.name } <br />
	
	<%
		String name = request.getParameter("name");
		if(name==null){
			out.println("손님 반갑습니다<br>");
		}else{
			out.println(name + "씨 반갑습니다<br>");
		}
	%>
	<%-- empty 삼항 연산자 문법 (사용하지 않으면 "손" 글씨가 나오질 않음)  --%>
	${empty param.name ? "손" : param.name }님 반갑습니다.<br />
</body>
</html>