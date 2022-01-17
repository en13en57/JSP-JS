<%@page import="kr.green.el.vo.PagingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="include.jsp" %>
<%
	List<String> list = new ArrayList<>();
	for(int i=0;i<456;i++){
		list.add("String " + (i+1));
	}
	
	PagingVO<String> pagingVO = new PagingVO<>(currentPage, pageSize, blockSize, list.size());
	pagingVO.setList(list);
	request.setAttribute("pv", pagingVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</style>
</head>
<body>
	${pv.pageInfo }
	<hr />
		<c:if test="${empty pv.list }">
			등록된 글이 없습니다.
		</c:if>
		<c:if test="${not empty pv.list }">
			<c:forEach var="vo" items="${pv.list }" begin="${pv.startNo }" end="${pv.endNo }">
				${vo } <br />
			</c:forEach>
		</c:if>
	<hr />
	${pv.pageList }
	
	<%-- 이전 --%>
	<c:if test="${pv.startPage>1 }">
		<c:url var="url" value="?">
			<c:param name="p" value ="${pv.startPage-1 }"></c:param>			
			<c:param name="s" value ="${pv.pageSize }"></c:param>			
			<c:param name="b" value = "${pv.blockSize }"></c:param>			
		</c:url>
		<a href="${url }">이전</a>
	</c:if>
	<%-- 페이지 리스트 --%>
	<c:forEach var="pageNo" begin="${pv.startPage }" end="${pv.endPage }" >
		<c:if test="${pageNo==pv.currentPage }">
			[${pageNo }] 
		</c:if>
		<c:if test="${pageNo!=pv.currentPage }">
			<c:url var="url" value="?">
				<c:param name="p" value ="${pageNo }"></c:param>			
				<c:param name="s" value ="${pv.pageSize }"></c:param>			
				<c:param name="b" value = "${pv.blockSize }"></c:param>			
			</c:url>
			<a href="${url }">${pageNo }</a>
		</c:if>
	</c:forEach>
	<%-- 다음 --%>
	<c:if test="${pv.endPage<pv.totalPage }">
		<c:url var="url" value="?">
			<c:param name="p" value ="${pv.endPage+1 }"></c:param>			
			<c:param name="s" value ="${pv.pageSize }"></c:param>			
			<c:param name="b" value = "${pv.blockSize }"></c:param>			
		</c:url>
		<a href="${url }">다음</a>
	</c:if>
</body>
</html>