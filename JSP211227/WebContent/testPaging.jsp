<%@page import="kr.green.memo.vo.PagingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		// 3개의 파라메터는 받자!!!
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
	
	
		// 글이 327개 있다고 가정
		List<String> list = new ArrayList<>();
		for(int i=0;i<327;i++) list.add((327-i) + "번째 글입니다.");	
		// 이 순간 페이지 계산이 끝난다.
		PagingVO<String> pagingVO = new PagingVO<>(list.size(), sizeOfPage, sizeOfBlock, currentPage );	
		System.out.println(pagingVO);
		// 리스트를 넣어준다.
		pagingVO.setList(list);
		
	%>
	전체 : <%=pagingVO.getTotalCount() %>개(<%=pagingVO.getCurrentPage() %>/<%=pagingVO.getTotalPage() %>Page) <br />
	<%=pagingVO.getPageInfo() %> <br />
	<hr />
	<%
		for(int i=pagingVO.getStartNo();i<=pagingVO.getEndNo();i++){
			out.println(i + ". " + list.get(i) + "<br>");
		}
	%>
	<%-- 하단에 페이지 이동 링크를 표시하자!!! --%>
	<%
		if(pagingVO.getStartPage()>1){ // 시작페이지 번호가 1보다 크다면 "이전"이 있다.
	%>
		[<a href="?p=<%=pagingVO.getStartPage()-1%>&s=<%=sizeOfPage%>&b=<%=sizeOfBlock%>">이전</a>]
	<%		
		}
	%>
	<%
		// 페이지 번호를 출력해 보자
		for(int i=pagingVO.getStartPage();i<=pagingVO.getEndPage();i++){
			if(i!=pagingVO.getCurrentPage()){
	%>
				[<a href="?p=<%=i%>&s=<%=sizeOfPage%>&b=<%=sizeOfBlock%>"><%=i %></a>]
	<%       }else{ %>
				[<%=i %>]
	<%  	 }
		} 
	%>
	<%
		if(pagingVO.getEndPage()<pagingVO.getTotalPage()){ // 끝페이지 번호가 전체페이지수 보다 적다면 "다음"이 있다.
	%>
		[<a href="?p=<%=pagingVO.getEndPage()+1%>&s=<%=sizeOfPage%>&b=<%=sizeOfBlock%>">다음</a>]
	<%		
		}
	%>
	<hr />
	<%=pagingVO.getPageList() %>
	
	
	
</body>
</html>