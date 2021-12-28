<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="4kb" autoFlush="false"%>
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
	버퍼 크기 : <%=response.getBufferSize() %>Byte <br />
	버퍼크기 : <%=out.getBufferSize() %> <br />
	남은 버퍼크기 : <%=out.getRemaining() %> <br />
	자동 보내기 : <%=out.isAutoFlush() %> <br />
	<%
		for(int i=0;i<1000;i++){
			out.println("버퍼가 꽉 찼을까? <br>");
			// autoFlush="false"라면 사용자가 매번 버퍼크기를 검사해서 보내줘야 에러가 안생긴다.
			if(out.getRemaining()<=100){
				out.println("버퍼를 보낸다~~~~~~~~~~~~~~~<br><hr>");
				out.flush(); // 버퍼의 내용을 보내고 비워라
			}
		}
	%>
</body>
</html>