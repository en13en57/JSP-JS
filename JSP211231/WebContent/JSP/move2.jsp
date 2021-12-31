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
	<jsp:useBean id="cv" class="kr.green.session.CommonVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="cv"/>
	<h1>페이지이동</h1>
	현재페이지 :  ${cv.currentPage} <br />
	페이지당 글 수  : ${cv.sizeOfPage} 개 <br />
	블록당 개수 : ${cv.sizeOfBlock} 개 <br />
	<hr />
	<% for(int i=1;i<=10;i++){ %>
		<% if(i!=cv.getCurrentPage()){ %>
			[<a href="?p=<%=i%>&s=10&b=-1"><%=i %></a>]
		<% }else{ %>
			[<%=i %>] 		 
	<% 	   }
		}
	%>
</body>
</html>