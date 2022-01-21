<%@page import="kr.green.category.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.green.category.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 오토커밋 취소
	try{
		List<CategoryVO> list = sqlSession.selectList("category.selectList"); 				
		request.setAttribute("list", list);		
		
		sqlSession.commit();
	}catch(Exception e){
		sqlSession.rollback();
		e.printStackTrace();
	}finally{
		if(sqlSession!=null) sqlSession.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%-- 대항목(원본글) 추가하는 폼 --%>
	<form action="insert.jsp" method="post">
		<input type="text" name="item" id="item" placeholder="대항목 입력" required="required"/>
		<input type="submit" value="대항목 추가" />
	</form>
	<hr />
	<%-- 출력 부분 --%>
	<c:if test="${empty list }"> <%-- 리스트가 비어있다면 --%>
		등록 된 아이템이 없습니다.
	</c:if>
	
	<c:if test="${not empty list }"> <%-- 리스트에 내용이 있다면 --%>
		<c:forEach var="vo" items="${list }"> <%-- 반복 --%>
			<form action="reply.jsp" method="post">
				<c:if test="${vo.lev>0 }"> <%-- 자식이라면 --%>
					<c:forEach begin="1" end="${vo.lev }"> <%-- 앞에 레벨수 만큼 공백을출력해준다. --%>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					▶
				</c:if>
				<c:if test="${vo.del=='Y' }">
					<span id="oldItem${vo.idx }">${vo.item }</span>
					<%-- 원본글의 ref, seq, lev를 가지고 넘어간다. --%>
					<input type="hidden" name="ref" value="${vo.ref }" />
					<input type="hidden" name="seq" value="${vo.seq }" />
					<input type="hidden" name="lev" value="${vo.lev }" />
					<input type="text" name="item" id="item${vo.idx }" placeholder="항목 입력" required="required"/>
					<input type="submit" value="추가" />
					<input type="button" value="수정" onclick="updateItem(${vo.idx})"/>
					
					<input type="button" value="삭제" onclick="deleteItem(${vo.idx})"/>
				</c:if>
				<c:if test="${vo.del=='N' }">
					<span style="color:red;">삭제된 항목</span>
				</c:if>
				
			</form>
		</c:forEach>	
	</c:if>
	<script type="text/javascript">
		function updateItem(idx){
			// alert($("#olditem"+idx).html());
			// alert($("#item"+idx)).val());
			sendPost("updateItem.jsp",{"idx":idx,"item":$("#item"+idx).val()});
		}
		function deleteItem(idx){
			// alert($("#olditem"+idx).html());
			// alert($("#item"+idx)).val());
			sendPost("deleteItem.jsp",{"idx":idx});
		}
	</script>
</body>
</html>