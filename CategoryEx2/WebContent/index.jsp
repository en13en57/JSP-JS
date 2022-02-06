<%@page import="java.util.List"%>
<%@page import="kr.green.category.service.CategoryServiceImpl"%>
<%@page import="kr.green.category.service.CategoryService"%>
<%@page import="kr.green.category.vo.CategoryVO"%>
<%@page import="kr.green.category.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<CategoryVO> list = CategoryServiceImpl.getInstance().selectList();
	request.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%-- 대항목(원본글) 추가하는 폼  --%>
	<form action="insert.jsp" method="post">
		<input type="text" name="item" id="item" placeholder="대항목입력" required="required"  size="10"/>
		<input type="submit" value="추가" />	
	</form>
	<hr />
	<%-- 출력 부분 --%>
	<c:if test="${empty list }"> <%-- 리스트가 비어 있다면 --%>
		등록된 아이템이 없습니다. <br />
	</c:if>

	<c:if test="${not empty list }"> <%-- 리스트에 내용이 있다면 --%>
		<c:forEach var="vo" items="${list }"> <%-- 반복 --%>
			<form action="reply.jsp" method="post">
				<c:if test="${vo.lev>0 }"> <%-- 자식이라면 --%>
					<c:forEach begin="1" end="${vo.lev }"> <%-- 앞에 레벨수 만큼 공백을 출력해준다. --%>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					☞
				</c:if>
				<c:if test="${vo.del=='Y' }">
					<span id="oldItem${vo.idx }">${vo.item }</span> 
					<%-- 원본글의 ref, seq, lev를 가지고 넘어간다. --%>
					<input type="hidden" name="ref" value="${vo.ref }" />
					<input type="hidden" name="seq" value="${vo.seq }" />
					<input type="hidden" name="lev" value="${vo.lev }" />
					<input type="text" name="item" id="item${vo.idx }" placeholder="항목입력" required="required" size="10"/>
					<input type="submit" value="추가" />	
					<input type="button" value="수정" onclick="updateItem(${vo.idx})"/>
					
					<input type="button" value="삭제" onclick="deleteItem(${vo.idx })"/>
				</c:if>
				<c:if test="${vo.del=='N' }">
					<span style="color:red">삭제된 항목</span> 
				</c:if>
				
			</form>
		</c:forEach>
	</c:if>
	<script type="text/javascript">
		function updateItem(idx){
			// alert($("#oldItem"+idx).html());
			sendPost("updateItem.jsp", {"idx":idx, "item":$("#item"+idx).val()});
		}
		function deleteItem(idx){
			// alert($("#oldItem"+idx).html());
			sendPost("deleteItem.jsp", {"idx":idx});
		}
	</script>
</body>
</html>