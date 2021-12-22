<%@page import="kr.green.lunar.vo.LunarUtil"%>
<%@page import="kr.green.lunar.vo.LunarVO"%>
<%@page import="java.util.List"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 만년달력</title>
<style type="text/css">
	table {	width: 700px;margin: auto; border: none;}
	.title {font-size: 24pt; text-align: center; border: none;background-color: white;}
	th { border: 1px solid gray; width: 100px;padding: 10px; background-color: silver; border-radius: 20px; }
	td { border: 1px solid gray; width: 100px;padding: 10px; height: 80px; line-height: 30px; 
	     border-radius: 20px; text-align: right; vertical-align: bottom; }
	img:hover { cursor: pointer; }
</style>
</head>
<body>
	<%
		LocalDate today = LocalDate.now();
		int year = today.getYear();
		int month = today.getMonthValue();
		// 년도와 월을 받아보자
		try{
			year = Integer.parseInt(request.getParameter("yy"));
		}catch(Exception E){ // 숫자로 변환하지 못하면 현재 년도를 가지자
			;
		}
		try{
			month = Integer.parseInt(request.getParameter("mm"));
		}catch(Exception E){
			;
		}
		// 사용자가 쿼리값을 임의 변경하여 유효하지 않은 값을 만들었다면 보정을 해주어야 한다.
		if(month==0){
			month = 12;
			year--;
		}
		if(month==13){
			month = 1;
			year++;
		}
		if(month<1 || month>12) month = today.getMonthValue();
		if(year<=0) year = today.getYear();
		
		// 해당 년월의 음력데이터를 가져오자!!!
		List<LunarVO> list = LunarUtil.getLunarData(application.getRealPath("lunarData"), year, month);
		
		// 1일의 요일과 그달의 마지막 날짜를 구해서 출력해보자
		int dayOfWeekNumber = list.get(0).getSolarIntWeek(); // 1일의 요일
		 
		// 2. 그달의 마지막 날짜 구하기
		int lastDay = list.size(); // 리스트의 개수가 마지막 날짜

	%>
	<table>
		<tr>
			<th colspan="2" class="title">
			<%-- ?를 링크를 걸면 자기 자신이다. --%>
				<img src="../images/first_page.png" onclick="location.href='?yy=<%=year-1 %>&mm=<%=month %>'" />
				<img src="../images/left.png" onclick="location.href='?yy=<%=year %>&mm=<%=month-1 %>'" />
			</th>
			<th colspan="3" class="title"><%=String.format("%04d년 %02d월", year, month) %></th>
			<th colspan="2" class="title">
				<img src="../images/right.png" onclick="location.href='?yy=<%=year %>&mm=<%=month+1 %>'"  />
				<img src="../images/last_page.png" onclick="location.href='?yy=<%=year+1 %>&mm=<%=month %>'"  />
			</th>
		</tr>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
			<%
				// 1일의 요일 위치를 맞추기 위해서 공백 셀을 출력한다.
				for(int i=0;i<dayOfWeekNumber;i++){
					out.println("<td>&nbsp;</td>");
				}
				// 1일 부터 마자막 날짜까자 출력해보자
				for(LunarVO vo : list){
					
					// 토요일 마다 줄바꿈을 해준다.
					dayOfWeekNumber = vo.getSolarIntWeek();
					if(dayOfWeekNumber==6){
						out.println("<td style='background-color:skyblue;'>" 
									+ vo.getSolarDate() 
									+ "<br><span style='font-size:10pt;'>"
									// 1일은 월을 찍는다.
									+ (vo.getLunarDate().equals("01") ? vo.getLunarMonth()+"-" : "")
									+ vo.getLunarDate() + "("+ vo.getGanjiDateH() +")"
									+ "</span></td>"); // 토요일이면
					}else if(dayOfWeekNumber==0){
						out.println("<td style='background-color:pink;'>" 
									+ vo.getSolarDate() 
									+ "<br><span style='font-size:10pt;'>"
									// 1일은 월을 찍는다.
									+ (vo.getLunarDate().equals("01") ? vo.getLunarMonth()+"-" : "")
									+ vo.getLunarDate() + "("+ vo.getGanjiDateH() +")"
									+ "</span></td>"); // 일요일이면
					}else{
						out.println("<td>" 
									+ vo.getSolarDate() 
									+ "<br><span style='font-size:10pt;'>"
									// 1일은 월을 찍는다.
									+ (vo.getLunarDate().equals("01") ? vo.getLunarMonth()+"-" : "")
									+ vo.getLunarDate() + "("+ vo.getGanjiDateH() +")"
									+ "</span></td>"); // 평일이면
					}
					if(dayOfWeekNumber==6){ // 토요일이면 
						out.println("</tr>"); // 줄닫고
						if(Integer.parseInt(vo.getSolarDate(),10)!=lastDay){ // 마지막날짜가 토요일이 아니면 다음줄이 있다.
							out.println("<tr>"); // 줄열고
						}
					}
				}
				// 마지막 줄을 마무리 해보자
				if(dayOfWeekNumber<6){ // 마지막칸(토요일)까지 출력되지 않았다면 
					for(int i=dayOfWeekNumber+1;i<=6;i++){
						out.println("<td>&nbsp;</td>");
					}
				}
			%>
		</tr>
	</table>
</body>
</html>