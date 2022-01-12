<%@page import="kr.green.guest.vo.PagingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int currentPage = 1;
	try{
		currentPage = Integer.parseInt(request.getParameter("p"));
	}catch(Exception e) { ; }

	int pageSize = 10;
	try{
		pageSize = Integer.parseInt(request.getParameter("s"));
	}catch(Exception e) { ; }

	int blockSize = 10;
	try{
		blockSize = Integer.parseInt(request.getParameter("b"));
	}catch(Exception e) { ; }


	List<String> list = new ArrayList<>();
	for(int i=0;i<456;i++){
		list.add("String " + (i+1));
	}

	PagingVO<String> pagingVO = new PagingVO<>(currentPage, pageSize, blockSize, list.size());
	pagingVO.setList(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%=pagingVO.getPageInfo() %> <br /><hr />
	<%//=pagingVO %>
	<%
		for(int i=pagingVO.getStartNo();i<=pagingVO.getEndNo();i++){
			out.println(list.get(i) + "<br>");
		}
	%>
	<br /><hr />
	<%=pagingVO.getPageList() %>
</body>
</html>