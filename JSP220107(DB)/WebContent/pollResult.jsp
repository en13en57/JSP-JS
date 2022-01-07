<%@page import="kr.green.poll.service.PollService"%>
<%@page import="kr.green.poll.vo.PollVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 결과를 보려면 투표 1개를 가져와야 한다.
	int idx = 0;
	// 글번호가 제대로 넘어오지 않은 경우 처리
	try{
		idx = Integer.parseInt(request.getParameter("idx"));
	}catch(Exception e){
		response.sendRedirect("pollList.jsp");
		return;
	}
	PollVO vo = PollService.getInstance().selectByIdx(idx);
	if(vo==null){ // 해당 번호의 글이 없다면
		response.sendRedirect("pollList.jsp");
		return;
	}
	// 여기까지 왔다면 투표를 읽어오기 성공!!
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 결과보기</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
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
	<table>
		<tr>
			<td class="title">설문조사 프로그램 Ver 1.0</td>
		</tr>
		<tr>
			<td align="right">총 투표수 : <%=vo.getTotalCount() %>표</td>
		</tr>
		<tr>
			<td class="subject">설문 : <%=vo.getSubject() %></td>
		</tr>
		<tr>
			<td>
				<%
					String[] colors = "red,green,blue,pink,brown,skyblue".split(",");
					String[] items = vo.getPollItems();
					int[]    counts = vo.getPollCounts();
					for(int i=0;i<items.length;i++){
						out.print((i+1) + ". " + items[i] + "(" + counts[i] + "표, " + vo.getPercent(i) +"%)<br>");
						out.print("<hr size='20' align='left' width='" + vo.getPercent(i)
						          + "%' color='" + colors[i%colors.length] + "'/>");
					}
				%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" class="btn btn-outline-success btn-sm"  value="돌아가기" onclick="location.href='pollList.jsp'"/>
			</td>
		</tr>
	</table>
</body>
</html>