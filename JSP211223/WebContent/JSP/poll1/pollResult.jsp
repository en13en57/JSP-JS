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
		// 데이터 파일을 읽어서 출력해보자
		String path = application.getRealPath("poll");
		String fileName = "poll.json";
		
		FileReader fr = new FileReader(path + File.separator + fileName);
		Gson gson = new Gson();
		PollVO pollVO = gson.fromJson(fr, PollVO.class);
		fr.close();
		
		// out.println(pollVO);
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
				<input type="button" value="돌아가기" onclick="location.href='pollForm.jsp'"/>
			</td>
		</tr>
	</table>
</body>
</html>