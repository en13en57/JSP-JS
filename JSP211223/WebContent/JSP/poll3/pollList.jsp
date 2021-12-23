<%@page import="kr.green.poll.vo.PollUtil"%>
<%@page import="kr.green.poll.vo.PollVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 투표들이 배열로 저장된 파일을 읽어보자!!!
	List<PollVO> list = PollUtil.readPollList(application.getRealPath("poll"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 목록보기</title>
<script type="text/javascript">

</script>
<style type="text/css">
	table {
		width: 650px; border: 1px solid gray; margin: auto;	padding: 5px;
	}
	.title {
		background-color: black; color: white; text-align: center;
		font-size: 15pt; font-weight: bold; padding: 5px;
	}
	.subject {
		font-size: 12pt; font-weight: bold; padding: 5px;
	}
	td{ border: 1px solid gray; padding:5px;}
</style>
</head>
<body>
	<table>
		<tr>
			<th class="title" colspan="3">
				투표 목록
			</th>
		</tr>
		<tr>
			<th align="right" colspan="3">
				투표개수 : <%=list.size() %>개
			</th>
		</tr>
		<% 
			for(int i=0;i<list.size();i++){
				PollVO vo = list.get(i);
		%>
			<tr>
				<td align="center"><%=i+1 %></td>
				<td>
					<a href="pollForm.jsp?no=<%=i%>"><%=vo.getTitle() %></a>
					
					(<%=vo.getTotalCount() %>표)
				</td>
				<td align="center">
					<button onclick="location.href='pollForm.jsp?no=<%=i%>'">투표하기</button>
					<button onclick="location.href='pollResult.jsp?no=<%=i%>'">결과보기</button>
				</td>
			</tr>
		<% 
			}
		%>
	</table>
</body>
</html>