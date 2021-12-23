<%@page import="java.io.File"%>
<%@page import="kr.green.poll.vo.PollUtil"%>
<%@page import="kr.green.poll.vo.PollVO"%>
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
	<form action="pollOk.jsp" method="post">
	<%-- 넘길때 파일번호도 넘겨줘야 한다. --%>
	<input type="hidden" value="<%=fileNo%>" name="no">
	<table>
		<tr>
			<td class="title">설문조사 프로그램 Ver 1.0</td>
		</tr>
		<tr>
			<td class="subject">설문 : <%=pollVO.getTitle() %></td>
		</tr>
		<tr>
			<td>
				<%
					int i=0;
					for(String item : pollVO.getItems()){
				%>
					<label> 
						<input type="radio" value="<%=i++%>" name="poll" <%=(i==1) ? " checked='checked' " : "" %> >
						<%=item %> 
					</label>
					<br />
				<%						
					}
				%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="투표하기" />
				<input type="button" value="결과보기" onclick="location.href='pollResult.jsp?no=<%=fileNo%>'"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>