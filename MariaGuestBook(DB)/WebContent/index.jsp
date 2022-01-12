<%@page import="kr.green.guest.service.GuestBookService"%>
<%@page import="kr.green.guest.vo.GuestBookVO"%>
<%@page import="kr.green.guest.vo.PagingVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 공통 코드를 삽입한다. --%>
<%@ include file="include.jsp" %>
<%-- 글을 읽어온다. --%>
<%
	PagingVO<GuestBookVO> pagingVO = GuestBookService.getInstance().selectList(currentPage, pageSize, blockSize);
	request.setAttribute("pv", pagingVO); // EL(표현언어)로 출력하려면 영역에 저장한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 목록 보기</title>
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
	table { width: 800px; margin: auto; padding: 10px;}
	td{ border: 1px solid gray; padding: 5px; }
	.title {font-size: 20pt; text-align: center;border: none;}
	.sub_title {text-align: right;border: none;}
	.page_list {text-align: center;border: none;}
</style>
</head>
<body>
	<table>
		<tr>
			<td class="title">방명록 프로그램 Ver 0.009</td>
		</tr>
		<tr>
			<td class="sub_title">${pv.pageInfo }</td>
		</tr>
		<%-- 글 1개당 1개의 행 --%>
		<%
			if(pagingVO.getTotalCount()==0){
		%>
		<tr>
			<td align="center">
				등록된 내용이 없습니다.
			</td>
		</tr>
		<%
			}else{
				// 글번호는 계산해서 출력해 보자
				int no = pagingVO.getTotalCount() - (pagingVO.getCurrentPage()-1) * pagingVO.getPageSize();
				for(GuestBookVO vo : pagingVO.getList()){
		%>
		<tr>
			<td style="background-color: silver">
				<strong><%=no-- %></strong>. 
				<strong><%=vo.getName() %></strong>님이
				<strong><%=vo.getIp() %></strong>에서 
				<strong><%=vo.getRegDate() %></strong>에 남긴글
				<%-- 수정/삭제 버튼을 달자 --%>
				<button class="btn btn-outline-danger btn-sm" 
				onclick="location.href='update.jsp?p=${pv.currentPage}&s=${pv.pageSize }&b=${pv.blockSize }&idx=<%=vo.getIdx()%>'">수정</button>
				<button class="btn btn-outline-danger btn-sm" 
				onclick="location.href='delete.jsp?p=${pv.currentPage}&s=${pv.pageSize }&b=${pv.blockSize }&idx=<%=vo.getIdx()%>'">삭제</button>
				
			</td>
		</tr>
		<tr>
			<td>
				<%
					// 여기에는 내용을 찍자
					String content = vo.getContent();
					content = content.replaceAll("<", "&lt;"); // 태그무시
					// 엔터가 먹지않아 줄바꿈이 되지 않는다. 그래서 엔터를 br태그로 변경해준다. 
					content = content.replaceAll("\n", "<br>"); 
					out.println(content);
				%>
			</td>
		</tr>
		<tr>
			<td style="border: none; height: 5px; "></td>
		</tr>
		<%  
				}
			} 
		%>
		<tr>
			<td class="page_list">${pv.pageList }</td>
		</tr>
		<tr>
			<td class="sub_title">
				<%-- 글쓰기 버튼을 달자!!! --%>
				<button class="btn btn-outline-success btn-sm" 
				onclick="location.href='insert.jsp?p=${pv.currentPage}&s=${pv.pageSize }&b=${pv.blockSize }'">흔적 남기기</button>
			</td>
		</tr>
	</table>
</body>
</html>