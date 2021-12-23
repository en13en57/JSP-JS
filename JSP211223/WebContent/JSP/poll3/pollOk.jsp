<%@page import="java.util.List"%>
<%@page import="kr.green.poll.vo.PollUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="kr.green.poll.vo.PollVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 한글을 받으려면 인코딩 타입 지정해 주어야 한다.
	request.setCharacterEncoding("UTF-8");

	// POST전송이 아니면 폼으로 다시 보내버린다. 
	// 이코드가 없으면 이파일을 직접 실행했을때 넘어오지 않은 데이터를 
	// 처리하기때문에 에러가 발생할 소지가 다분하다. 
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("pollList.jsp"); // 지정 페이지로 무조건 이동하라.
		return; // 여기서 종료!!
	}

	// 넘어온 값을 받아보자!!!
	int poll = Integer.parseInt(request.getParameter("poll")); // 투표번호
	String pollNo = request.getParameter("no"); // 파일번호
	
	int no = 0;
	try{
		no = Integer.parseInt(pollNo);
	}catch(Exception e){
		; // 번호가 없거나 숫자가 아니면 0번을 가진다.
	}
	// 투표들이 배열로 저장된 파일을 읽어보자!!!
	List<PollVO> list = PollUtil.readPollList(application.getRealPath("poll"));
	PollVO pollVO = list.get(no);
	
	// 2) 투표한 항목의 투표수를 1 증가 시키고 
	pollVO.getCounts().set(poll, pollVO.getCounts().get(poll)+1);
	list.set(no, pollVO);
	
	// 3) 다시 저장한다.
	PollUtil.savePollList(application.getRealPath("poll"), list);

	// 4) 결과보기 화면으로 이동한다.
	response.sendRedirect("pollResult.jsp?no=" + no);
%>
