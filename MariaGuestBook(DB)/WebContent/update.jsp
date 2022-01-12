<%@page import="kr.green.guest.service.GuestBookService"%>
<%@page import="kr.green.guest.vo.GuestBookVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 넘어온 값 받기 --%>
<%@ include file="include.jsp" %>
<%
	// 수정 할 데이터를 DB에서 읽어 가져온다.
	GuestBookVO vo = GuestBookService.getInstance().selectByIdx(idx);
	// 해당 글번호에 글이 존재하지 않는다면 목록으로 보내자 
	if(vo==null){
		response.sendRedirect("index.jsp");
		return;
	}
	// EL로 출력하기 위해 VO를 request에 저장하자!
	request.setAttribute("vo", vo);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript">
	$(function(){
		$("#backBtn").click(function() {
			location.href='index.jsp?p=<%=currentPage%>&s=<%=pageSize%>&b=<%=blockSize%>';
		});
		// 커서를 비밀번호에 보낸다.
		$("#password").focus();
	});

	function formCheck(){
		var value = $("#password").val();
		if(value==null || value.trim().length==0){
			alert('비밀번호는 반드시 입력하셔야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		var value = $("#content").val();
		if(value==null || value.trim().length==0){
			alert('내용은 반드시 입력하셔야 합니다.');
			$("#content").val("");
			$("#content").focus();
			return false;
		}
	}
</script>
<style type="text/css">
	table { width: 630px; margin: auto; padding: 10px;}
	td{ border: none; padding: 5px; }
	.title {font-size: 20pt; text-align: center;border: none;}
	.sub_title {text-align: right;border: none;}
	.page_list {text-align: center;border: none;}
</style>
</head>
<body>
	<form action="updateOk.jsp" method="post" onsubmit="return formCheck();">
	<table>
		<tr>
			<td colspan="4" class="title">방명록 글수정</td>
		</tr>
		<tr>
			<td align="right">이름</td>
			<td>
				<input type="hidden" name="p" value="<%=currentPage%>"/>
				<input type="hidden" name="s" value="<%=pageSize%>"/>
				<input type="hidden" name="b" value="<%=blockSize%>"/>
				<input type="hidden" name="idx" value="<%=idx%>"/>
				<input type="hidden" name="m" value="2"/>
				<input type="text" name="name" value="${vo.name }" readonly="readonly"/>
			</td>
			<td align="right">비번</td>
			<td>
				<input type="password" name="password" id="password"/>
			</td>
		</tr>
		<tr>
			<td align="right" valign="top">내용</td>
			<td colspan="3">
				<textarea name="content" id="content" cols="86" rows="10">${vo.content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right" style="margin-right: 60pt;">
				<input type="submit"  class="btn btn-outline-danger btn-sm"  value="수정하기" />
				<input type="button"  class="btn btn-outline-danger btn-sm"  value="돌아가기" id="backBtn"/>
			</td>
		</tr>
	</table>
	
	
	</form>
</body>
</html>