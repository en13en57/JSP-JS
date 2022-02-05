<%@page import="kr.green.cal.service.CalendarService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 스트링으로 받기 
	String id = request.getParameter("id");
	String start1 = request.getParameter("start1");
	String end1 = request.getParameter("end1");
	
	System.out.println("id : " + id);
	System.out.println("start1 : " + start1);
	System.out.println("end1 : " + end1);
	// 자바 날짜로 변환
	Date startDate = new Date(start1);
	Date endDate = new Date(end1);
	
	System.out.println("startDate : " + startDate);
	System.out.println("endDate : " + endDate);
	
	// DB에서 사용할 모양으로 변환
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	start1 = sdf.format(startDate);
	end1 = sdf.format(endDate);
	System.out.println("start1 : " + start1);
	System.out.println("end1 : " + end1);
	
	// 서비스 호출
	try{
		CalendarService.getInstance().updateDrop(Integer.parseInt(id), start1, end1);
	}catch(Exception e){
		System.out.println("에러당~~~~");
		e.printStackTrace();
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
	
</body>
</html>