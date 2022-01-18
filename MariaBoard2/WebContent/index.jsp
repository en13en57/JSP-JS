<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@page import="kr.green.board.vo.BoardVO"%>
<%@page import="kr.green.board.vo.PagingVO"%>
<%@page import="kr.green.board.dao.BoardDAOImpl"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "include.jsp" %>
<%
	PagingVO<BoardVO> pagingVO = BoardServiceImpl.getInstance().selectList(currentPage, pageSize, blockSize);
	request.setAttribute("pv", pagingVO);
	pageContext.forward("indexView.jsp");
	
%>
