<%@page import="java.util.List"%>
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
	<form action="pollOk.jsp" method="post">
	<%-- 넘길때 파일번호도 넘겨줘야 한다. --%>
	<input type="hidden" value="<%=no%>" name="no">
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
				<input type="button" value="결과보기" onclick="location.href='pollResult.jsp?no=<%=no%>'"/>
				<input type="button" value="목록보기" onclick="location.href='pollList.jsp'"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>