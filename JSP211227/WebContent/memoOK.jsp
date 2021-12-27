<%@page import="kr.green.memo.service.MemoService"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- 1. POST전송일때만 처리해준다. --%>
<%
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("memoList.jsp");
		return;
	}
%>
<%-- 2. 데이터를 받는다. --%>
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
/*
String name = request.getParameter("name");
String password = request.getParameter("password");
String memo = request.getParameter("memo");
String ip = request.getParameter("ip");
if(ip==null || ip.trim().equals("")) ip = request.getRemoteAddr(); // 폼에서 숨겨서 보내지 않았다면
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String regDate = sdf.format(new Date()); // 저장시간이 작성시간이다.

// 데이터의 유효성을 검증해 주어야 한다.
if(name==null || name.trim().length()==0 
   || password==null || password.trim().length()==0
   || memo==null || memo.trim().length()==0){
	// 이름, 암호, 내용중에 하나라도 빈문자열이나 값이 존재하지 않는다면 저장하지 말고 리스트로 가자
	response.sendRedirect("memoList.jsp");
	return;
}
// 이름이나 내용중에 태그가 입력되어 있다면 태그를 무효화 시켜야 한다.
// < 를 &lt;로 바꾸고 >를 &gt;로 바꿔 준다.
name = name.replaceAll("<", "&lt;");
name = name.replaceAll(">", "&gt;");
memo = memo.replaceAll("<", "&lt;");
memo = memo.replaceAll(">", "&gt;");

MemoVO vo = new MemoVO();
vo.setName(name);
vo.setPassword(password);
vo.setMemo(memo);
vo.setRegDate(regDate);
vo.setIp(ip);
*/
%>
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

<%-- JSP에서 VO를 만들어 놓았다면 VO로 합번에 받을 수 있다. 자료형변환도 자동으로 이루어 진다. --%>
<jsp:useBean id="vo" class="kr.green.memo.vo.MemoVO"/> <%-- MemoVO vo = new MemoVO(); 로 변경된다.  --%>
<%-- vo.setName(request.getParameter("name")와 같다.
<jsp:setProperty property="name" name="vo"/> 
 모든 Setter를 한번에 부를 수 도 있다.
 --%>
<jsp:setProperty property="*" name="vo"/>
<%-- 넘어오지 않은 데이터는 수동으로 채워준다. --%>
<jsp:setProperty property="ip" name="vo" value="<%=request.getRemoteAddr() %>"/>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String regDate = sdf.format(new Date()); // 저장시간이 작성시간이다.
vo.setRegDate(regDate);
%> 
 


<%-- 3. 받은 데이터를 저장한다. --%>
<%
	MemoService.setMemo(application.getRealPath("data"), vo);
%>
<%-- 4. 목록으로 돌아간다. --%>
<%
	response.sendRedirect("memoList.jsp?p=" + currentPage + "&s=" + sizeOfPage + "&b=" + sizeOfBlock);
%>
</body>
</html>