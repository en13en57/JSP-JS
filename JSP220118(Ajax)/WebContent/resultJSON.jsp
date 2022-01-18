<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	Gson gson = new Gson();
	JsonObject obj = new JsonObject();
	obj.addProperty("name", "한사람");
	obj.addProperty("age", 32);
	obj.addProperty("gender", false);
	out.println(gson.toJson(obj));
%>