<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음력데이터를 읽어보자</title>
<style type="text/css">
	table{
		widows: 80%; margin: auto;
	}
</style>
</head>
<body>
	<%
	String urlAddress = "https://astro.kasi.re.kr/life/pageView/5";
	Document document = Jsoup.connect(urlAddress).get();
	
	out.println("<table border='1'>");
	out.println(document.select("table tbody tr").get(0).html());
	out.println("</table>");
	%>
</body>
</html>