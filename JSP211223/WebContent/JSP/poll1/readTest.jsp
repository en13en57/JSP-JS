<%@page import="kr.green.poll.vo.PollVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 데이터 파일을 읽어서 출력해보자
		String path = application.getRealPath("poll");
		String fileName = "poll.json";
		
		FileReader fr = new FileReader(path + File.separator + fileName);
		Gson gson = new Gson();
		PollVO pollVO = gson.fromJson(fr, PollVO.class);
		fr.close();
		
		out.println(pollVO);
	%>
</body>
</html>