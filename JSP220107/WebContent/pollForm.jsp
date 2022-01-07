<%@page import="kr.green.poll.service.PollService"%>
<%@page import="kr.green.poll.vo.PollVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int idx = 0;
	// 글번호가 제대로 넘어오지 않은 경우 처리
	try{
		idx = Integer.parseInt(request.getParameter("idx"));
	}catch(Exception e){
		response.sendRedirect("pollList.jsp");
		return;
	}
	// 투표한개를 읽어와야 한다.
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
<title>투표 목록보기</title>
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
	<form action="pollOk.jsp" method="post">
	<table>
		<tr>
			<td class="title">설문조사 프로그램 Ver 1.0</td>
		</tr>
		<tr>
			<td class="subject">설문 : <%=vo.getSubject() %></td>
		</tr>
		<tr>
			<td>
				<%-- 글번호는 숨겨서 보낸다. --%>
				<input type="hidden" name="idx" value="<%=vo.getIdx()%>">
				<%
					int i=0;
					for(String item : vo.getPollItems()){
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
				<input type="submit"  class="btn btn-outline-success btn-sm" value="투표하기" />
				<input type="button" class="btn btn-outline-success btn-sm" value="결과보기" onclick="location.href='pollResult.jsp?idx=<%=idx%>'"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>