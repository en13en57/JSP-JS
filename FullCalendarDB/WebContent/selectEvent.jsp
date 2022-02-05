<%@page import="com.google.gson.Gson"%>
<%@page import="kr.green.cal.service.CalendarService"%>
<%@page import="kr.green.cal.vo.CalendarVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	List<CalendarVO> list = CalendarService.getInstance().selectList();
	Gson gson = new Gson();
	out.println(gson.toJson(list));
%>
