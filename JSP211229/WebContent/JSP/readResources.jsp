<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리소스 파일을 읽어보자!!!</title>
</head>
<body>
	<h1>1. 천자문을 읽어보자!!</h1>
	<%
		// application.getRealPath("/data/chunja.txt") : 경로를 String객체로 얻기
		Scanner sc = new Scanner(new File(application.getRealPath("/data/chunja.txt")));
		while(sc.hasNextLine()){
			out.println(sc.nextLine() + "<br>");
		}
	%>
	<hr />
	<h1>2. 천자문을 읽어보자!!</h1>
	<%
		// application.getResource("/data/chunja.txt") 자원을 URL로 리턴
		Scanner sc2 = new Scanner(application.getResource("/data/chunja.txt").openStream());
		while(sc2.hasNextLine()){
			out.println(sc2.nextLine() + "<br>");
		}
	%>
	<hr />
	<h1>3. 천자문을 읽어보자!!</h1>
	<%
		// application.getResourceAsStream("/data/chunja.txt") 자원을 스트림으로 리턴
		Scanner sc3 = new Scanner(application.getResourceAsStream("/data/chunja.txt"));
		while(sc3.hasNextLine()){
			out.println(sc3.nextLine() + "<br>");
		}
	%>
	<hr />
	<%
		// 이미지를 base64로 출력하기
		byte[] images = Files.readAllBytes(Paths.get(application.getRealPath("/data/a.jpg")));
		String url = "data:image/jpeg;base64," + Base64.encodeBase64String(images);
	%>
	<img src="<%=url %>">
	<img src="data/a.jpg">
</body>
</html>