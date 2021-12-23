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
	String pollNo = request.getParameter("no");
	int no = 0;
	try{
		no = Integer.parseInt(pollNo);
	}catch(Exception e){
		; // 번호가 없거나 숫자가 아니면 0번을 가진다.
	}
	// 투표들이 배열로 저장된 파일을 읽어보자!!!
	List<PollVO> list = PollUtil.readPollList(application.getRealPath("poll"));
	PollVO pollVO = list.get(no);
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
				<input type="button" value="돌아가기" onclick="location.href='pollForm.jsp?no=<%=no%>'"/>
			</td>
		</tr>
	</table>
</body>
</html>