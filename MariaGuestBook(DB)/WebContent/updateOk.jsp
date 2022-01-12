<%@page import="kr.green.guest.service.GuestBookService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<%
	//POST전송이 아니라면 -- 누군가가 직접 이 파일을 실행 했다면
	if(!request.getMethod().equals("POST")){
	response.sendRedirect("memoList.jsp");
	return;
}
%>
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
	<%-- 1. 데이터를 받는다. --%>
	<jsp:useBean id="vo" class="kr.green.guest.vo.GuestBookVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:setProperty property="ip" name="vo" value="${pageCotext.request.remoteAddr }"/>
	<%-- 2. 서비스 클래스를 호출하여 로직을 수행한다. --%>
	<%
		String queryString = "index.jsp";
		switch(mode){
		case 1:
			// 서비스의 저장 호출
			GuestBookService.getInstance().insert(vo);
			queryString += "?p=1&s=" + pageSize + "&b=" + blockSize;
			break;
		case 2:
			// 서비스의 수정 호출
			GuestBookService.getInstance().update(vo);
			queryString += "?p=" + currentPage +"&s=" + pageSize + "&b=" + blockSize;
			break;
		case 3:
			// 서비스의 삭제 호출
			GuestBookService.getInstance().delete(vo);
			queryString += "?p=" + currentPage +"&s=" + pageSize + "&b=" + blockSize;
			break;
		}
		response.sendRedirect(queryString);	
	
	
	%>	
	<%-- 3. 원하는 페이지로 간다 --%>
</body>
</html>