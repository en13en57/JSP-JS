<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.green.memo.service.MemoService"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="kr.green.memo.vo.PagingVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 자주 코딩하는 코드가 있다면 별도로 만들어 놓고 필요시 include하면 편리하다. --%>
<%@ include file="include.jsp" %>
<%
	// 페이지 정보를 얻어오자!!!
	PagingVO<MemoVO> pagingVO = MemoService.getInstance().selectList(currentPage, pageSize, blockSize);
	request.setAttribute("pv", pagingVO); // EL로 출력하기 위해서는 영역에 저장되어야 한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1줄 메모장 프로그램</title>
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
		$("#viewCnt").change(function() { // 값이 바뀌면
			// alert($(this).val()); // 값을 가져온다. 폼태그 val()이고 일반태그는 html() 또는 text()이다.
			location.href = "?p=<%=pagingVO.getCurrentPage()%>&s=" + $(this).val() + "&b=<%=pagingVO.getBlockSize()%>";
		});
		// 처음에는 취소 버튼이 보이지 않는다.
		$("#cancelBtn").css('display','none');
	});
	
	function formCheck(){
		var value = $("#name").val();
		if(value==null || value.trim().length==0){
			alert('이름은 반드시 입력해야 합니다.');
			$("#name").val("");
			$("#name").focus();
			return false;
		}
		var value = $("#password").val();
		if(value==null || value.trim().length==0){
			alert('비밀번호는 반드시 입력해야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		var value = $("#content").val();
		if(value==null || value.trim().length==0){
			alert('내용은 반드시 입력해야 합니다.');
			$("#content").val("");
			$("#content").focus();
			return false;
		}
	}
	
	// 수정 버튼을 누르면
	function updateMemo(idx){
		// 값을 읽는다.
		// alert(idx);
		var name = $("#name"+idx).html();
		var content = $("#content"+idx).attr('title'); // 타이틀 속성의 값을 가져온다.
		// alert(name + "\n" + content);
		// 폼에 값을 넣는다.
		$("#name").val(name);
		$("#content").val(content);
		$("#idx").val(idx);
		
		// 저장 버튼을 "수정"으로 바꾼다.
		$("#submitBtn").val("수정");
		// 폼의 액션값을 "updateOk.jsp"로 바꾼다.
		$("#myForm").attr("action","updateOk.jsp"); // 속성 변경
		// 취소버튼을 보여준다.
		$("#cancelBtn").css('display','inline');
		// 그리고 커서는 비번에 보낸다.
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
	table {padding:5px; width: 900px; margin: auto;}
	th { border: 1px solid gray; background-color: silver; padding:5px;text-align: center;}
	td { border: 1px solid gray; padding:5px;text-align: center;}
	.title{font-size: 18pt; text-align: center;border: none;}
	.sub_title{text-align: right;border: none;}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan="5" class="title">1줄 메모장 Ver 0.09</td>
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
		<tr>
			<th>No</th>
			<th>작성자</th>
			<th width="55%">내용</th>
			<th>작성일</th>
			<th>IP</th>
		</tr>
		<% 
			if(pagingVO.getTotalCount()==0){
		%>
		<tr>
			<td colspan="5" style="text-align: center;">등록된 글이 없습니다.</td>
		</tr>
		<%						
			}else{
				// 번호는 계산을 해서 찍자!!
				// 페이지에 찍을 처음 글번호만 계산해주면 된다.
				// 전체개수 - (현재페이지-1)*페이지당글수
				int no = pagingVO.getTotalCount() - (pagingVO.getCurrentPage()-1) * pagingVO.getPageSize();
				for(MemoVO vo : pagingVO.getList()){
		%>
			<tr>
				<td><%=no-- %></td> <%-- 줄어들면서 번호를 찍어 준다. --%>
				<td>
					<span id="name<%=vo.getIdx()%>"><%=vo.getName() %></span> 
				</td>
				<td style="text-align: left;">
					<span  id="content<%=vo.getIdx()%>" title="<%=vo.getContent()%>" style="cursor: pointer;">
						<%
						String content = vo.getContent();
						// 내용이 20자를 넘으면 잘라서 표시하고 뒤에 ...을 붙인다.
						if(content.length()>=20){
							content = content.substring(0,20) + "...";
						}
						// 태그가 적용되지 않도록 여는태그를 특수문자로 변경해서 출력
						content = content.replaceAll("<", "&lt;");
						
						out.println(content);
						%>
					</span> 
					
					<%-- 수정/삭제 버튼을 달자 --%>
					<input type="button" value="수정" class="btn btn-outline-success btn-sm" onclick="updateMemo(<%=vo.getIdx()%>);"/>
					<input type="button" value="삭제" class="btn btn-outline-success btn-sm" onclick="deleteMemo(<%=vo.getIdx()%>);"/>
				</td>
				<td>
				<% 
				SimpleDateFormat sdf = new SimpleDateFormat("MM-dd hh:mm");
				out.println(sdf.format(vo.getRegDate())); 
				%>
				</td>
				<td><%=vo.getIp() %></td>
			</tr>
		<%		
				}
		%>
			<tr>
				<td colspan="5" style="text-align: center;border: none;">${pv.pageList }</td>
			</tr>
		<%		
			}
		%>
		<%-- 글쓰기 폼을 달아보자!!! --%>
		<tr>
			<td colspan="5" style="border: none;">
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