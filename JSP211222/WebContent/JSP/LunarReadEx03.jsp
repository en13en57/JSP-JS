<%@page import="kr.green.lunar.vo.LunarUtil"%>
<%@page import="kr.green.lunar.vo.LunarVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음력데이터를 읽어보자</title>
<script type="text/javascript">
</script>
<style type="text/css">
	table{
		width: 80%; margin: auto;
		
	}

</style>
</head>
<body>
	<%
		List<LunarVO> list = LunarUtil.getLunarData(application.getRealPath("LunarData"), 2022,  1);
		for(LunarVO vo : list){
			out.println(vo + "<br>");
		}
		out.println("<hr>");
		
		list = LunarUtil.getLunarData(application.getRealPath("LunarData"), 2002,  8);
		for(LunarVO vo : list){
			out.println(vo + "<br>");
		}
		out.println("<hr>");
		
	%>

</body>
</html>