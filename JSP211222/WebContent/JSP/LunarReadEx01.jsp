<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
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
		String urlAddress ="https://astro.kasi.re.kr/life/pageView/5";
		// 해당 URL에 접속하여 문서를 얻어온다.
		Document document = Jsoup.connect(urlAddress).get();
		// 문서중에서 원하는 부분만 가져오자
		out.println("<table border='1'>");
		out.println(document.select("table tbody tr").get(0).html());
		out.println("</table>");
		
	%>

</body>
</html>