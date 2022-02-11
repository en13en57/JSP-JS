<%@page import="kr.green.board.service.CommentServiceImpl"%>
<%@page import="kr.green.board.service.CommentService"%>
<%@page import="kr.green.board.vo.CommentVO"%>
<%@ page contentType="text/palin; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String password = request.getParameter("password");
String idx = request.getParameter("idx");

CommentVO commentVO = new CommentVO();

commentVO.setPassword(password);
commentVO.setIdx(Integer.parseInt(idx));

System.out.println(commentVO);

CommentServiceImpl.getInstance().deleteByIdx(commentVO);
out.println(1);
%>