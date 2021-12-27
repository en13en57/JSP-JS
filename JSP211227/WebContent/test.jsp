<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="kr.green.memo.service.MemoService"%>
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
	<%=MemoService.getMemo(application.getRealPath("data")) %>
	<hr />
	<%
		MemoVO vo = new MemoVO();
		vo.setName("나그네");
		vo.setPassword("123456");
		vo.setMemo("나는 이등이네!!!");
		vo.setIp(request.getRemoteAddr());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		vo.setRegDate(sdf.format(new Date()));
	
		MemoService.setMemo(application.getRealPath("data"), vo);
	%>
	<%=MemoService.getMemo(application.getRealPath("data")) %>
</body>
</html>