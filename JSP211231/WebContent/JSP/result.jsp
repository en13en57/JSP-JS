<%@page import="kr.green.session.PersonVO"%>
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
	<h1>지금까지의 방법</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		// 하나하 받아서 형변환까지 해줘야 한다.
		String name = request.getParameter("name");
		int age = 0;
		try{
			age = Integer.parseInt(request.getParameter("age"));
		}catch(Exception e){
			;
		}
		boolean gender = true;
		try{
			gender = Boolean.parseBoolean(request.getParameter("gender"));
		}catch(Exception e){
			;
		}
		
		PersonVO vo = new PersonVO();
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		
		request.setAttribute("vo",vo);
		
	%>
	이름 : ${vo.name } <br />
	나이 : ${vo.age }세 <br />
	성별 : ${vo.gender ? "남자" : "여자"} <br />
</body>
</html>