<%@page import="kr.green.memo.service.MemoService"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="kr.green.memo.vo.PagingVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 자주 코딩하는 코드가 있다면 별도로 만들어 놓고 필요시 include하면 편히라다. --%>
<%@ include file="include.jsp" %>
<%


	// 페이지 정보를 얻어오자!
	PagingVO<MemoVO> pagingVO = MemoService.getInstance().selectList(currentPage, pageSize, blockSize);
	request.setAttribute("pv", pagingVO); // EL로 출력하기 위해서는 영역에 저장되어야한다.
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1줄 메모장 프로그램</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript">

</script>
<style type="text/css">
	table {padding: 5px; width: 900px; margin: auto;}
	th {border: 1px solid gray; background-color: silver; padding: 5px; text-align: center;}
	td {border: 1px solid gray; padding: 5px; text-align: center;}
	.title {font-size: 18pt; text-align: center; border: none;}
	.sub_title {text-align: right; border: none;}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan="5" class="title">1줄 메모장 Ver 0.09</td>
		</tr>
		<tr>
			<td colspan="5" class="sub_title">${pv.pageInfo }</td>
		</tr>
		<tr>
			<th>No</th>		
			<th>작성자</th>
			<th width="60%">내용</th>
			<th>작성일</th>
			<th>IP</th>
		</tr>
		<% 
			if(pagingVO.getTotalCount()==0){
		%>
		<tr>
			<td colspan="5" style="text-align: center;">등록된 글이 없습니다.</td>
		</tr>
		<%
			}else{
				for(MemoVO vo : pagingVO.getList()){
					
		%>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getName() %></td>
				<td style="text-align: left;"><%=vo.getContent() %></td>
				<td><%=vo.getRegDate() %></td>
				<td><%=vo.getIp() %></td>
			</tr>				
		<%
				}
		%>
			<tr>
				<td colspan="5" style="text-align: center; border: none;">${pv.pageList }</td>
			</tr>
		<%
			}
		%>				
	</table>
</body>
</html>