<%@page import="kr.green.board.service.CommentServiceImpl"%>
<%@page import="kr.green.board.service.CommentService"%>
<%@page import="kr.green.board.vo.CommentVO"%>
<%@ page contentType="text/palin; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String name = request.getParameter("name");
String password = request.getParameter("password");
String content = request.getParameter("content");
String ref = request.getParameter("ref");

CommentVO commentVO = new CommentVO();

commentVO.setName(name);
commentVO.setPassword(password);
commentVO.setContent(content);
commentVO.setRef(Integer.parseInt(ref));
commentVO.setIp(request.getRemoteAddr());

System.out.println(commentVO);

CommentServiceImpl.getInstance().insert(commentVO);
out.println(1);
%>