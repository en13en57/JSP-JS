<%@page import="kr.green.board.vo.BoardVO"%>
<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "include.jsp" %>
<%
	BoardVO vo = BoardServiceImpl.getInstance().selectByIdx(idx, incHit==1);
	request.setAttribute("vo", vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 내용</title>
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
	th {padding: 5px; border: 1px solid gray; background-color: silver;text-align: center;}
	td {padding: 5px; border: 1px solid gray; text-align: left;}
	.title {border: none; font-size: 20pt; text-align: center;}
	.item { width: 100px; background-color: silver;}
	.but {float: right;}
</style>
</head>
<body>
	<table class= "table table-striped">
		<thead>
		    <tr>
		      <th class="title" scope="col" colspan="4">자유게시판 내용</th>
		    </tr>
		    <tr>
		    	<td colspan = "6" style="text-align: right; border: none;">
				<button class="btn btn-outline-success btn-sm" 
				onclick="location.href='update.jsp?p=${p}&s=${s}&b=${b}&idx=${idx }&h=0'">수정</button>
				<button class="btn btn-outline-success btn-sm" 
				onclick="location.href='delete.jsp?p=${p}&s=${s}&b=${b}&idx=${idx }&h=0'">삭제</button>
				<button class="btn btn-outline-success btn-sm" 
				onclick="location.href='index.jsp?p=${p}&s=${s}&b=${b}'">목록</button>
		    	</td>
		    </tr>
		</thead>
		    <tr>
		    	<th class="item" scope="row">이름</th>
		    	<td>
		    	<%
					// 혹시라도 이름에 태그가 입력되었다면 태그를 특수문자로 변경해준다.
					String user = vo.getName();
					user = user.replaceAll("<", "&lt;");
					out.println(user);
				%>
		    	
		    	</td>
				<th class="item" >조회수</th>
				<td>${vo.hit }</td>
		    </tr>
		    <tr>
				<th class="item"  scope="row">작성일</th>
				<td>${vo.regDate }</td>
				<th class="item">IP</th>
				<td>${vo.ip }</td>
			</tr>
			<tr>
				<th class="item">제목</th>
				<td colspan="3">
				<%
					// 혹시라도 이름에 태그가 입력되었다면 태그를 특수문자로 변경해준다.
					String subject = vo.getSubject();
					subject = subject.replaceAll("<", "&lt;");
					out.println(subject);
				%>
			</td>
			</tr>
				<tr>
					<th class="item">내용</th>
					<td colspan="3">
				<%
					// 혹시라도 이름에 태그가 입력되었다면 태그를 특수문자로 변경해준다.
					String content = vo.getContent();
					content = content.replaceAll("<", "&lt;");
					// 엔터를 <br>로 바꿔줘야 줄바꿈이 나타단다.
					content = content.replaceAll("\n", "<br>");
					out.println(content);
				
				%>
					</td>
				</tr>
		</table>
</body>
</html>