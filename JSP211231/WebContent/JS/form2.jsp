<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String msg = request.getParameter("msg");
%>
<script type="text/javascript">
	window.onload = function(){
		alert("'<%=msg%>'");
		document.getElementById("msg").innerHTML = "<%=msg%>";
	}
	function setData(){
		var value = document.getElementById("content").value;
		// alert(value);
		// 원본 창에 값넣기
		window.opener.document.getElementById("name").value = value;
		// 나 닫기
		self.close();
	}
</script>
<style type="text/css">

</style>
</head>
<body>
	<div id="msg">하하하</div>
	<input type="text" id="content" />
	<button onclick="setData();">입력값 원본창으로 보내기</button>
</body>
</html>