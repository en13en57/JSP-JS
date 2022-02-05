<%@page import="kr.green.cal.vo.CalendarVO"%>
<%@page import="kr.green.cal.service.CalendarService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 스트링으로 받기 
	String title = request.getParameter("title");
	String start1 = request.getParameter("start1");
	String end1 = request.getParameter("end1");
	String allDay = request.getParameter("allDay");
	String content = request.getParameter("content");
	String textColor = request.getParameter("textColor");
	String backgroundColor = request.getParameter("backgroundColor");
	
	System.out.println("start1 : " + start1);
	System.out.println("end1 : " + end1);
	System.out.println("title : " + title);
	System.out.println("allDay : " + allDay);
	System.out.println("content : " + content);
	System.out.println("textColor : " + textColor);
	System.out.println("backgroundColor : " + backgroundColor);
	
	// 받은 데이터를 VO에 넣자
	CalendarVO vo = new CalendarVO();
	vo.setStart(start1);
	vo.setEnd(end1);
	vo.setTitle(title);
	vo.setContent(content);
	vo.setTextColor(textColor);
	vo.setBackgroundColor(backgroundColor);
	vo.setAllday(Boolean.parseBoolean(allDay));
	
	// 서비스를 호출하여 저장을 수행하면 된다.
	CalendarService.getInstance().insert(vo);
	

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
	
</body>
</html>