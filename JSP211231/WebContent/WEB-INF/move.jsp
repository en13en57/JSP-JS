<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int currentPage = 1;
try{
	currentPage = Integer.parseInt(request.getParameter("p"));
}catch(Exception e){
	;
}
int sizeOfPage = 10;
try{
	sizeOfPage = Integer.parseInt(request.getParameter("s"));
}catch(Exception e){
	;
}
int sizeOfBlock = 10;
try{
	sizeOfBlock = Integer.parseInt(request.getParameter("b"));
}catch(Exception e){
	;
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
	<h1>페이지이동</h1>
	현재페이지 :  <%=currentPage %> <br />
	페이지당 글 수  : <%=sizeOfPage %> 개 <br />
	블록당 개수 : <%=sizeOfBlock %> 개 <br />
	<hr />
	<% for(int i=1;i<=10;i++){ %>
		<% if(i!=currentPage){ %>
			[<a href="?p=<%=i%>&s=10&b=20"><%=i %></a>]
		<% }else{ %>
			[<%=i %>] 		 
	<% 	   }
		}
	%>
</body>
</html>