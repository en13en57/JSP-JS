<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.green.poll.service.PollService"%>
<%@page import="kr.green.poll.vo.PollVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<PollVO> list = PollService.getInstance().selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표목록보기</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript">
	$(function(){ // window.onload
		// id가 insertBtn을 클릭하면
		$("#insertBtn").click(function(){
			location.href = 'pollInsertForm.jsp';
		});
	});
</script>
<style type="text/css">
	table { width:800px; padding: 5px; margin: auto;}
	th { padding: 5px; background-color: silver; border: 1px solid gray;text-align: center;}
	td { padding: 5px; border: 1px solid gray;}
	.title { border: none; text-align: center; font-size: 18pt;}
	.sub_title { border: none; text-align: right; }
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan="4" class="title">투표 목록 보기</td>
		</tr>
		<tr>
			<td colspan="4" class="sub_title">
			<%
				if(list==null){
					out.println("등록된 투표 : 0개");
				}else{
					out.println("등록된 투표 : " + list.size() + "개");
				}
			%>
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th width="70%">투표제목</th>
			<th>시작일</th>
			<th>종료일</th>
		</tr>
		<%
			if(list!=null){
				for(PollVO vo : list){
					out.println("<tr align='center'>");
					out.println("<td>");
					out.println(vo.getIdx());
					out.println("</td>");
					out.println("<td align='left'>");
					out.println(vo.getSubject());
					// 오늘의 날짜를 0000-00-00형식으로 만든다.
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String today = sdf.format(new Date());
					// 오늘이 시작일과 종료일 사이에 있다면 투표하기 버튼을 만들어준다.
					if(today.compareTo(vo.getStartDate())>=0 && today.compareTo(vo.getEndDate())<=0){
		%>
		<button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='pollForm.jsp?idx=<%=vo.getIdx()%>'">
		투표하기
		</button>
		<%						
					}
		%>
		<button type="button" class="btn btn-outline-success btn-sm"  onclick="location.href='pollResult.jsp?idx=<%=vo.getIdx()%>'">
		결과보기
		</button>
		<%						
					out.println("</td>");
					out.println("<td>");
					out.println(vo.getStartDate());
					out.println("</td>");
					out.println("<td>");
					out.println(vo.getEndDate());
					out.println("</td>");
					out.println("</tr>");
				}
			}else{
				out.println("<tr><td colspan='4' align='center'>등록된 투표가 없습니다.</td></tr>");				
			}
		%>
		<tr>
			<td colspan="4" align="right" style="border: none;">
				<button type="button" class="btn btn-outline-success btn-sm" id="insertBtn">새로운 투표 등록하기</button>
			</td>
		</tr>
	</table>
</body>
</html>