<%@page import="kr.green.poll.vo.PollUtil"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">

</script>
<style type="text/css">
	table {
		width: 450px; border: 1px solid gray; margin: auto;	padding: 5px;
	}
	.title {
		background-color: black; color: white; text-align: center;
		font-size: 15pt; font-weight: bold; padding: 5px;
	}
	.subject {
		font-size: 12pt; font-weight: bold; padding: 5px;
	}
</style>
</head>
<body>
	<%
	// 파일 번호를 받아서 해당 파일을 읽어보자!!!
	request.setCharacterEncoding("UTF-8");
	String fileNo = request.getParameter("no");
	if(fileNo==null || fileNo.trim().equals("")){ // 파일 번호가 넘어오지 않았다면
		fileNo="1"; // 기본값으로 1을 가지자!!!
	}
	
	// 데이터 파일을 읽어서 출력해보자
	String path = application.getRealPath("poll");
	String fileName = "poll0" + fileNo + ".json";
	
	// 해당 파일이 존재하지 않으면 무조건 1번을 열도록 하자!!!
	File file = new File(path + File.separator + fileName);
	if(!file.exists()){
		fileNo = "1";
		fileName = "poll0" + fileNo + ".json";
	}
	PollVO pollVO = PollUtil.readPollVO(path, fileName);
	%>
	<table>
		<tr>
			<td class="title">설문조사 프로그램 Ver 1.0</td>
		</tr>
		<tr>
			<td align="right">총 투표수 : <%=pollVO.getTotalCount() %>표</td>
		</tr>
		<tr>
			<td class="subject">설문 : <%=pollVO.getTitle() %></td>
		</tr>
		<tr>
			<td>
				<%
					String[] colors = "red,green,blue,pink,brown,skyblue".split(",");
					List<String> items = pollVO.getItems();
					List<Integer> counts = pollVO.getCounts();
					for(int i=0;i<items.size();i++){
						out.print((i+1) + ". " + items.get(i) + "(" + counts.get(i) + "표, " + pollVO.getPercent(i) +")<br>");
						out.print("<hr size='10' align='left' width='" + pollVO.getPercent(i) 
						          + "' color='" + colors[i%colors.length] + "'/>");
					}
				%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="돌아가기" onclick="location.href='pollForm.jsp?no=<%=fileNo%>'"/>
			</td>
		</tr>
	</table>
</body>
</html>