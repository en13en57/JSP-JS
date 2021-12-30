<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int currentPage = 1;
try{
	currentPage = Integer.parseInt(request.getParameter("p"));
}catch(Exception e){
	;
}
int sizeOfPage = 10;
try{
	sizeOfPage = Integer.parseInt(request.getParameter("s"));
}catch(Exception e){
	;
}
int sizeOfBlock = 10;
try{
	sizeOfBlock = Integer.parseInt(request.getParameter("b"));
}catch(Exception e){
	;
}
%>