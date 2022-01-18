<%@page import="javax.xml.bind.Marshaller"%>
<%@page import="javax.xml.bind.JAXBContext"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="kr.green.ajax.vo.HanjaVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	// Gson객체 선언
	Gson gson = new Gson();
	// 파일을 읽어 InputStreamReader 객체로 만들기
	InputStreamReader isr = new InputStreamReader(application.getResourceAsStream("chunja.json"));
	// 읽어서 자바 객체로 만들기
	List<HanjaVO> list = gson.fromJson(isr, new TypeToken<List<HanjaVO>>(){}.getType());
	// 번호 받기
	int idx = 0;
	try{
		idx = Integer.parseInt(request.getParameter("idx"))-1;
	}catch(Exception e){
		;
	}
	if(idx<0||idx>1000) idx=0; // 범위 검증
	// 받은 번호의 한자를 JSON로 응답하기
	out.println(gson.toJson(list.get(idx)));
%>