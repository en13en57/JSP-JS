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
	<h1>jsp:useBean 액션태그 사용</h1>
	<%request.setCharacterEncoding("UTF-8"); %>
	<%-- 
		PersonVO vo = new PersonVO();
		request.setAttribute("vo",vo); 와 같다.
	 --%>
	<jsp:useBean id="vo" class="kr.green.session.PersonVO" scope="request"></jsp:useBean>
	<%-- 세터를 불러준다. 자동 형변환 --%>
	<%--
	<jsp:setProperty property="name" name="vo"/>
	<jsp:setProperty property="age" name="vo"/>
	<jsp:setProperty property="gender" name="vo"/>
	 --%>
	 <%-- 모든 세터를 불러준다. --%>
	 <jsp:setProperty property="*" name="vo"/>
	 <%-- getter를 불러준다. 잘 사용하지 않는다. EL이 더 편하다. --%>
	이름 : <jsp:getProperty property="name" name="vo"/> <br />
	나이 : <jsp:getProperty property="age" name="vo"/> <br />
	성별 : <jsp:getProperty property="gender" name="vo"/> <br />
	 
	<hr />	
	이름 : ${vo.name } <br />
	나이 : ${vo.age }세 <br />
	성별 : ${vo.gender ? "남자" : "여자"} <br />
</body>
</html>