<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@page import="kr.green.board.vo.BoardVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 공통코드 삽입 --%>
<%@ include file="include.jsp" %>
<%
	// 1개 분량의 글을 얻어온다.
	BoardVO boardVO = BoardServiceImpl.getInstance().selectByIdx(idx, incHit);
	if(boardVO==null){ //해당글이 없다면
		response.sendRedirect("index.jsp");
		return;
	}
	request.setAttribute("vo", boardVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용보기</title>
<%-- axicon 사용하기 --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/axicon/axicon.min.css" />
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<%-- 날짜 관리 자바스크립트 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>

<%-- 사용자 정의 자바스크립트 함수를 추가한다. --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
<script type="text/javascript">
	$(function(){
		readComments();
	});

	function replaceAll(str, searchStr, replaceStr) {
		   return str.split(searchStr).join(replaceStr);
		}

	function readComments(){
		// 문서를 모두 읽은 다음에 댓글을 Ajax로 읽어와서 출력해주자
		$.ajax("commentList.jsp",{
			data : {ref:${vo.idx}},		
			method : "GET",
			dataType : "json",
			success : function(data){
				alert(JSON.stringify(data));
				if(data.length>0){
					// alert('댓글있다.');
					// 반복해서 아래 댓글이 표시될 위치에 데이터를 넣어주면 된다.
					var content = "";					
					$.each(data, function(index, item){
						content += "<div class='comment'><div class='comment_head'>";
						content += item.name + "님이 " + item.ip + "에서 ";
						content += moment(item.regDate).format("YYYY년 MM월 DD일(ddd), h:mm:ss") + "에 남긴글 ";
						content += "<button class='btn btn-outline-danger btn-sm' onclick=\"updateComment('" +item.idx+ "','"+item.name+"')\" >수정</button> ";
						content += "<button class='btn btn-outline-danger btn-sm' onclick=\"deleteComment('" +item.idx+ "','"+item.name+"')\" >삭제</button> ";
						content += "</div>";
						content += "<div id='c"+ item.idx +"'>";
						content += replaceAll(replaceAll(item.content,"<","&lt;"), "\n", "<br>");
						content += "</div></div>";
					});
					$("#commentBox").html(content);
				}
			},
			error : function(){
				alert("에러!!!")
			}
		});
	}
	// 리스트의 수정버튼 눌렀을때
	function updateComment(idx, name){
		// alert('수정\n' + idx + ":" + name);
		$("#submitBtn").html("수정");
		$("#cancelBtn").css('display','inline');
		$("#idx").val(idx);
		$("#name").val(name);
		var content = $('#c'+idx).html();
		content = replaceAll(content, "<br>","\n");
		content = replaceAll(content, "&lt;","<");
		content = replaceAll(content, "&gt;",">");
		$("#content").val(content);
	}
	// 리스트의 삭제버튼 눌렀을때
	function deleteComment(idx, name){
		// alert('삭제\n' + idx + ":" + name);
		$("#submitBtn").html("삭제");
		$("#cancelBtn").css('display','inline');
		$("#idx").val(idx);
		$("#name").val(name);
		var content = $('#c'+idx).html();
		content = replaceAll(content, "<br>","\n");
		content = replaceAll(content, "&lt;","<");
		content = replaceAll(content, "&gt;",">");
		$("#content").val(content);
	}
	// 취소버튼 눌렀을때
	function resetComment(){
		$("#submitBtn").html("저장");
		$("#cancelBtn").css('display','none');
		$("#idx").val(0);
		$("#name").val("");
		$("#password").val("");
		$("#content").val("");
	}
	// 폼의 저장/수정/삭제 버튼 눌렀을때
	function update(){
		var idx = $("#idx").val();
		var ref = $("#ref").val();
		var name = $("#name").val();
		if(name==null || name.trim().length==0){
			alert('이름은 반드시 입력해야 합니다.');
			$("#name").val("");
			$("#name").focus();
			return false;
		}
		var password = $("#password").val();
		if(password==null || password.trim().length==0){
			alert('비밀번호는 반드시 입력해야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		var content = $("#content").val();
		if(content==null || content.trim().length==0){
			alert('내용은 반드시 입력해야 합니다.');
			$("#content").val("");
			$("#content").focus();
			return false;
		}
		// 저장이라면
		// alert($("#submitBtn").html());
		if($("#submitBtn").html()=="저장"){
			// alert(name + "\n" + password + "\n" + content);
			// Ajax를 호출하여 데이터를 저장하고
			$.ajax("commentInsert.jsp", {
				data : {"name":name,"password":password,"content":content,"ref":ref},			
				method : "GET",
				success : function(data){
					alert("댓글저장 성공 : ");				
					// 댓글 목록을 다시 읽어온다.
					readComments();
					// 폼을 비운다.
					$("#idx").val(0);
					$("#name").val("");
					$("#password").val("");
					$("#content").val("");
				},
				error : function(){
					alert("에러!!!")
				}
			});
		}
		if($("#submitBtn").html()=="수정"){
			// alert(name + "\n" + password + "\n" + content);
			// Ajax를 호출하여 데이터를 저장하고
			$.ajax("commentUpdate.jsp", {
				data : {"password":password,"content":content,"idx":idx},			
				method : "GET",
				success : function(data){
					alert("댓글수정 성공");				
					// 댓글 목록을 다시 읽어온다.
					readComments();
					// 폼을 비운다.
					$("#idx").val(0);
					$("#name").val("");
					$("#password").val("");
					$("#content").val("");
					$("#submitBtn").html("저장");
					$("#cancelBtn").css('display','none');
				},
				error : function(){
					alert("에러!!!")
				}
			});
		}
		if($("#submitBtn").html()=="삭제"){
			// alert(name + "\n" + password + "\n" + content);
			// Ajax를 호출하여 데이터를 저장하고
			$.ajax("commentDelete.jsp", {
				data : {"password":password,"idx":idx},			
				method : "GET",
				success : function(data){
					alert("댓글삭제 성공");				
					// 댓글 목록을 다시 읽어온다.
					readComments();
					// 폼을 비운다.
					$("#idx").val(0);
					$("#name").val("");
					$("#password").val("");
					$("#content").val("");
					$("#submitBtn").html("저장");
					$("#cancelBtn").css('display','none');
				},
				error : function(){
					alert("에러!!!")
				}
			});
		}
		
		
	}
</script>
<style type="text/css">
	table { width: 800px; margin: auto; padding: 5px;}
	th {padding: 5px; border: 1px solid gray; background-color: silver;text-align: center;}
	td {padding: 5px; border: 1px solid gray; }
	.title {border: none; font-size: 20pt; text-align: center;}
	.item { width: 100px; background-color: silver; text-align: right;}
	/* 링크의 모양을 변경한다. */
	a:link 		{ color: black; text-decoration: none;} /* 링크가 걸린모양 */
	a:visited 	{ color: black; text-decoration: none;} /* 방문했던 링크 */
	a:hover 	{ color: black; text-decoration: none; font-weight: bold;} /* 마우스오버시 모양 */
	a:active 	{ color: orange; text-decoration: none;} /* 마우스 클릭시 모양 */
	.comment {	border: 1px solid gray; padding : 5px; margin-bottom: 5px;	}
	.comment_head {	border: 1px solid gray; padding : 5px; background-color: pink; font-size: 10pt;	}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan="4" class="title">게시판 내용보기</td>
		</tr>
		<tr>
			<td class="item">이름</td>
			<td colspan="3">
				<c:out value="${vo.name }"></c:out>
			</td>
		</tr>
		<tr>
			<td class="item">작성일</td>
			<td>
				<fmt:formatDate value="${vo.regDate }" pattern="yyyy년 MM월 dd일(E요일) hh:mm:ss"/>
			</td>
			<td class="item">IP(조회수)</td>
			<td>${vo.ip }(${vo.hit }회)</td>
		</tr>
		<tr>
			<td class="item">제목</td>
			<td colspan="3">
				<c:out value="${vo.subject }"></c:out>
			</td>
		</tr>
		<tr>
			<td class="item" valign="top">내용</td>
			<td colspan="3">
				<c:out value="${vo.content }" escapeXml="false"/>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border: none;text-align: right;">
				<button class="btn btn-outline-success btn-sm" 
				onclick='sendPost("update.jsp",{"p":${p},"s":${s },"b":${b },"idx":${idx },"h":0})'>수정</button>
				<button class="btn btn-outline-success btn-sm" 
				onclick='sendPost("delete.jsp",{"p":${p},"s":${s },"b":${b },"idx":${idx },"h":0})'>삭제</button>
				<button class="btn btn-outline-success btn-sm" 
				onclick='sendPost("index.jsp",{"p":${p},"s":${s },"b":${b }})'>목록</button>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border: none;">
					<input type="hidden" name="idx" id="idx" value="0"/>
					<input type="hidden" name="ref" id="ref" value="${vo.idx }"/>
					<br />
					<input type="text" name="name" id="name" placeholder="이름입력" required="required" />
					<input type="password" name="password" id="password" placeholder="비번입력" required="required" style="margin-bottom: 5px;" />
					<br/>
					<textarea name="content" id="content" cols="110" rows="5" placeholder="내용입력" required="required"></textarea>
					<div style="text-align: right;margin-top:5px; ">
						<button id="submitBtn"  class="btn btn-outline-danger btn-sm" onclick="update()">저장</button>
						<button id="cancelBtn" style="display: none;"  class="btn btn-outline-danger btn-sm" onclick="resetComment()">취소</button>
					</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border: none;">
				<div id="commentBox">
				
				</div>
			</td>
		</tr>
		
	</table>
</body>
</html>