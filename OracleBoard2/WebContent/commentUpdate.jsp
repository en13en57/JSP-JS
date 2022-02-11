<%@page import="kr.green.board.service.CommentServiceImpl"%>
<%@page import="kr.green.board.service.CommentService"%>
<%@page import="kr.green.board.vo.CommentVO"%>
<%@ page contentType="text/palin; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String name = request.getParameter("name");
String password = request.getParameter("password");
String content = request.getParameter("content");
String idx = request.getParameter("idx");

CommentVO commentVO = new CommentVO();

commentVO.setName(name);
commentVO.setPassword(password);
commentVO.setContent(content);
commentVO.setIdx(Integer.parseInt(idx));
commentVO.setIp(request.getRemoteAddr());

System.out.println(commentVO);

CommentServiceImpl.getInstance().update(commentVO);
out.println(1);
%>