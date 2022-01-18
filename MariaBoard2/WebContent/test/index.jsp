<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@page import="kr.green.board.vo.BoardVO"%>
<%@page import="kr.green.board.vo.PagingVO"%>
<%@page import="kr.green.board.dao.BoardDAOImpl"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<%
	PagingVO<BoardVO> pagingVO = BoardServiceImpl.getInstance().selectList(currentPage, pageSize, blockSize);
request.setAttribute("pv", pagingVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록보기</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script src="https://kit.fontawesome.com/58dd72094a.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
.title {
	border: none;
	font-size: 20pt;
	text-align: center;
}

.sub_title {
	border: none;
	text-align: right;
}

td {
	padding: 5px;
	border: none;
	text-align: center;
}

#btn {
	float: right;
}

a:link {
	color: black;
	text-decoration: none;
} /* 링크가 걸린 모양*/
a:visited {
	color: black;
	text-decoration: none;
} /* 방문했던 링크*/
a:hover {
	color: black;
	text-decoration: none;
	font-weight: bold;
} /* 마우스오버시 모양*/
a:active {
	color: orange;
	text-decoration: none;
} /* 마우스 클릭시 모양*/
.fas {
	position: absolute;
	top:113px;
	left:175px;
}
</style>
</head>
<body>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="title" scope="col" colspan="6">자유게시판</th>
			</tr>
			<tr>
				<th class="sub_title" colspan="6" style="font-weight: lighter;">${pv.pageInfo }</th>
			</tr>
			<tr>
				<th><input type="text" name="search" id="search"
					placeholder="검색"> <i class="fas fa-search"></i></th>
				<th colspan="4"></th>
				<th><button class="btn btn-outline-success btn-sm" id="btn"
						onclick="location.href='insert.jsp?p=${pv.currentPage}&s=${pv.pageSize }&b=${pv.blockSize }'">글쓰기</button></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">No</th>
				<td width="40%">제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>IP</td>
			</tr>
			<%
				if (pagingVO.getTotalCount() == 0) {
				out.println("<tr><td scope='row' colspan='6' align='center'>등록된 글이 없습니다. </td></tr>");
			} else {
				for (BoardVO vo : pagingVO.getList()) {
			%>
			<tr>
				<th scope="row"><%=vo.getIdx()%></th>
				<td style="text-align: left;">
					<%
						// 태그 사용 금지, 20자 이상 막기
					String subject = vo.getSubject();
					subject = subject.replaceAll("<", "&lt;");
					if (subject.length() >= 20) {
						subject = subject.substring(0, 20) + "....";
					}
					%> <a title="<%=vo.getSubject() %>"
					href="view.jsp?p=${pv.currentPage }&s=${pv.pageSize }&b=${pv.blockSize }&idx=<%=vo.getIdx() %>&h=1"><%=subject%></a>
				</td>
				<td>
					<%
						// 태그 사용 금지
					String name = vo.getName();
					name = name.replaceAll("<", "&lt;");
					out.println(name);
					%>
				</td>
				<td>
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd hh:mm");
					out.println(sdf.format(vo.getRegDate()));
					%>
				</td>
				<td><%=vo.getHit()%></td>
				<td><%=vo.getIp()%></td>
			</tr>
			<%
				}
			}
			%>
		</tbody>
		<tr>
			<%
				if (pagingVO.getTotalCount() > 0) {
				out.println("<tr><td colspan='6' align='center' style='border:none;'>" + pagingVO.getPageList() + "</td></tr>");
			}
			%>

		</tr>
	</table>
</body>
</html>