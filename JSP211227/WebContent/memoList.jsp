<%@page import="kr.green.memo.vo.PagingVO"%>
<%@page import="kr.green.memo.service.MemoService"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//3개의 파라메터는 받자!!!
	int currentPage = 1;
	try{
		currentPage = Integer.parseInt(request.getParameter("p"));
	}catch(Exception e) { ; }

	int sizeOfPage = 10;
	try{
		sizeOfPage = Integer.parseInt(request.getParameter("s"));
	}catch(Exception e) { ; }

	int sizeOfBlock = 10;
	try{
		sizeOfBlock = Integer.parseInt(request.getParameter("b"));
	}catch(Exception e) { ; }	

	List<MemoVO> list = MemoService.getMemo(application.getRealPath("data"));
	System.out.println(application.getRealPath("data"));
	
	// 이 순간 페이지 계산이 끝난다.
	PagingVO<MemoVO> pagingVO = new PagingVO<>(list.size(), sizeOfPage, sizeOfBlock, currentPage );	
	// System.out.println(pagingVO);
	// 리스트를 넣어준다.
	pagingVO.setList(list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석 게시판</title>
<script type="text/javascript">
	function formCheck(){
		// 이름이 없거나 공백만으로 되어있는지 검사한다.
		var obj = document.getElementById("name");
		if(obj.value==null || obj.value.trim().length==0){
			alert('이름은 반드시 입력하셔야 합니다.');
			obj.value = '';
			obj.focus();
			return false;
		}
		// 비번이 없거나 공백만으로 되어있는지 검사한다.
		var obj = document.getElementById("password");
		if(obj.value==null || obj.value.trim().length==0){
			alert('비밀번호는 반드시 입력하셔야 합니다.');
			obj.value = '';
			obj.focus();
			return false;
		}
		// 내용이 없거나 공백만으로 되어있는지 검사한다.
		var obj = document.getElementById("memo");
		if(obj.value==null || obj.value.trim().length==0){
			alert('내용은 반드시 입력하셔야 합니다.');
			obj.value = '';
			obj.focus();
			return false;
		}
		return true; // 이것은 생략해도 됨
	}
	// 몇개씩보기 처리하는 함수
	function setList(obj){
		var b = obj.value;
		// alert(b);
		location.href = "?p=<%=currentPage%>&s=" + b + "&b=<%=sizeOfBlock%>";
	}
	
	
</script>
<style type="text/css">
	table { width : 1000px; margin: auto; padding:5px;}
	th { padding: 5px; border: 1px solid gray; background-color: silver;}
	.title { border: none; background-color: white; font-size: 22pt; text-align: center;}
	.subtitle { border: none; background-color: white; font-size: 12pt; text-align: right;}
	td { padding: 5px; border: 1px solid gray; }
</style>
</head>
<body>
	<table>
		<tr>
			<th colspan="5" class="title">한줄 메모장 Ver 0.0009</th>
		</tr>
		<tr>
			<th colspan="5" class="subtitle">
				<%=pagingVO.getPageInfo() %>
				<%-- ?개씩 보기를 달아보자 --%>
				<select name="cnt" id="cnt" onchange="setList(this);">
					<option value="5" <%=(pagingVO.getSizeOfPage()==5 ? " selected='selected' ":"") %>> 5개씩보기</option>
					<option value="10" <%=(pagingVO.getSizeOfPage()==10 ? " selected='selected' ":"") %>>10개씩보기</option>
					<option value="20" <%=(pagingVO.getSizeOfPage()==20 ? " selected='selected' ":"") %>>20개씩보기</option>
					<option value="30" <%=(pagingVO.getSizeOfPage()==30 ? " selected='selected' ":"") %>>30개씩보기</option>
					<option value="50" <%=(pagingVO.getSizeOfPage()==50 ? " selected='selected' ":"") %>>50개씩보기</option>
				</select>
			</th>
		</tr>
		<tr>
			<th>No</th>
			<th>작성자</th>
			<th width="50%">memo</th>
			<th>작성일</th>
			<th>IP</th>
		</tr>
		<%
			// 최근글이 위에 와야 하므로 꺼꾸로 돌린다. 1줄당 1개의 글
			// 최근글을 0번에 삽입하면 차례대로 출력해야 한다.
			// for(int i=0;i<list.size();i++){ // 전체 출력
			for(int i=pagingVO.getStartNo();i<=pagingVO.getEndNo();i++){ 
				MemoVO vo = list.get(i); // 글 1개를 가져오자
		%>
			<tr align="center">
				<td><%=String.format("%3d", list.size()-i) %></td>
				<%
					String name = vo.getName();
					name = name.replaceAll("<", "&lt;");
					name = name.replaceAll(">", "&gt;");
					String temp = name;
					if(temp.length()>4){
						temp = temp.substring(0,4) + "...";
					}
				%>
				<td title='<%=name%>'><%=temp %></td>
				<%
					String memo = vo.getMemo();
					memo = memo.replaceAll("<", "&lt;");
					memo = memo.replaceAll(">", "&gt;");
					// 내용의 길이가 30자이사이면 25자만 표시하고 ...을 붙인다.
					temp = memo;
					if(temp.length()>25){
						temp = temp.substring(0,25) + "...";
					}
					// title속성을 주어 전체 내용은 마우스를 올렸을때 풍선도움말로 보이게 한다.
				%>
				<td align="left" title='<%=memo%>'><%=temp %></td>
				<%-- 조건문을 써서  이전녕도는 년-월-일, 현재 연도는 월-일, 오늘은 시:분:초 만 출력하자--%>
				<td><%=vo.getRegDate().split(" ")[1] %></td> 
				<td><%=vo.getIp() %></td>
			</tr>
		<%  } %>
		
		<%-- 페이지 이동을 달자 --%>
		<tr>
			<th colspan="5" class="subtitle" style="text-align: center;"><%=pagingVO.getPageList() %></th>
		</tr>
		
		<%-- 글쓰기 폼을 달아보자!!! --%>
		<tr>
			<td colspan="5" style="border: none;">
				<%-- 
				onsubmit="return formCheck()" : 서버로 전송하기전에 자바스크립트로 전처리를 한다.
				formCheck()함수가 true를 리턴하면 서저로 전송되고 false를 리턴하면 전송되지 않는다.
				 --%>
				<form action="memoOK.jsp" method="post" onsubmit="return formCheck()">
					<input type="text" name="name" id="name" placeholder="작성자" required="required"/>
					<input type="password" name="password" id="password" placeholder="비밀번호" required="required"/>
					<input type="text" name="memo" id="memo" placeholder="내용입력" size="90" required="required"/>
					<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>" />
					<%-- 현재페이지, 블록당 사이즈, 페이지당 사이즈도 숨겨서 넘기자!!! --%>
					<input type="hidden" name="p" value="1" />
					<input type="hidden" name="s" value="<%=pagingVO.getSizeOfPage()%>" />
					<input type="hidden" name="b" value="<%=pagingVO.getSizeOfBlock() %>" />
					<input type="submit" value="저장">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>