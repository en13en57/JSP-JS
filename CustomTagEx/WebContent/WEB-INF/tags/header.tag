<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="true"%>
<%@ attribute name="size" type="java.lang.Integer" %>
<%
	if(size==null) size = 1;
	switch(size){
	case 1:
		out.println("<h1>" + title + "</h1>");
		break;
	case 2:
		out.println("<h2>" + title + "</h2>");
		break;
	case 3:
		out.println("<h3>" + title + "</h3>");
		break;
	default:
		out.println("<h4>" + title + "</h4>");
		break;
	}
%>