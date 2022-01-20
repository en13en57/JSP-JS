<%@page import="kr.green.board.vo.BoardVO"%>
<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "include.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script> <!-- 추가 -->
<script type="text/javascript">
	function resetForm(){
		$("#m").val(1); // 모드를 저장으로
		$("#cidx").val(0); // 저장에는 글번호가 없다.
		$("#submitBtn").val("저장"); // 버튼의 제목 변경
		$("#cancelBtn").css("visibility","hidden"); // 취소버튼을 숨긴다.
		$("#name").val(""); // 이름을 지운다.
		$("#password").val(""); // 비번을 지운다.
		$("#content").val(""); // 내용을 지운다.
	}
	
	function updateForm(idx){
		$("#m").val(2); // 모드를 수정으로
		$("#cidx").val(idx); // 수정에는 글번호가 있다.
		$("#submitBtn").val("수정"); // 버튼의 제목 변경
		$("#cancelBtn").css("visibility","visible"); // 취소버튼을 보인다.
		$("#name").val($("#name"+idx).html()); // 이름을 표시한다.
		$("#password").val(""); // 비번을 지운다.
		$("#content").val($("#content"+idx).html()); // 내용을 표시한다.
	}
	
	function deleteForm(idx){
		$("#m").val(3); // 모드를 삭제로
		$("#cidx").val(idx); // 삭제에는 글번호가 있다.
		$("#submitBtn").val("삭제"); // 버튼의 제목 변경
		$("#cancelBtn").css("visibility","visible"); // 취소버튼을 보인다.
		$("#name").val($("#name"+idx).html()); // 이름을 표시한다.
		$("#password").val(""); // 비번을 지운다.
		$("#content").val($("#content"+idx).html()); // 내용을 표시한다.
	}
	
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
				onclick='sendPost("update.jsp", {"p":${p},"s":${s },"b":${b },"idx":${idx },"h":0})'>수정</button>
				<button class="btn btn-outline-success btn-sm" 
				onclick='sendPost("delete.jsp", {"p":${p},"s":${s },"b":${b },"idx":${idx },"h":0})'>삭제</button>
				<button class="btn btn-outline-success btn-sm" 
				onclick='sendPost("index.jsp", {"p":${p},"s":${s },"b":${b }})'>목록</button>
		    	</td>
		    </tr>
		</thead>
		    <tr>
		    	<th class="item" scope="row">이름</th>
		    	<td>
					<c:out value="${vo.name }"></c:out>		    	
		    	</td>
				<th class="item" >조회수</th>
				<td>${vo.hit }</td>
		    </tr>
		    <tr>
				<th class="item"  scope="row">작성일</th>
				<td>
					<fmt:formatDate value="${vo.regDate }" pattern="yy-MM-dd hh:mm:ss"/>
				</td>
				<th class="item">IP</th>
				<td>${vo.ip }</td>
			</tr>
			<tr>
				<th class="item">제목</th>
				<td colspan="3">
				<c:out value="${vo.subject }"></c:out>
				</td>
			</tr>
			<tr>
				<th class="item">내용</th>
				<td colspan="3">
					<c:set var="content" value="${vo.content }"/>
					<%-- 태그무시 --%>
					<c:set var="content" value="${fn:replace(content,'<','&lt;') }"/>
					<%-- \n을 <br>로 변경 --%>
					<c:set var="content" value="${fn:replace(content,newLine,br) }"/>
					${content }
				</td>
			</tr>
			<%-- 이 부분에서 댓글 처리를 해야한다. --%>
			<tr>
				<%-- 댓글 입력폼 --%>
				<td colspan="4" style="border:none">
					<div>
						<form action="commentUpdateOk.jsp" method="post">
							<%-- 댓글을 저장/수정/삭제하고 다시 view로 와야하기 때문에 많은 값을 숨겨서 가져가야한다. --%>
							<input type="hidden" name="idx" id="idx" value="${idx }" />
							<input type="hidden" name="p" id="p" value="${p }" />
							<input type="hidden" name="s" id="s" value="${s }" />
							<input type="hidden" name="b" id="b" value="${b }" />
							<input type="hidden" name="h" id="h" value="0" />
							<input type="hidden" name="m" id="m" value="1" />
							<input type="hidden" name="cidx" id="cidx" value="0" />
							<input type="text" name = "name" id="name" placeholder="이름입력" required="required" tabindex="1"/>
							<input type="password" name = "password" id="password" placeholder="비번입력" required="required" tabindex="2"/>
							<input type="submit" value="저장" id="submitBtn" class="btn btn-outline-warning btn-sm" tabindex="4"/> <br>
							<input type="button" value="취소" id="cancelBtn" class="btn btn-outline-warning btn-sm" style="visibility: hidden;" onclick="resetForm()" />
							<br />
							<textarea rows="5" cols="80" style="margin-top: 10px"name="content" id="content" required="required"tabindex="3"></textarea>
						</form>
					</div>
					<hr />
					<%-- 댓글 리스트 출력 --%>
					<c:if test="${empty vo.commentList }">
						<div style="border: 1px solid gray; text-align: center; padding: 5px;">등록된 댓글이 없습니다.</div>
					</c:if>
					<c:if test="${not empty vo.commentList }">
						<c:forEach var="cvo" items="${vo.commentList }">
							<div style="border: 1px solid gray; text-align: center; padding: 5px; margin-bottom: 5px;">
								<%-- 댓글 제목(상단) --%>
								<div style="border: 1px solid gray; padding: 5px; background-color: silver;">
									<c:out value="${cvo.name }"/> 님이
									${cvo.ip }에서
									<fmt:formatDate value="${cvo.regDate }" pattern="yyyy년 MM월 dd일(E요일) hh:mm:ss"/>
									에 남긴 글...

										<%-- 수정/삭제할때 가지고 갈 내용 숨겨서 넘기자 --%>
										<div style="display: none;" id="name${cvo.idx }">${cvo.name }</div>
										<div style="display: none;" id="content${cvo.idx }">${cvo.content }</div>

									<button class="btn btn-outline-warning btn-sm" onclick="updateForm(${cvo.idx})">수정</button>
									<button class="btn btn-outline-warning btn-sm" onclick="deleteForm(${cvo.idx})">삭제</button>
								</div>
								<%-- 댓글 내용(하단) --%>
									<c:set var="c" value="${cvo.content }"/>
									<%-- 태그무시 --%>
									<c:set var="c" value="${fn:replace(c,'<','&lt;') }"/>
									<%-- \n을 <br>로 변경 --%>
									<c:set var="c" value="${fn:replace(c,newLine,br) }"/>
									${c }
							</div>
						</c:forEach>
					</c:if>
				</td>
			</tr>
		</table>
</body>
</html>