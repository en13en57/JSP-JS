<%@tag import="java.util.Date"%>
<%@tag import="java.text.SimpleDateFormat"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
	out.println("현재 : " + sdf.format(new Date()));
%>