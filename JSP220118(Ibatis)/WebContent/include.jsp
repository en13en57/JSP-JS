<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//현재 페이지 번호를 받자
int currentPage = 1;
try {
	currentPage = Integer.parseInt(request.getParameter("p"));
} catch (Exception e) {
	;
}
//페이지당 글 수의 개수를 받자
int pageSize = 10;
try {
	pageSize = Integer.parseInt(request.getParameter("s"));
} catch (Exception e) {
	;
}
//페이지 리스트 개수를 받자
int blockSize = 10;
try {
	blockSize = Integer.parseInt(request.getParameter("b"));
} catch (Exception e) {
	;
}
%>