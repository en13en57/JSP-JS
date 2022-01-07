<%@page import="kr.green.poll.service.PollService"%>
<%@page import="kr.green.poll.vo.PollVO"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 한글을 받으려면 인코딩 타입 지정해 주어야 한다.
request.setCharacterEncoding("UTF-8");

// POST전송이 아니면 폼으로 다시 보내버린다. 
// 이코드가 없으면 이파일을 직접 실행했을때 넘어오지 않은 데이터를 
// 처리하기때문에 에러가 발생할 소지가 다분하다. 
if(!request.getMethod().equals("POST")){
	response.sendRedirect("pollList.jsp"); // 지정 페이지로 무조건 이동하라.
	return; // 여기서 종료!!
}
// 넘어온 데이터를 받는다.
String subject = request.getParameter("subject");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
String pollItems[] = request.getParameterValues("item");

// 투표 항목 수와 동일한 숫자 배열을 만든다. 
int   pollCounts[] = null;
if(pollItems!=null && pollItems.length>0){
	pollCounts = new int[pollItems.length];
	// 각각의 데이터를 VO에 넣는다.
	PollVO vo = new PollVO();
	vo.setSubject(subject);
	vo.setPollItems(pollItems);
	vo.setPollCounts(pollCounts);
	vo.setStartDate(startDate);
	vo.setEndDate(endDate);
	
	// 서비스 클래스를 호출하여 DB에 저장한다.
	PollService.getInstance().insert(vo);
	
	// 리스트로 간다.
	response.sendRedirect("pollList.jsp");
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
	제목 : <%=subject %> <br />
	시작일 : <%=startDate %> <br />
	종료일 : <%=endDate %> <br />
	항목 : <%=Arrays.toString(pollItems) %> <br />
</body>
</html>