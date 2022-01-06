<%@page import="kr.green.memo.service.MemoService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("testService.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 1. 넘어온 데이터를 받는다. --%>
	<jsp:useBean id="vo" class="kr.green.memo.vo.MemoVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:setProperty property="ip" name="vo" value="<%=request.getRemoteAddr() %>"/>
	
	<%
		// 2. 서비스를 호출하여 저장한다.
		MemoService.getInstance().insert(vo);
	    // 3. 목록으로 간다.
		response.sendRedirect("testService.jsp");
	%>
</body>
</html>