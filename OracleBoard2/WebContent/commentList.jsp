<%@page import="com.google.gson.Gson"%>
<%@page import="kr.green.board.service.CommentServiceImpl"%>
<%@page import="kr.green.board.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
   String ref = request.getParameter("ref");
   List<CommentVO> list = null;
   if(ref!=null){
      list = CommentServiceImpl.getInstance().selectList(Integer.parseInt(ref));
   }
   Gson gson = new Gson();
   out.println(gson.toJson(list));
%>