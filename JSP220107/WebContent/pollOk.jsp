<%@page import="kr.green.poll.service.PollService"%>
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
	int poll = Integer.parseInt(request.getParameter("poll"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	// DB에서 글을 읽어와서 투표한 숫자를 바꿔서(1증가시켜) 다시 저장한다.
	PollVO vo = PollService.getInstance().selectByIdx(idx);
	int[] pollCounts = vo.getPollCounts(); // 투표수 배열읽기
	pollCounts[poll]++; // 투표수 증가하기
	vo.setPollCounts(pollCounts); // vo의 값을 갱신
	
	// DB을 수정해 주어야 한다.
	PollService.getInstance().update(vo);
	
	// 4) 결과보기 화면으로 이동한다.
	response.sendRedirect("pollResult.jsp?idx=" + vo.getIdx());
%>
