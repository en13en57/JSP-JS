<%@page import="kr.green.memo.service.MemoServiceImpl"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="kr.green.memo.vo.PagingVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="include.jsp" %>
<%
	PagingVO<MemoVO> pagingVO = MemoServiceImpl.getInstance().selectList(currentPage, pageSize, blockSize);
	request.setAttribute("pv", pagingVO);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
<script type="text/javascript">
	$(function(){
		$("#viewCnt").change(function(){
			location.href = "?p=${pv.currentPage}&s=" + $(this).val() + "&b=${pv.blockSize}";
		});
		$("#cancelBtn").css('display','none');
	});
	
	function formCheck(){
		var value = $("#name").val();
		if(value==null || value.trim().length==0){
			alert('이름은 반드시 입력되야 합니다.')
			$("#name").val("");
			$("#name").focus();
			return false;
		}
	}

		function formCheck(){
		var value = $("#password").val();
		if(value==null || value.trim().length==0){
			alert('비밀번호 반드시 입력되야 합니다.')
			$("#password").val("");
			$("#password").focus();
			return false;
		}
	}

		function formCheck(){
		var value = $("#content").val();
		if(value==null || value.trim().length==0){
			alert('내용은 반드시 입력되야 합니다.')
			$("#content").val("");
			$("#content").focus();
			return false;
		}
	}
	  
	
	function updateMemo(idx){
		var name = $("#name"+idx).html();
		var content = $("#content"+idx).attr('title');
		
		$("#name").val(name);
		$("#content").val(content);
		$("#idx").val(idx);
		
		$("#submitBtn").val("수정");
		$("#myForm").attr("action","updateOk.jsp"); // 속성 변경
		$("#cancelBtn").css('display','inline');
		$("#password").focus();
	
	}
	// 삭제 버튼을 누르면
	function deleteMemo(idx){
		// 값을 읽는다.
		// alert(idx);
		var name = $("#name"+idx).html();
		var content = $("#content"+idx).attr('title');
		// alert(name + "\n" + content);
		// 폼에 값을 넣는다.
		$("#name").val(name);
		$("#content").val(content);
		$("#idx").val(idx);
		
		// 저장 버튼을 "삭제"으로 바꾼다.
		$("#submitBtn").val("삭제");
		// 폼의 액션값을 "deleteOk.jsp"로 바꾼다.
		$("#myForm").attr("action","deleteOk.jsp"); // 속성 변경
		// 취소버튼을 보여준다.
		$("#cancelBtn").css('display','inline');
		// 그리고 커서는 비번에 보낸다.
		$("#password").focus();
	}
	
	// 취소버튼을 누르면
	function clearMemo(){
		// 폼에 값을 지운다.
		$("#name").val("");
		$("#content").val("");
		$("#idx").val(0);
		
		// 저장 버튼으로 바꾼다.
		$("#submitBtn").val("저장");
		// 폼의 액션값을 "insertOk.jsp"로 바꾼다.
		$("#myForm").attr("action","insertOk.jsp"); // 속성 변경
		// 취소버튼을 숨겨준다.
		$("#cancelBtn").css('display','none');
		// 그리고 커서는 이름에 보낸다.
		$("#name").focus();
	}




</script>
<style type="text/css">
	#col {text-align: center;}
	#left {text-align: left;}
	.title{font-size: 18pt; text-align: center;border: none;}
	.sub_title{text-align: right;border: none;}
	td {text-align: center;}
	th {text-align: center;}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover">
		<tr>
			<th class="title" colspan="5">1줄 메모장 Ver 0.1</th>
		</tr>
		<tr>
			<td colspan="5" class="sub_title">
				${pv.pageInfo }
				<%-- ?개씩 보기를 달아보자!! --%>
				<select id="viewCnt">
					<option value="5" ${pv.pageSize==5 ? " selected='selected' " : "" }>  5개씩 보기</option>
					<option value="10"  ${pv.pageSize==10 ? " selected='selected' " : "" }>10개씩 보기</option>
					<option value="20" ${pv.pageSize==20 ? " selected='selected' " : "" }>20개씩 보기</option>
					<option value="50" ${pv.pageSize==50 ? " selected='selected' " : "" }>50개씩 보기</option>
					<option value="100" ${pv.pageSize==100 ? " selected='selected' " : "" }>100개씩 보기</option>
				</select>
			</td>
		</tr>
		<tr id="col">
			<th scope="col">No</th>
			<th scope="col">작성</th>
			<th scope="col" width="40%">내용</th>
			<th scope="col">작성일</th>
			<th scope="col">IP</th>
		</tr>
		<c:if test="${pv.totalCount==0 }">
			<tr>
				<td scope="row" colspan="5">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${pv.totalCount>0 }">
			<c:set var="no" value="${pv.totalCount - (pv.currentPage-1) * pv.pageSize }"></c:set>
				<c:forEach var="vo" items="${pv.list }">
					<tr>
						<td scope="row">${no }
							<c:set var="no" value="${no-1 }" ></c:set>
						</td>
						<td>
							<c:out value="${vo.name }"></c:out>
						</td>		
						<td id="left" >
							<c:out value="${vo.content}"></c:out>
							<input type="button" value="수정" class="btn btn-outline-success btn-sm" onclick="updateMemo(${vo.idx})"/>
							<input type="button" value="삭제" class="btn btn-outline-success btn-sm" onclick="deleteMemo(${vo.idx})"/>
						</td>		
						<td>
							<fmt:formatDate value="${vo.regDate }" pattern="yy-MM-dd"/>
						</td>		
						<td>${vo.ip}</td>		
					</tr>
				</c:forEach>
			<tr>
				<td colspan="5">
					${pv.pageList }
				</td>
			</tr>
		</c:if>	
		<tr>
			<td colspan="5">
				<form action="insertOk.jsp" method="post" id="myForm" onsubmit="return formCheck();">
					<input type="hidden" name="idx" id="idx" value="0" />

					<input type="hidden" name="p" value="${pv.currentPage }" />
					<input type="hidden" name="s" value="${pv.pageSize }" />
					<input type="hidden" name="b" value="${pv.blockSize }" />
					
					<input type="text" name="name" id="name" required="required" placeholder="이름입력" size="10"/>
					<input type="password" name="password" id="password" required="required" placeholder="비번입력" size="10" />
					<input type="text" name="content" id="content" required="required" placeholder="내용입력" size="70"/>
					<input type="submit" value="저장" id="submitBtn" class="btn btn-outline-success btn-sm"/>
					<input type="button" value="취소" id="cancelBtn" class="btn btn-outline-success btn-sm" onclick="clearMemo()"/>
				</form>			
			
			</td>
		</tr>
	</table>
</body>
</html>