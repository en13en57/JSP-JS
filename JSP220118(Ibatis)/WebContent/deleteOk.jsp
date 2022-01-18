<%@page import="kr.green.memo.service.MemoService"%>
<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 한글 받기 위해서
	request.setCharacterEncoding("UTF-8");
	// POST전송이 아니라면 -- 누군가가 직접 이 파일을 실행 했다면
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("memoList.jsp");
		return;
	}
%>
<%@ include file="include.jsp" %> <%-- 페이지번호/페이지사이즈/블록사이즈 받기 --%>
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
<%
// 넘어온 데이터를 받고
%>
<jsp:useBean id="vo" class="kr.green.memo.vo.MemoVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<jsp:setProperty property="ip" name="vo" value="${pageContext.request.remoteAddr}"/>

<%
// 데이터가 올바르면 서비스 클래스를 호출하여 삭제하고
MemoService.getInstance().delete(vo);

// 리스트로 돌아간다.
response.sendRedirect("memoList.jsp?p=" + currentPage + "&s=" + pageSize + "&b=" + blockSize);
%>
</body>
</html>