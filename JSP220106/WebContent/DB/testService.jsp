<%@page import="kr.green.memo.service.MemoService"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<MemoVO> list = MemoService.getInstance().selectList();

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
	<h1>글목록</h1>
	<hr />
	<%
		if(list!=null){
			
		for(MemoVO vo : list){
			out.println(vo + "<br>");
		}
		}else{
			out.println("등록된 글이 없습니다.");
		}
	%>
	<hr />
	<form action="insertOk.jsp" method="post">
		<input type="text" name="name" required="required" placeholder="이름입력"/>
		<input type="password" name="password" required="required" placeholder="비번입력"/>
		<input type="text" name="content" required="required" placeholder="내용입력" size="80" />
		<input type="submit" value="저장하기" />
		<br />
	</form>
</body>
</html>